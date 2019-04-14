package com.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.bean.Emp;
import com.ssm.bean.Msg;
import com.ssm.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmpController {

    @Autowired
    private EmpService empService;

    //@RequestMapping("/getAllEmps")
    public String getAllEmps(@RequestParam(value = "pn" ,defaultValue = "1") Integer pn, Model model){

        //从pn页开始，每一页5条数据
        PageHelper.startPage(pn,5);
        List<Emp> list = empService.selectByExampleWithDept(null);

        //将查询结果放到PageInfo中 给页面返回数据  5 为连续显示的页数
        PageInfo page = new PageInfo(list,5);

        //给页面返回信息
        model.addAttribute("pageInfo",page);
        return "emps";
    }


    /**
     * 首页获取员工数据
     * @param pn        分页的页码
     * @return            返回PageInfo json数据
     */
    @RequestMapping("/getAllEmps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn" ,defaultValue = "1") Integer pn){
        //从pn页开始，每一页5条数据
        PageHelper.startPage(pn,5);
        List<Emp> list = empService.selectByExampleWithDept(null);

        //将查询结果放到PageInfo中 给页面返回数据  5 为连续显示的页数
        PageInfo page = new PageInfo(list,5);

        return Msg.success().add("pageInfo",page);
    }

    /**
     * 插入员工数据       method = RequestMethod.POST
     * @param emp       使用$("#empAddModal form").serialize()封装好emp
     * @return              成功返回success 失败返回fail
     */
    @RequestMapping(value = "/getAllEmps" , method = RequestMethod.POST)
    @ResponseBody
    public Msg insertEmp(Emp emp){

        int i = empService.insertSelective(emp);
        System.out.println(i+"--------------");

        return Msg.success();
    }

    /**
     * 检查数据库内是否包含了新增员工的姓名
     * @param empName
     * @return              成功返回success 失败返回fail
     */
    @RequestMapping("/checkEmpName")
    @ResponseBody
    public Msg checkEmpName(@RequestParam("empName") String empName){

        if(empService.checkEmpName(empName)){//TODO  use select * from emp where emp_name = 'empName'
            return Msg.success();
        }
        return Msg.fail();
    }

    /**
     * 根据员工ID获取员工信息
     * @param id       url:"getAllEmps/"+id, type:"GET"  通过路径传ID
     * @return          emp对象的json数据
     */
    @ResponseBody
    @RequestMapping(value = "/getAllEmps/{id}" , method = RequestMethod.GET)
    public Msg getEmpByEmpId(@PathVariable("id") int id){
        Emp emp = empService.getEmpByEmpId(id);
        return Msg.success().add("emp",emp);
    }

    /**
     *更新员工信息      method = RequestMethod.PUT
     * @param emp    利用$("#empUpdateModal form").serialize()封装好emp
     * @return           更新成功返回success 失败返回fail
     */
    @ResponseBody
    @RequestMapping(value = "/getAllEmps/{empId}" , method = RequestMethod.PUT)
    public Msg updateEmpByEmpId(Emp emp){
        empService.updateEmpByEmpId(emp);
        return Msg.success();
    }

    /**
     * 批量删除员工       method = RequestMethod.DELETE
     * @param ids         要删除的ID集合
     * @return              删除成功返回success 失败返回fail
     */
    @RequestMapping(value = "/getAllEmps/{ids}" , method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmp(@PathVariable("ids") String ids){
        if(ids.contains("-")){  //判断是否是多个ID

            List<Integer> list = new ArrayList<>();
            String[] str = ids.split("-");

            for (String s :str){
                list.add(Integer.parseInt(s));
            }

            empService.deleteEmp(list); //批量删除

        } else {
            empService.deleteByPrimaryKey(Integer.parseInt(ids));
        }

        return Msg.success();
    }

    /**
     * 多条件查询
     * @param pn               分页的页码
     * @param name          要查询的name
     * @param deptId       要查询的deptID
     * @return                  返回PageInfo json数据
     */
    @ResponseBody
    @RequestMapping("/getEmp")
    public Msg getEmpInfoByEmpNameOrDeptId(@RequestParam(value = "pn" ,defaultValue = "1") Integer pn,
                                           @RequestParam(value = "name" ,required = false) String name,
                                           @RequestParam(value = "deptId" ,required = false) String deptId){

        Map<String, Object> map = new HashMap<String, Object>();

        if(null != name || "".equals(name) || "".equals(name.trim())){
            map.put("empName",name);
        }

        if(null != deptId || "".equals(deptId) || "".equals(deptId.trim())){
            map.put("deptId",Integer.parseInt(deptId));
        }

        PageHelper.startPage(pn,5);

        List<Emp> list = empService.getEmpInfoByEmpNameOrDeptId(map);

        PageInfo page = new PageInfo(list,5);

        return Msg.success().add("empList",page);
    }

}
