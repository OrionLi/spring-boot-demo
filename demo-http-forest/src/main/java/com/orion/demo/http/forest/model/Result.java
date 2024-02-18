package com.orion.demo.http.forest.model;

import lombok.Getter;
import lombok.Setter;

/**
 * @author gongjun
 * @since 2016-06-20
 */
@Getter
@Setter
public class Result<T> {

    private Integer status;

    private T data;
}
