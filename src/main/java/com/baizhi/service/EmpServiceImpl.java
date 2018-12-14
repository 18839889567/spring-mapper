package com.baizhi.service;

import com.baizhi.entity.Emp;
import com.baizhi.mapper.EmpMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EmpServiceImpl implements EmpService {
    @Autowired
    EmpMapper empMapper;
    @Override
    public List<Emp> selectAll() {
        return empMapper.selectAll();
    }
}
