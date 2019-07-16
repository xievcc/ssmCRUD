package com.itheima.dao; 

import com.github.pagehelper.PageHelper;
import com.itheima.domain.Employee;
import com.itheima.domain.EmployeeExample;
import org.junit.Test;
import org.junit.Before; 
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


/**
* EmployeeMapperImpl Tester. 
* 
* @author <Authors name> 
* @since <pre>07/15/2019</pre> 
* @version 1.0 
*/ 
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-applicationConfig.xml")
public class EmployeeMapperImplTest {
    @Autowired
private EmployeeMapper employeeDao;
@Before
public void before() throws Exception { 
} 

/** 
* 
* Method: countByExample(EmployeeExample example) 
* 
*/ 
@Test
public void testCountByExample() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: deleteByExample(EmployeeExample example) 
* 
*/ 
@Test
public void testDeleteByExample() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: deleteByPrimaryKey(Integer empId) 
* 
*/ 
@Test
public void testDeleteByPrimaryKey() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: insert(Employee record) 
* 
*/ 
@Test
public void testInsert() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: insertSelective(Employee record) 
* 
*/ 
@Test
public void testInsertSelective() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: selectByExample(EmployeeExample example) 
* 
*/ 
@Test
public void testSelectByExample() throws Exception { 
//TODO: Test goes here...
    PageHelper.startPage(3,5);
    EmployeeExample example = new EmployeeExample();
    EmployeeExample.Criteria criteria = example.createCriteria().andDeptIdEqualTo(1);
    List<Employee> employees = employeeDao.selectByExample(example);
    employees.forEach(System.out::println);
} 

/** 
* 
* Method: selectByPrimaryKey(Integer empId) 
* 
*/ 
@Test
public void testSelectByPrimaryKey() throws Exception { 
//TODO: Test goes here...
    Employee employee = employeeDao.selectByPrimaryKey(1);
    System.out.println(employee);
} 

/** 
* 
* Method: updateByExampleSelective(Employee record, EmployeeExample example) 
* 
*/ 
@Test
public void testUpdateByExampleSelective() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: updateByExample(Employee record, EmployeeExample example) 
* 
*/ 
@Test
public void testUpdateByExample() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: updateByPrimaryKeySelective(Employee record) 
* 
*/ 
@Test
public void testUpdateByPrimaryKeySelective() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: updateByPrimaryKey(Employee record) 
* 
*/ 
@Test
public void testUpdateByPrimaryKey() throws Exception { 
//TODO: Test goes here...
    EmployeeExample example = new EmployeeExample();
    example.createCriteria().andEmpNameLike("%17%");
    List<Employee> employees = employeeDao.selectByExampleWithDept(null);
    employees.forEach(System.out::println);
//    Employee employee = employeeDao.selectByPrimaryKeyWithDept(1);
//    System.out.println(employee);
} 


} 
