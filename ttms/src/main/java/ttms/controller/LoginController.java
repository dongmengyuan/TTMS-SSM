package ttms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ttms.model.User;
import ttms.service.LoginService;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by dongmengyuan on 18-6-7.
 */

@Controller("/loginController")
public class LoginController {

    @Autowired
    private LoginService loginService;

    @RequestMapping("/loginPage")
    public String loginPage() {
        return "login";
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest request) {
        String emp_no = request.getParameter("username");
        String emp_pass = request.getParameter("password");


        User user = loginService.getUserByNoAndPass(emp_no, emp_pass);

        if(user == null) {
            System.out.println("用户名密码不匹配！");
            return "login";
        }
        else {
            System.out.println("登录成功！");
            return "employee";
        }

    }
}
