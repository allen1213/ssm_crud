package com.ssm.dao;

import com.ssm.bean.Emp;
import com.ssm.bean.EmpExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface EmpMapper {

    @Select(value = "select * from emp")
    List<Emp> select();

    @Update(value = "<script>" +"update emp\n" +
            "        <set>\n" +
            "            <if test=\"empName != null\">\n" +
            "                emp_name = #{empName,jdbcType=VARCHAR},\n" +
            "            </if>\n" +
            "            <if test=\"gender != null\">\n" +
            "                gender = #{gender,jdbcType=CHAR},\n" +
            "            </if>\n" +
            "            <if test=\"email != null\">\n" +
            "                email = #{email,jdbcType=VARCHAR},\n" +
            "            </if>\n" +
            "            <if test=\"deptId != null\">\n" +
            "                dept_id = #{deptId,jdbcType=INTEGER},\n" +
            "            </if>\n" +
            "        </set>\n" +
            "        where emp_id = #{empId,jdbcType=INTEGER} "+"</script>" )
    int update(Emp emp);

    @Select(value = "select * from emp where emp_id = #{empId}")
    Emp getEmpByPK(int empId);

    long countByExample(EmpExample example);

    int deleteByExample(EmpExample example);

    int deleteByPrimaryKey(Integer empId);

    int insert(Emp record);

    int insertSelective(Emp record);

    List<Emp> selectByExample(EmpExample example);

    Emp selectByPrimaryKey(Integer empId);

    List<Emp> selectByExampleWithDept(EmpExample example);//

    Emp selectByPrimaryKeyWithDept(Integer empId);//

    int updateByExampleSelective(@Param("record") Emp record, @Param("example") EmpExample example);

    int updateByExample(@Param("record") Emp record, @Param("example") EmpExample example);

    int updateByPrimaryKeySelective(Emp record);

    int updateByPrimaryKey(Emp record);

    List<Emp> getEmpInfoByEmpNameOrDeptId(Map<String, Object> map);
}