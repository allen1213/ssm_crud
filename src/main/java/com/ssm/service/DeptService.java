package com.ssm.service;

import com.ssm.bean.Dept;
import com.ssm.bean.DeptExample;
import com.ssm.dao.DeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptService {

    @Autowired
    private DeptMapper deptMapper;

    public List<Dept> getAllDepts(DeptExample example){
        return deptMapper.selectByExample(example);
    }
}
