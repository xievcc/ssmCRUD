package com.itheima.domain;

import java.io.Serializable;
import lombok.Data;

import javax.validation.constraints.Pattern;

@Data
public class Employee implements Serializable {
    private Integer empId;
    @Pattern(regexp = "(^[a-zA-Z0-9_-]{4,16}$)|(^[\\u2E80-\\u9FFF]{2,5})",
    message = "用户名必须是4-16位英文数字或2-5位中文")
    private String empName;

    private String empGender;
    @Pattern(regexp = "^([a-zA-Z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",
            message = "邮箱格式错误")
    private String email;

    private Integer deptId;

    private Department dept;

    private static final long serialVersionUID = 1L;
}