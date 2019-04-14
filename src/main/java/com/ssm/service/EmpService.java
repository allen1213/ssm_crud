package com.ssm.service;

import com.ssm.bean.Emp;
import com.ssm.bean.EmpExample;
import com.ssm.dao.EmpMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class EmpService {

    @Autowired
    private EmpMapper empMapper;

    public List<Emp> selectByExample(EmpExample example){
        return empMapper.selectByExample(example);
    }


    public List<Emp> selectByExampleWithDept(EmpExample example){
        return empMapper.selectByExampleWithDept(null);
    }

    public Emp selectByPrimaryKeyWithDept(Integer empId){
        return empMapper.selectByPrimaryKeyWithDept(empId);
    }


    public int insertSelective(Emp record){
        return empMapper.insertSelective(record);
    }

    public boolean checkEmpName(String empName){
        EmpExample example = new EmpExample();

        EmpExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);

        long count = empMapper.countByExample(example);

        return count == 0;
    }

    public Emp getEmpByEmpId(int empId){
        return empMapper.selectByPrimaryKey(empId);
    }

    public int updateEmpByEmpId(Emp emp){
        return empMapper.updateByPrimaryKeySelective(emp);
    }

    public  int deleteByPrimaryKey(int empId){
        return empMapper.deleteByPrimaryKey(empId);
    }

    public int deleteEmp(List<Integer> ids){
        EmpExample example = new EmpExample();
        EmpExample.Criteria criteria = example.createCriteria();

        criteria.andEmpIdIn(ids);

        return empMapper.deleteByExample(example);
    }

    public List<Emp> getEmpInfoByEmpNameOrDeptId(Map<String, Object> map) {
        return empMapper.getEmpInfoByEmpNameOrDeptId(map);
    }
}
