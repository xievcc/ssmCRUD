package com.itheima.service;

import com.itheima.dao.DepartmentMapper;
import com.itheima.domain.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;
    public List<Department> getAllDepartment(){
       return departmentMapper.selectALlDepartment();
    }
}
