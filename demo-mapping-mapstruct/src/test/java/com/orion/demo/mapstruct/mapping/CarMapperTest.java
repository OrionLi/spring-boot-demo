package com.orion.demo.mapstruct.mapping;

import com.orion.demo.mapstruct.pojo.domain.Car;
import com.orion.demo.mapstruct.pojo.domain.Engine;
import com.orion.demo.mapstruct.pojo.domain.Person;
import com.orion.demo.mapstruct.pojo.dto.CarDto;
import com.orion.demo.mapstruct.pojo.dto.PersonDto;
import com.orion.demo.mapstruct.pojo.emum.Category;
import jakarta.annotation.Resource;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * @author OrionLi
 * @date 2023/6/3 20:43
 * @description
 */

@SpringBootTest // 启动 SpringBoot 应用程序上下文
class CarMapperTest {

    @Resource // 自动注入具有 @Mapper 注解的 Mapper 接口实现类
    private CarMapper carMapper;

    private final Car car = new Car("Morris", 5, Arrays.asList("air conditioning", "GPS"), new Person("Alice", "White", 19), 100000.00, Category.COUPE, new Engine(150, "汽油"));

    @Test
    void testCarToCarDto() {
        CarDto carDto = carMapper.carToCarDto(car);

        assertEquals(car.getMake(), carDto.getManufacturer());
        assertEquals(car.getNumberOfSeats(), carDto.getSeatCount());
        assertEquals(car.getDriver().getFirstName() + " " + car.getDriver().getLastName(), carDto.getDriver().getFullName());
        assertEquals(car.getEngine().getHorsePower(), carDto.getEngine().getHorsePower());
        assertEquals(String.valueOf(car.getPrice()), carDto.getPrice());
        assertEquals(car.getCategory().toString(), carDto.getCategory());
    }

    @Test
    void testPersonToPersonDto() {
        Person person = new Person("John", "Doe", 30);
        PersonDto personDto = carMapper.personToPersonDto(person);

        assertEquals(person.getFirstName() + " " + person.getLastName(), personDto.getFullName());
        assertEquals(person.getAge(), personDto.getAge());
    }
}
