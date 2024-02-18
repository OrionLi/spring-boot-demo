package com.orion.demo.http.forest.controller;

import com.dtflys.forest.http.ForestResponse;
import com.orion.demo.http.forest.client.Amap;
import com.orion.demo.http.forest.client.Cn12306;
import com.orion.demo.http.forest.model.Coordinate;
import com.orion.demo.http.forest.model.Location;
import com.orion.demo.http.forest.model.Result;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.Map;

@RestController
public class ForestExampleController {

    @Resource
    private Amap amap;

    @Resource
    private Cn12306 cn12306;

    @GetMapping("/amap/location")
    public Result<Location> amapLocation(@RequestParam BigDecimal longitude, @RequestParam BigDecimal latitude) {
        return amap.getLocation(longitude.toEngineeringString(), latitude.toEngineeringString());
    }

    @GetMapping("/amap/location2")
    public Map amapLocation2(@RequestParam BigDecimal longitude, @RequestParam BigDecimal latitude) {
        Coordinate coordinate = new Coordinate(
                longitude.toEngineeringString(),
                latitude.toEngineeringString());
        return amap.getLocation(coordinate);
    }

    @GetMapping("/amap/location3")
    public Map amapLocation3(@RequestParam BigDecimal longitude, @RequestParam BigDecimal latitude) {
        Coordinate coordinate = new Coordinate(
                longitude.toEngineeringString(),
                latitude.toEngineeringString());
        return amap.getLocationByCoordinate(coordinate);
    }

    @GetMapping("/12306")
    public String cn12306() {
        ForestResponse<String> response = cn12306.index();
        return response.getResult();
    }

}
