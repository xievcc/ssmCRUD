package com.itheima.dao;

import com.itheima.domain.Department;

import java.util.List;

public interface DepartmentMapper {
    int deleteByPrimaryKey(Integer deptId);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(Integer deptId);

    List<Department> selectALlDepartment();

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
}