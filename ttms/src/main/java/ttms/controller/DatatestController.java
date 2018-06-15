package ttms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by dongmengyuan on 18-6-13.
 */

@Controller("/DatatestController")
public class DatatestController {

    @RequestMapping("/showData")
    public String getData() {
        return "datatest";

    }
}
