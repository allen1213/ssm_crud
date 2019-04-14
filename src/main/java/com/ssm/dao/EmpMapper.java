package com.ssm.dao;

import com.ssm.bean.Emp;
import com.ssm.bean.EmpExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface EmpMapper {
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