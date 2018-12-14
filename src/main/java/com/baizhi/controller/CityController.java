package com.baizhi.controller;

import com.baizhi.entity.Emp;

import com.baizhi.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("city")
public class CityController {
    @Autowired
    EmpService empService;
    @RequestMapping("test")

    public List<Emp> test(ModelMap modelMap){
        List<Emp> list = empService.selectAll();
        for (Emp emp : list) {
            System.out.println(emp);
        }
        modelMap.addAttribute("list",list);
        return list;
    }
}
