package com.itheima.service;

import com.itheima.dao.EmployeeMapper;
import com.itheima.domain.Employee;
import com.itheima.domain.EmployeeExample;
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
    public boolean checkUser(String empName){
        EmployeeExample example = new EmployeeExample();
        example.createCriteria().andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);
        return count==0;
    }
    public void saveEmp(Employee employee){
        employeeMapper.insertSelective(employee);
    }
    public Employee getEmpById(Integer id){
        return employeeMapper.selectByPrimaryKey(id);
    }
    public void updateEmp(Employee employee){
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public void deleteEmpById(Integer empId) {
        employeeMapper.deleteByPrimaryKey(empId);
    }
    public void deleteBatchEmp(List<Integer> ids){
        EmployeeExample employeeExample = new EmployeeExample();
        employeeExample.createCriteria().andEmpIdIn(ids);
        employeeMapper.deleteByExample(employeeExample);
    }
}
