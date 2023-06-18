# 前言

[](https://bs.zhxu.cn/)
是一个轻量级数据库条件检索引擎，不依赖具体的Web和ORM框架，专门用于弥补其他ORM框架在`列表搜索领域`的不足

相比较其他ORM框架，Bean Searcher是一个只读ORM，不能增删改，

官方表示它的`多表映射机制`与`动态字段运算符`可以大大提高检索效率

个人偏向对代码低侵入性，所以只用 Bean Searcher 做一些表单查询。README没涉及的部分就是个人觉得不重要的部分

# 运行本示例

本项目数据库使用 H2
数据库，无需配置，直接运行[启动类](./src/main/java/com/orion/demo/orm/beansearcher/DemoOrmBeanSearcherApplication.java)
即可。由于当 H2 数据库使用 `user` 作为表名时，会报 `expected "identifier"` (表名使用了关键字)，所以本 demo 项目类名 `User`
改为 `UserInfo`，数据库表名变更为 `user_info` (当然，README 保持原样)

接口文档：[http://localhost:8080/doc.html](http://localhost:8080/doc.html)

推荐测试 tag 字段 (数据较为多样)

# 学习 Bean Searcher

官方文档写挺好的，就是排序有点乱

## 快速开始

先导包

```xml

<dependency>
    <groupId>cn.zhxu</groupId>
    <artifactId>bean-searcher-boot-starter</artifactId>
    <version>4.2.0</version>
</dependency>
```

在 Springboot 项目，导完包就能直接用Bean Searcher了，在此之前，我们先开个 Bean Searcher 日志

开启日志：

```yaml
  logging:
  level:
  cn.zhxu.bs: DEBUG
```

下面是一个代码示例

```java

@RestController
@RequestMapping("/user")
@Api(tags = "用户管理相关接口")
public class UserController {

    /**
     * 注入 Map 检索器，它检索出来的数据以 Map 对象呈现
     */
    @Autowired
    private MapSearcher mapSearcher;

    @GetMapping("list")
    public Map<String, Object> testSelectList(User user, @ApiParam("要排序的字段名称") String sortField, @ApiParam("asc / desc") String order, Integer page, Integer size) {
        // 一行代码，实现一个用户检索接口（MapUtils.flat 只是收集前端的请求参数）
        return mapSearcher.search(User.class, MapUtils.builder()
                // 接受可变长参数，这里写几个意思意思
                .onlySelect(User::getId, User::getUsername, User::getPhone, User::getTags)
                // field()写查询字段，op()写查询规则，ic()是要不要忽略大小写
                .field(User::getId, user.getId()).op(Equal.class)
                .field(User::getUsername, user.getUsername()).op(Contain.class).ic(true)
                // sortField-要排序的字段，order-排序规则，esc或者desc
                .orderBy(sortField, order)
                // page和size
                .page(page != null ? page : 0, size != null ? size : 15)
                .build()
        );
    }
}

```

---

## 官方文档传送门

- [查询示例](https://bs.zhxu.cn/guide/latest/simples.html#%E6%9F%A5%E8%AF%A2%E6%96%B9%E6%B3%95)

- [字段运算符](https://bs.zhxu.cn/guide/latest/params.html#%E5%AD%97%E6%AE%B5%E8%BF%90%E7%AE%97%E7%AC%A6)，就是
  equal，contain，大于小于非空，开头结尾那些啥的

- 对于`只返回 20 <= age <= 30 的数据`，参数 `age-0=20` 表示 `age` 的第 0 个参数值是 `20`。上文中提到的 `age=20` 实际上是
  `age-0=20` 的简写形式。 参数名 `age-0` 与 `age-1`
  中的连字符 `-` [可自定义](https://bs.zhxu.cn/guide/latest/params.html#%E5%AD%97%E6%AE%B5%E8%A1%8D%E7%94%9F%E8%A7%84%E5%88%99)。

- [指定 select 字段](https://bs.zhxu.cn/guide/latest/params.html#%E6%8C%87%E5%AE%9A-select-%E5%AD%97%E6%AE%B5) 用于优化查询

- [风控参数](https://bs.zhxu.cn/guide/latest/params.html#%E9%A3%8E%E6%8E%A7%E5%8F%82%E6%95%B0) 用于防止用户爬取数据和节省数据库资源

- [运算符约束](https://bs.zhxu.cn/guide/latest/advance.html#%E8%BF%90%E7%AE%97%E7%AC%A6%E7%BA%A6%E6%9D%9F)
  可以限制某个字段不能进行某些匹配，同时[条件约束](https://bs.zhxu.cn/guide/latest/advance.html#%E6%9D%A1%E4%BB%B6%E7%BA%A6%E6%9D%9F)
  可以限制某个字段永不参与 where 条件

- 动态检索

    -
  现阶段暂时用不上[分库分表时的检索](https://bs.zhxu.cn/guide/latest/simples.html#%E5%88%86%E8%A1%A8%E6%A3%80%E7%B4%A2)
    - [动态检索字段](https://bs.zhxu.cn/guide/latest/bean.html#%E5%B5%8C%E5%85%A5%E5%88%B0-dbfield)不明白是啥意思，感觉是字段映射

其他感觉没啥用