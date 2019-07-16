package com.itheima.domain;

import java.io.Serializable;
import lombok.Data;

@Data
public class Department implements Serializable {
    private Integer deptId;

    private String deptName;

    private static final long serialVersionUID = 1L;
}