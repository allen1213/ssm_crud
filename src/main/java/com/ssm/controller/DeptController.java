package com.ssm.controller;

import com.ssm.bean.Dept;
import com.ssm.bean.Msg;
import com.ssm.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DeptController {

    @Autowired
    private DeptService deptService;

    @RequestMapping("/getAllDepts")
    @ResponseBody
    public Msg getAllDepts(){
        List<Dept> list = deptService.getAllDepts(null);
        return Msg.success().add("depts",list);
    }
}
