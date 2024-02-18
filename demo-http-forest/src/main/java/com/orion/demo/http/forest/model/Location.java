package com.orion.demo.http.forest.model;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * Created by Administrator on 2016/6/20.
 */
@Getter
@Setter
public class Location {

    private String timestamp;

    private Boolean result;

    private String message;

    private String version;

    private String desc;

    private String pos;

    private String districtadcode;

    private String district;

    private String adcode;

    private String areacode;

    private String city;

    private String cityadcode;

    private String tel;

    private Integer code;

    private String province;

    private String provinceadcode;

    private String country;

    private List cross_list;

    private List road_list;

    private List poi_list;
}
