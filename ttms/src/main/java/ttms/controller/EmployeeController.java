package ttms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ttms.model.Employee;
import ttms.model.PageBean;
import ttms.service.EmployeeService;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by dongmengyuan on 18-6-7.
 */

@Controller("/EmployeeController")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/showEmployee")
    public String showEmployee(Model model) {
//        List<Employee> list = employeeService.getEmployeeList();
//        model.addAttribute("employeeList",list);
//        PageHelper.startPage()
        return "employee";
    }

    @RequestMapping("/addEmployee")
    public String addEmployee(Employee employee) {
        employeeService.insertEmployee(employee);
        return "redirect:/showEmployee";
    }

    @RequestMapping("/deleteEmployee")
    public String deleteEmployee(int empId) {
        employeeService.deleteEmployee(empId);
        return "employee";
    }

    @RequestMapping("/updateEmployee")
    public String updateEmployee(Employee employee) {
        employeeService.updateEmployee(employee);
        return "employee";
    }

    @ResponseBody
    @RequestMapping("/searchByPage")
    public String searchByPage(HttpServletRequest request) throws Exception {
        int rows = Integer.parseInt(request.getParameter("pageSize"));
        int page = Integer.parseInt(request.getParameter("pageNumber"));
        String emp_name = request.getParameter("empName");
        if(emp_name == null) {
            emp_name = "";
        }
        Employee employee = new Employee();
        employee.setEmpName(emp_name);
        PageBean pageBean = new PageBean(page,rows);
        return employeeService.searchByPage(pageBean,employee);
    }

}
