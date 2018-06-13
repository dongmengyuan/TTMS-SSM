package ttms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ttms.model.Employee;
import ttms.model.Play;
import ttms.service.HelloService;

import java.util.List;

/**
 * Created by dongmengyuan on 18-6-6.
 */


@Controller
public class HelloController {

    @Autowired
    private HelloService helloService;


    @RequestMapping("/hello")
    @ResponseBody
    public List<Play> hello(){
        return helloService.getPlayList();
    }

    @RequestMapping("/hello/{id}")
    @ResponseBody
    public Play hello2(@PathVariable(value = "id") int id){
        return helloService.getPlayById(id);
    }

    @RequestMapping("/hello2/{name}")
    @ResponseBody
    public List<Play> hello3(@PathVariable(value = "name") String name) {
        return helloService.getPlayByName(name);
    }

    @RequestMapping("/hello3/{id1}/{id2}")
    @ResponseBody
    public List<Play> hello4(@PathVariable(value = "id1") int id1,
                             @PathVariable(value = "id2") int id2) {
        return helloService.getPlayByIds(id1,id2);
    }

    @RequestMapping("/hello4")
    public String emp(Model model) {

        List<Employee> list = helloService.getEmployee();
        model.addAttribute("pageBean",list);
        return "employee";
    }
}
