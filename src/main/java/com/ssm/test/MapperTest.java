package com.ssm.test;

import com.ssm.bean.Dept;
import com.ssm.bean.Emp;
import com.ssm.dao.DeptMapper;
import com.ssm.dao.EmpMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.Random;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DeptMapper deptMapper;

    @Autowired
    EmpMapper empMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public void testCRUD(){

        /*Emp emp = new Emp();

        emp.setEmpName("jay");
        emp.setGender("1");
        emp.setEmail("jay13@jay.com");

        if (empMapper.insertSelective(emp)  > 0) {
            System.out.println("insert successful!!!");
        }*/

        /*Emp emp = empMapper.selectByPrimaryKey(5);

        emp.setEmpName("Jay");
        emp.setDeptId(10);

        empMapper.updateByPrimaryKey(emp);*/

        /*for (int i = 0; i < 20; i++) {
            System.out.println((new Random().nextInt(5) +1 ) * 10 );
        }*/

        EmpMapper mapper = sqlSession.getMapper(EmpMapper.class);

        /*for (int i = 0; i < 600 ; i++) {
            String uid = UUID.randomUUID().toString().substring(0, 5);
            mapper.insertSelective(new Emp(null,uid,"",uid+"@"+uid+".com",(new Random().nextInt(5) +1 ) * 10 ));
        }*/

        /*for (int i = 1; i < 25 ; i++) {
            Emp emp = mapper.selectByPrimaryKey(i);

            emp.setDeptId((new Random().nextInt(5) +1 ) * 10);
            mapper.updateByPrimaryKeySelective(emp);
        }

        System.out.println("==========");*/

        mapper.insertSelective(new Emp(null,"张三","0","zhang@123.com",10));


        /*List<Emp> emps = empMapper.selectByExample(null);
        for (Emp e : emps) {
            System.out.println(e.getEmpName()+"  -  "+e.getEmail()+"  -  "+e.getDeptId());
        }*/

    }
}
