package ttms.dao;

import org.apache.ibatis.annotations.Param;
import ttms.model.Employee;
import ttms.model.EmployeeExample;

import java.util.List;

public interface EmployeeMapper {


    Employee selectByNo(@Param("empNo") String empNo);

    int countByExample(EmployeeExample example);

    int deleteByExample(EmployeeExample example);

    int deleteByPrimaryKey(Integer empId);

    int insert(Employee record);

    int insertSelective(Employee record);

    List<Employee> selectByExample(EmployeeExample example);

    Employee selectByPrimaryKey(Integer empId);

//    Employee selectByEmpNo(String empNo);

    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
}