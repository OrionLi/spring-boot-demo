# 说明

MapStruct 可用于 Java 9 及更高版本。

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

同时，springboot 项目使用 MapStruct 写的接口中，如果要使用依赖注入，MapStruct的映射接口的 `@Mapper` 注解应改为 `@Mapper(componentModel = "spring")`

如果还是出错，运行一次 maven 的 clean

# 为什么要使用 MapStruct？

- 代码自动生成：MapStruct 是一种基于注解的代码生成器，可以根据定义好的映射关系，在编译时自动生成对应的转换器代码。这样可以避免手动编写大量重复和冗余的映射代码，提高开发效率。
- 映射逻辑清晰：在手动编写 Getter 和 Setter 时，可能存在多个属性之间需要进行一些复杂的转换或处理的情况，这会导致类的代码变得臃肿难以阅读。而在使用 MapStruct 的情况下，可以通过在 Mapper 接口上定义自定义方法来实现复杂的转换逻辑，从而使映射逻辑更加清晰和易于维护。同时，在 Mapper 接口中，也可以方便地集中管理各个属性之间的映射关系。
- 扩展性强：MapStruct 提供了丰富的方法转换器和注解，可以轻松地支持不同类型之间的映射和转换，同时也很容易扩展和定制化。此外，MapStruct 还支持通过插件的方式来增强其功能。

综上所述，虽然手动编写 Getter 和 Setter 可能会更加灵活，但在实际开发中，为了提高开发效率、代码可读性以及可维护性，使用 MapStruct 是一种更为推荐的方式。

# 使用 MapStruct 和手动使用 Getter 和 Setter，哪个运行效率高？

在运行效率方面，手动编写 Getter 和 Setter 和使用 MapStruct 生成代码的运行效率差别不大，因为实际上它们最终使用的都是 JavaBean 的标准方式进行数据封装和解封。由于 MapStruct 是在编译时生成对应的转换器代码，可以避免运行时反射带来的性能损耗。而手动编写 Getter 和 Setter 方法，在运行时需要依赖于 Java 的反射机制来获取和设置属性值，虽然这个过程已经高度优化，但仍然存在一定的性能损耗。

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

MapStruct 生成的类实现方法 `carToCarDto()`，生成的代码在`carToCarDto()`将调用手动实现的`personToPersonDto()`映射时的方法`driver`属性。

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
- 当有一个源对象只包含一次的属性时，MapStruct 会自动选择将其映射到目标对象中相应的属性。在这种情况下，不需要使用 @Mapping 注释来明确指定它要被映射到哪个属性上，因为 MapStruct 可以自动确定。

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

     @Mapping( target = "name", source = "record.name" )
     @Mapping( target = ".", source = "record" )
     @Mapping( target = ".", source = "account" )
     Customer customerDtoToCustomer(CustomerDto customerDto);
 }
```

在示例中，
- `@Mapping(target = "name", source = "record.name")` 将 `CustomerDto` 对象的 `name` 属性映射到 `Customer` 对象的 `name` 属性上，
- `@Mapping(target = ".", source = "record")` 将 `CustomerDto` 对象的 `record` 属性映射到 `Customer` 对象的同名属性上。
- `@Mapping(target = ".", source = "account")` 则将 `CustomerDto` 对象的 `account` 属性映射到 `Customer` 对象的同名属性上。