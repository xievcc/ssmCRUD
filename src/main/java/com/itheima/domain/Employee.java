package com.itheima.domain;

import java.io.Serializable;
import lombok.Data;

@Data
public class Employee implements Serializable {
    private Integer empId;

    private String empName;

    private String empGender;

    private String email;

    private Integer deptId;

    private Department dept;

    private static final long serialVersionUID = 1L;
}