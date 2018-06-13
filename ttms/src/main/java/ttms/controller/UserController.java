package ttms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import ttms.model.User;
import ttms.service.UserService;


import java.util.List;

/**
 * Created by dongmengyuan on 18-6-12.
 */


@Controller("/UserController")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/showUser")
    public String showUser(Model model) {
        List<User> list = userService.getUserList();
        model.addAttribute("userList",list);
        return "user";
    }

    @RequestMapping("/addUser")
    public String addUser(User user) {
        userService.insertUser(user);
        return "redirect:/showUser";
    }

    @RequestMapping("/deleteUser")
    public String deleteUser(String empNo) {
        userService.deleteUser(empNo);
        return "user";
    }

    @RequestMapping("/updateUser")
    public String updateUser(User user) {
        userService.updateUser(user);
        return "redirect:/showUser";
    }

}
