package com.itheima.service;

import com.itheima.dao.EmployeeMapper;
import com.itheima.domain.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;

    public List<Employee> getAllEmps(){
        return employeeMapper.selectByExampleWithDept(null);

    }
}
