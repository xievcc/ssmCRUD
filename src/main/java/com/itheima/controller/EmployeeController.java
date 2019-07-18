package com.itheima.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.itheima.domain.Employee;
import com.itheima.dto.Msg;
import com.itheima.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;
    @RequestMapping(value = "/emps",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,6);
        List<Employee> employeeList = employeeService.getAllEmps();
        PageInfo<Employee> info = new PageInfo<>(employeeList,6);
        return Msg.success().add("pageInfo",info);
    }
    @RequestMapping("/checkuser")
    @ResponseBody
    public Msg checkUser(@RequestParam("empName") String empName){
    String regx = "(^[a-zA-Z0-9_-]{4,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
    if(!empName.matches(regx)){
        return Msg.fail().add("va_msg","用户名必须是4-16位英文数字或2-5位中文");
    }
        if (employeeService.checkUser(empName)) {
            return Msg.success();
        } else {
            return Msg.fail().add("va_msg", "用户名已存在");
        }
    }
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        Map<String,String> map = new HashMap<>();
        if(result.hasErrors()){
            List<FieldError> fieldError = result.getFieldErrors();
            for (FieldError error : fieldError) {
                System.out.println("错误的字段名"+error.getField());
                System.out.println("错误信息"+error.getDefaultMessage());
                map.put(error.getField(),error.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        } else {
            employeeService.saveEmp(employee);
            return Msg.success();
        }
    }
    @GetMapping("/emp/{id}")
    @ResponseBody
    public Msg getEmpById(@PathVariable("id") Integer id){
        Employee employee = employeeService.getEmpById(id);
        return Msg.success().add("emp",employee);
    }
    @PutMapping("/emp/{empId}")
    @ResponseBody
    public Msg updateEmp(Employee employee){
        employeeService.updateEmp(employee);
        return Msg.success();
    }
    @DeleteMapping("/emp/{ids}")
    @ResponseBody
    public Msg deleteEmp(@PathVariable("ids") String ids){
        List<Integer> list = new ArrayList<>();
       if (ids.contains("-")){
           String[] idsEnd = ids.split("-");
           for (String s : idsEnd) {
               list.add(Integer.parseInt(s));
           }
        employeeService.deleteBatchEmp(list);
       }else {
           employeeService.deleteEmpById(Integer.parseInt(ids));
       }
       return Msg.success();
    }
}


