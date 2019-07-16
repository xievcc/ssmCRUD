package com.itheima.service; 

import com.itheima.domain.Employee;
import org.junit.Test;
import org.junit.Before; 
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


/**
* EmployeeService Tester. 
* 
* @author <Authors name> 
* @since <pre>07/16/2019</pre> 
* @version 1.0 
*/ 
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-applicationConfig.xml")
public class EmployeeServiceTest {
    @Autowired
    private EmployeeService employeeService;
@Before
public void before() throws Exception { 
} 

/** 
* 
* Method: getAllEmps() 
* 
*/ 
@Test
public void testGetAllEmps() throws Exception { 
//TODO: Test goes here...
    List<Employee> allEmps = employeeService.getAllEmps();
    System.out.println(allEmps);
} 


} 
