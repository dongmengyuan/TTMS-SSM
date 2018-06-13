package ttms.service.impl;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ttms.dao.EmployeeMapper;
import ttms.model.Employee;
import ttms.model.EmployeeExample;
import ttms.model.PageBean;
import ttms.model.StringUtil;
import ttms.service.EmployeeService;

import java.util.List;

/**
 * Created by dongmengyuan on 18-6-7.
 */

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public List<Employee> getEmployeeList() {
        return employeeMapper.selectByExample(new EmployeeExample());
    }

    @Override
    public Employee getEmployeeById(int id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    @Override
    public void insertEmployee(Employee employee) {
        //有空的则不插入
        employeeMapper.insertSelective(employee);
    }

    @Override
    public void deleteEmployee(int id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateEmployee(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    @Override
    public String searchByPage(PageBean pageBean, Employee employee){
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        if (StringUtil.isNotEmpty(employee.getEmpName())) {
            criteria.andEmpNameLike("%" + employee.getEmpName() + "%");
        }
        long total = employeeMapper.countByExample(example);

        EmployeeExample example2 = new EmployeeExample();
        EmployeeExample.Criteria criteria2 = example2.createCriteria();
        if (employee != null && StringUtil.isNotEmpty(employee.getEmpName())) {
            criteria2.andEmpNameLike("%" + employee.getEmpName() + "%");
        }
        if (pageBean != null) {
            example2.setStart(pageBean.getStart());
            example2.setRows(pageBean.getRows());
        }
        String jsonArray = new Gson().toJson(employeeMapper.selectByExample(example2));
        String json = "{\"total\":" + total + ",\"rows\":" + jsonArray + "}";
        return json;
    }
}
