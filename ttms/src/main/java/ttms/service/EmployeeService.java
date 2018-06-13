package ttms.service;

import ttms.model.Employee;
import ttms.model.PageBean;

import java.util.List;

/**
 * Created by dongmengyuan on 18-6-7.
 */

public interface EmployeeService {

    public List<Employee> getEmployeeList();

    public Employee getEmployeeById(int id);

    public void insertEmployee(Employee employee);

    public void deleteEmployee(int id);

    public void updateEmployee(Employee employee);

    public String searchByPage(PageBean pageBean, Employee employee);


}
