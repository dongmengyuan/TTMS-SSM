package ttms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import ttms.model.Schedule;
import ttms.service.ScheduleService;

import java.util.List;

/**
 * Created by dongmengyuan on 18-6-7.
 */

@Controller("/ScheduleController")
public class ScheduleController {

    @Autowired
    private ScheduleService scheduleService;

    @RequestMapping("/showSchedule")
    public String getScheduleList(Model model) {
        List<Schedule> list = scheduleService.getScheduleList();
        model.addAttribute("scheduleList",list);
        return "schedule";
    }

    @RequestMapping("/addSchedule")
    public String addSchedule(Schedule schedule) {
        scheduleService.insertSchedule(schedule);
        return "schedule";
    }

    @RequestMapping("/deleteSchedule")
    public String deleteSchedule(int schedId) {
        scheduleService.deleteSchedule(schedId);
        return "schedule";
    }

    @RequestMapping("/updateSchedule")
    public String updateSchedule(Schedule schedule) {
        scheduleService.updateSchedule(schedule);
        return "schedule";
    }
}
