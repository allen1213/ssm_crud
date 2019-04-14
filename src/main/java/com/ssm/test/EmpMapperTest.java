package com.ssm.test;

import com.ssm.bean.Emp;
import com.ssm.dao.EmpMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class EmpMapperTest {

    @Autowired
    EmpMapper empMapper;

    @Test
    public void testGetAllEmps(){

        /*List<Emp> list = empMapper.selectByExampleWithDept(null);
        System.out.println(list.size());

        Emp emp = empMapper.selectByPrimaryKeyWithDept(601);
        System.out.println(emp.getEmpName());*/

        Map<String,Object> map = new HashMap<>();
        map.put("empName","b");

        map.put("deptId",10);


        List<Emp> list = empMapper.getEmpInfoByEmpNameOrDeptId(map);

        /*for (Emp e : list){
            System.out.println(e.getEmpName()+"   "+e.getDeptId());
        }*/

        System.out.println(list.size());

    }
}
