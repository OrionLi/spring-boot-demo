package com.orion.demo.mapstruct.mapping;

import com.orion.demo.mapstruct.pojo.domain.Car;
import com.orion.demo.mapstruct.pojo.domain.Person;
import com.orion.demo.mapstruct.pojo.dto.CarDto;
import com.orion.demo.mapstruct.pojo.dto.PersonDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

/**
 * @author OrionLi
 * @date 2023/6/3 19:14
 * @description 映射器接口
 * <p>
 * 在生成的方法实现中，源类型的所有可读属性（例如 Car) 将被复制到目标类型中的相应属性中（例如 CarDto):
 * 当一个属性与其对应的目标实体同名时，它将被隐式映射。
 * 当一个属性在目标实体中有不同的名字时，它的名字可以通过 @Mapping注解。
 * 在方法上使用 @BeanMapping(ignoreByDefault = true) 注解时，只有被显式使用 @Mapper 指定的 source 属性的名字才会被复制到 target 属性中
 */
@Mapper(componentModel = "spring")
public interface CarMapper {

    /**
     * 在 JavaBeans 规范中定义的属性名称，
     * 如果想在 MapStruct 中进行对象属性映射（mapping），
     * 则需要在 Mapper 接口的 @Mapping 注解中指定这个属性的名称
     *
     * @param car 在 source 属性中源类型的对象
     * @return 返回 target 属性中目标类型的对象
     */
    @Mapping(target = "manufacturer", source = "make")
    @Mapping(target = "seatCount", source = "numberOfSeats")
    CarDto carToCarDto(Car car);

    @Mapping(target = "fullName", expression = "java(person.getFirstName() + \" \" + person.getLastName())")
    PersonDto personToPersonDto(Person person);
}
