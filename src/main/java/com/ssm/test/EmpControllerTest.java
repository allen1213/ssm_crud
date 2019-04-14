package com.ssm.test;

import com.github.pagehelper.PageInfo;
import com.ssm.bean.Emp;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:springmvc.xml"})
public class EmpControllerTest {

    //虚拟请求mvc  获取到处理结果
    MockMvc mockMvc;

    //传入springmvc的ioc
    @Autowired
    WebApplicationContext context;

    @Before
    public void initMockMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage(){
        try {


            MvcResult result = mockMvc.perform(
                    MockMvcRequestBuilders.get("/getAllEmps")
                            .param("pn", "1")
            ).andReturn();

            MockHttpServletRequest request = result.getRequest();
            PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

            System.out.println(pageInfo.getPageNum());
            System.out.println(pageInfo.getPages());
            System.out.println(pageInfo.getTotal());

            int[] nums = pageInfo.getNavigatepageNums();
            for (int i : nums) {
                System.out.println(i);
            }

            List<Emp> list = pageInfo.getList();

            for(Emp e : list) {
                System.out.println(e.getEmpName());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
