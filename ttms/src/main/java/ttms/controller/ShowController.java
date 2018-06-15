package ttms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by dongmengyuan on 18-6-12.
 */

@Controller
public class ShowController {
    @RequestMapping("/show/{view}")
    public String show(@PathVariable String view){
        return "forward:/show"+view;
    }

    @RequestMapping("/show{jsp}")
    public String showJSP(@PathVariable String jsp){
        return jsp;
    }
}
