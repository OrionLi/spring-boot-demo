# 说明

README
参考自官方文档，暂不涉及 [6.2.集合映射策略](https://mapstruct.org/documentation/stable/reference/html/#collection-mapping-strategies)
及后面的部分。更多详情请参考官方文档

MapStruct 可用于 Java 9 及更高版本，本项目使用 Java 17 构建

基于 MapStruct 的示例代码在 com.orion.demo.mapping.mapstruct.mapping 的 CarMapperTest 类中

当同时使用 Lombok 和 MapStruct 时，请在 pom.xml 中添加

```xml

<build>
    <plugins>
        <plugin>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-maven-plugin</artifactId>
        </plugin>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-compiler-plugin</artifactId>
            <configuration>
                <annotationProcessorPaths>
                    <!-- Lombok 在编译时会通过这个插件生成代码 -->
                    <path>
                        <groupId>org.projectlombok</groupId>
                        <artifactId>lombok</artifactId>
                        <version>${lombok.version}</version>
                    </path>
                    <!-- MapStruct 在编译时会通过这个插件生成代码 -->
                    <path>
                        <groupId>org.mapstruct</groupId>
                        <artifactId>mapstruct-processor</artifactId>
                        <version>${org.mapstruct.version}</version>
                    </path>
                </annotationProcessorPaths>
            </configuration>
        </plugin>
    </plugins>
</build>
```

同时，springboot 项目使用 MapStruct 写的接口时，如果要用依赖注入的方式使用接口的实现类，MapStruct的映射接口的 `@Mapper`
注解应改为 `@Mapper(componentModel = "spring")`

如果还是出错，运行一次 maven 的 clean

# 为什么要使用 MapStruct？

- 代码自动生成：MapStruct 是一种基于注解的代码生成器，可以根据定义好的映射关系，在编译时自动生成对应的转换器代码。这样可以避免手动编写大量重复和冗余的映射代码，提高开发效率。
- 映射逻辑清晰：在手动编写 Getter 和 Setter 时，可能存在多个属性之间需要进行一些复杂的转换或处理的情况，这会导致类的代码变得臃肿难以阅读。而在使用
  MapStruct 的情况下，可以通过在 Mapper 接口上定义自定义方法来实现复杂的转换逻辑，从而使映射逻辑更加清晰和易于维护。同时，在
  Mapper 接口中，也可以方便地集中管理各个属性之间的映射关系。
- 扩展性强：MapStruct 提供了丰富的方法转换器和注解，可以轻松地支持不同类型之间的映射和转换，同时也很容易扩展和定制化。此外，MapStruct
  还支持通过插件的方式来增强其功能。

综上所述，虽然手动编写 Getter 和 Setter 可能会更加灵活，但在实际开发中，为了提高开发效率、代码可读性以及可维护性，使用
MapStruct 是一种更为推荐的方式。

# 使用 MapStruct 和手动使用 Getter 和 Setter，哪个运行效率高？

在运行效率方面，手动编写 Getter 和 Setter 和使用 MapStruct 生成代码的运行效率差别不大，因为实际上它们最终使用的都是
JavaBean 的标准方式进行数据封装和解封。由于 MapStruct 是在编译时生成对应的转换器代码，可以避免运行时反射带来的性能损耗。而手动编写
Getter 和 Setter 方法，在运行时需要依赖于 Java 的反射机制来获取和设置属性值，虽然这个过程已经高度优化，但仍然存在一定的性能损耗。

不过需要注意的是，在某些特定的场景下，手动编写 Getter 和 Setter 可能会比使用 MapStruct
更加灵活，并且可以更好地根据实际需求进行优化。所以具体情况还需要根据实际情况进行选择。

# 使用后的效果是怎样的？

对于下面的接口

```java

@Mapper
public interface CarMapper {

    @Mapping(target = "manufacturer", source = "make")
    @Mapping(target = "seatCount", source = "numberOfSeats")
    CarDto carToCarDto(Car car);

    @Mapping(target = "fullName", expression = "java(person.getFirstName() + \" \" + person.getLastName())")
    PersonDto personToPersonDto(Person person);
}

```

MapStruct 生成的实现是

```java
public class CarMapperImpl implements CarMapper {

    @Override
    public CarDto carToCarDto(Car car) {
        if (car == null) {
            return null;
        }

        CarDto carDto = new CarDto();

        if (car.getFeatures() != null) {
            carDto.setFeatures(new ArrayList<String>(car.getFeatures()));
        }
        carDto.setManufacturer(car.getMake());
        carDto.setSeatCount(car.getNumberOfSeats());
        carDto.setDriver(personToPersonDto(car.getDriver()));
        carDto.setPrice(String.valueOf(car.getPrice()));
        if (car.getCategory() != null) {
            carDto.setCategory(car.getCategory().toString());
        }
        carDto.setEngine(engineToEngineDto(car.getEngine()));

        return carDto;
    }

    @Override
    public PersonDto personToPersonDto(Person person) {
        if (person == null) {
            return null;
        }

        PersonDto personDto = new PersonDto();

        personDto.setFullName(person.getFirstName() + " " + person.getLastName());
        personDto.setAge(person.getAge());

        return personDto;
    }

    private EngineDto engineToEngineDto(Engine engine) {
        if (engine == null) {
            return null;
        }

        EngineDto engineDto = new EngineDto();

        engineDto.setHorsePower(engine.getHorsePower());
        engineDto.setFuel(engine.getFuel());

        return engineDto;
    }
}
```

# 我的映射实现可能比较复杂，怎么手动实现？

```java

@Mapper
public interface CarMapper {

    @Mapping(target = "manufacturer", source = "make")
    @Mapping(target = "seatCount", source = "numberOfSeats")
    CarDto carToCarDto(Car car);

    default PersonDto personToPersonDto(Person person) {
        // 手写映射逻辑
    }
}
```

MapStruct 生成的类实现方法 `carToCarDto()`，生成的代码在`carToCarDto()`将调用手动实现的`personToPersonDto()`
映射时的方法`driver`属性。

# 怎么将多个实体组合成一个DTO(数据传输对象)

```java

@Mapper
public interface AddressMapper {

    @Mapping(target = "description", source = "person.description")
    @Mapping(target = "houseNumber", source = "address.houseNo")
    DeliveryAddressDto personAndAddressToDeliveryAddressDto(Person person, Address address);
}
```

- 如果多个源对象定义同名属性，则必须使用 `@Mapping` 注释如图所示 `description` 示例中的属性。 如果未解决此类歧义，则会引发错误。
- 当有一个源对象只包含一次的属性时，MapStruct 会自动选择将其映射到目标对象中相应的属性。在这种情况下，不需要使用 @Mapping
  注释来明确指定它要被映射到哪个属性上，因为 MapStruct 可以自动确定。

直接引用方法参数也是可以的：

```java

@Mapper
public interface AddressMapper {

    @Mapping(target = "description", source = "person.description")
    @Mapping(target = "houseNumber", source = "hn")
    DeliveryAddressDto personAndAddressToDeliveryAddressDto(Person person, Integer hn);
}
```

在上面示例，参数 hn 直接映射到 houseNumber

# 怎么把 source 的几个 bean 属性映射到目标的同名属性上

如果你不想显式地命名嵌套源bean中的所有属性，你可以使用.作为目标。 这将告诉MapStruct将每个属性从源bean映射到目标对象。

```java

@Mapper
public interface CustomerMapper {

    @Mapping(target = "name", source = "record.name")
    @Mapping(target = ".", source = "record")
    @Mapping(target = ".", source = "account")
    Customer customerDtoToCustomer(CustomerDto customerDto);
}
```

在示例中，

- `@Mapping(target = "name", source = "record.name")` 将 `CustomerDto` 对象的 `name` 属性映射到 `Customer` 对象的 `name`
  属性上，
- `@Mapping(target = ".", source = "record")` 将 `CustomerDto` 对象的 `record` 属性映射到 `Customer` 对象的同名属性上。
- `@Mapping(target = ".", source = "account")` 则将 `CustomerDto` 对象的 `account` 属性映射到 `Customer` 对象的同名属性上。

# 能不能直接将对象属性直接映射到我现成的实例，而不是 MapStruct 帮我 new 一个 ？

如果不需要创建目标类型的新实例，而是更新该类型的现有实例的映射。
这种映射可以通过为目标对象添加一个参数并将该参数标记为 `@MappingTarget` 来实现。下面显示了一个示例：

```java

@Mapper
public interface CarMapper {

    void updateCarFromDto(CarDto carDto, @MappingTarget Car car);
}
```

要注意的是，可以通过 `@Mapper(collectionMappingStrategy = CollectionMappingStrategy.下面枚举的某个策略)`
来修改映射策略（默认 `ACCESSOR_ONLY` ）

无论选择何种 CollectionMappingStrategy 策略，都会将源集合或映射中的元素映射至目标集合或映射属性中

| CollectionMappingStrategy | 更新现有目标Bean且目标属性不为空时的映射行为                 |
|---------------------------|------------------------------------------|
| ACCESSOR_ONLY（默认）         | 通过 setter 先清空原有要被映射的值，再用源集合或映射中的值填充目标属性。 |
| ADDER_PREFERRED           | 不清空原有值，源集合或映射中的元素会被追加到原有值之后              |
| TARGET_IMMUTABLE          | 不清空原有值，而是直接覆盖原有值（和ACCESSOR_ONLY效果一样）     |

需要注意的是，在使用 `CollectionMappingStrategy.ADDER_PREFERRED` 时，若目标属性不支持添加器方法（如 `addAll()`
方法），则不会有任何值被填充至目标属性中，此时可以选择使用另一种策略，或者手动为目标Bean创建新的实例，再进行赋值操作。

# MapStruct 认得 @Builder 吗

如果某个类型存在构建器，则该构建器将用于映射

可通过@Builder#disableBuilder关闭生成器检测。MapStruct将在禁用构建器的情况下使用常规getter/setter。

如果有多个构建方法，MapStruct将查找名为build的方法（如果存在） 则将使用该值，否则将产生编译错误

# 可不可以通过 Map 转 Bean？

可以，但 Map 的 key 必须是 String ：`Map<String, ???>`

示例代码：
用于将map映射到bean的示例类

```java
public class Customer {

    private Long id;
    private String name;

    //getters and setter omitted for brevity
}

@Mapper
public interface CustomerMapper {

    @Mapping(target = "name", source = "customerName")
    Customer toCustomer(Map<String, String> map);

}
```

编译生成的映射器用于将map映射到bean，大概长这样：

```java
// GENERATED CODE
public class CustomerMapperImpl implements CustomerMapper {

    @Override
    public Customer toCustomer(Map<String, String> map) {
        // ...
        if (map.containsKey("id")) {
            customer.setId(Integer.parseInt(map.get("id")));
        }
        if (map.containsKey("customerName")) {
            customer.setName(map.get("customerName"));
        }
        // ...
    }
}
```

# 数据类型转换

## 隐式类型转换

MapStruct在许多情况下自动处理类型转换。例如，如果一个属性在源bean中的类型是int，而在目标bean中的类型是String，那么生成的代码将分别通过调用String#valueOf(
int)和Integer#parseInt(String)来透明地执行转换。

当前自动应用以下转换：

- 在所有Java原始数据类型和它们对应的包装器类型之间，例如int~Integer、boolean~
  Boolean等。生成的代码是null感知的，即当将包装器类型转换成相应的原语类型时，将执行null检查。
- 在所有Java基元类型和包装器类型之间，例如int和long或byte和Integer之间。
- 在所有Java基元（包括它们的包装器）和String之间，例如int和String或Boolean和String之间。可以指定java.text.DecimalFormat所理解的格式字符串。

当然，可以自定义转换格式，
下面是一个从int到String的自定义格式转换的示例，更多转换细节请参照 [5.1.隐式类型转换](https://mapstruct.org/documentation/stable/reference/html/#implicit-type-conversions)

```java

@Mapper
public interface CarMapper {

    @Mapping(source = "price", numberFormat = "$#.00")
    CarDto carToCarDto(Car car);

    @IterableMapping(numberFormat = "$#.00")
    List<String> prices(List<Integer> prices);
}
```

# (显式)控制嵌套bean映射

相同名称，自动映射

对应 `FishDto fishToFishDto(Fish fish)` MapStruct 不知道 Fish的kind 映射 FishDto的type 。
因此，这可以在映射规则中解决：@Mapping(target="fish.kind", source="fish.type"). 这告诉MapStruct在该级别查找名称kind，并将其映射到type。
> **在 MapStruct 中，@Mapping 的 target 和 source 字段会同时支持嵌套属性路径的写法。这里使用的 fish.kind 和 fish.type
> 就是嵌套属性路径中的两个属性名，它们实际上都只是一个临时变量名称，只要保证 target 和 source 字段所指向的对象、类和属性都是正确的即可。
**

```java

@Mapper
public interface FishTankMapperWithDocument {

    @Mapping(target = "fish.kind", source = "fish.type")
    @Mapping(target = "fish.name", expression = "java(\"Jaws\")")
    @Mapping(target = "plant", ignore = true)
    @Mapping(target = "ornament", ignore = true)
    @Mapping(target = "material", ignore = true)
    @Mapping(target = "quality.document", source = "quality.report")
    @Mapping(target = "quality.document.organisation.name", constant = "NoIdeaInc")
    FishTankWithNestedDocumentDto map(FishTank source);

}
```

在 MapStruct 中，`ignore`、`expression` 和 `constant` 用于定义映射关系。

1. `ignore`: 该注解表示忽略目标对象的属性，不做任何映射。在 DTO
   模式下，我们通常会将与业务逻辑无关或不需要传递的字段标记为 `@Mapping(target = "FieldName", ignore = true)`
   ，以减少代码量并提高程序性能。

2. `expression`: 该注解用于填充目标对象的属性使用 Java
   表达式计算返回值。例如，`@Mapping(target = "fish.name", expression = "java(\"Jaws\")")` 表示将字符串常量 "Jaws"
   赋值给目标对象中的名为 name 的 property 属性。

3. `constant`:
   这个注解指定应为目标属性分配一个常数值，不考虑源实例的任何内容。具有此注释情况下目标属性的类型必须与常量类型匹配，如果不匹配则会导致编译错误。例如，`@Mapping(target = "quality.document.organisation.name", constant = "NoIdeaInc" )`
   表示将值 "NoIdeaInc" 赋值给目标对象中的 quality.document.organisation.name 属性。

总之，这些注解都非常有用，在编写映射类时可以根据需要自由地使用它们来简化代码和提高工作效率。

# 自定义映射方法

前置条件：Java 8+

JDK 1.8 以后，接口里可以有静态方法和方法体了，
同时，接口允许包含具体实现的方法，该方法称为"默认方法"，默认方法使用 default 关键字修饰。

下面的示例代码演示了从 `FishTank` 到 `VolumeDto` 的自定义映射：

```java
public class FishTank {
    Fish fish;
    String material;
    Quality quality;
    int length;
    int width;
    int height;
}

public class FishTankWithVolumeDto {
    FishDto fish;
    MaterialDto material;
    QualityDto quality;
    VolumeDto volume;
}

public class VolumeDto {
    int volume;
    String description;
}

@Mapper
public abstract class FishTankMapperWithVolume {

    @Mapping(target = "fish.kind", source = "source.fish.type")
    @Mapping(target = "material.materialType", source = "source.material")
    @Mapping(target = "quality.document", source = "source.quality.report")
    @Mapping(target = "volume", source = "source")
    abstract FishTankWithVolumeDto map(FishTank source);

    VolumeDto mapVolume(FishTank source) {
        int volume = source.length * source.width * source.height;
        String desc = volume < 100 ? "Small" : "Large";
        return new VolumeDto(volume, desc);
    }
}
```

# 映射集合

没啥好讲的，**集合类型（List、Set等）的映射与映射bean类型的方式相同**

生成代码会循环遍历源集合元素，转换(隐式转换或者用你定义的映射方法)每个元素，然后把它扔到目标集合

示例代码：

```java
@Mapper
public interface CarMapper {

    Set<String> integerSetToStringSet(Set<Integer> integers);

    List<CarDto> carsToCarDtos(List<Car> cars);

    CarDto carToCarDto(Car car);
}
```

MapStruct 生成的代码差不多长这样：

```java
//GENERATED CODE
@Override
public Set<String> integerSetToStringSet(Set<Integer> integers){
        if(integers==null){
        return null;
        }

        Set<String> set=new LinkedHashSet<String>();

        for(Integer integer:integers){
        set.add(String.valueOf(integer));
        }

        return set;
        }

@Override
public List<CarDto> carsToCarDtos(List<Car> cars){
        if(cars==null){
        return null;
        }

        List<CarDto> list=new ArrayList<CarDto>();

        for(Car car:cars){
        list.add(carToCarDto(car));
        }

        return list;
        }
```

## 映射的实例类型中，集合的元素会自动映射吗

会的，只要你定义了映射方法，那就放心交给 MapStruct

当映射bean的集合类型属性时，MapStruct将查找具有匹配参数和返回类型的集合映射方法

```java
public class Car {
    List<Person> passengers;
}

public class CarDto {
    List<PersonDto> passengers;
}

@Mapper
public interface CarMapper {

    PersonDto map(Person person);

    List<PersonDto> map(List<Person> persons);

    CarDto map(Car car);

}
```

在 `List<CarDto> carsToCarDtos(List<Car> cars)` 映射方法中，MapStruct生成的代码：

```java
//GENERATED CODE
carDto.setPassengers(personsToPersonDtos(car.getPassengers()));
```

# 怎么映射 Map

和映射集合一样，生成的代码将遍历源映射，转换每个值和键（通过隐式转换或调用其他映射方法）并将它们放入目标映射