package ttms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ttms.dao.PlayMapper;
import ttms.dao.StudioMapper;
import ttms.model.Play;
import ttms.model.Schedule;
import ttms.model.Studio;
import ttms.model.StudioExample;
import ttms.service.ScheduleService;

import java.util.List;

/**
 * Created by dongmengyuan on 18-6-7.
 */

@Controller("/ScheduleController")
public class ScheduleController {

    @Autowired
    private ScheduleService scheduleService;

    @Autowired
    private StudioMapper studioMapper;

    @Autowired
    private PlayMapper playMapper;

    @RequestMapping("/showSchedule")
    public String getScheduleList(Model model) {
        List<Schedule> list = scheduleService.getScheduleList();
        model.addAttribute("scheduleList",list);
        return "schedule";
    }

    @RequestMapping("/addSchedule")
    public String addSchedule(Schedule schedule) {
        scheduleService.insertSchedule(schedule);
        return "redirect:/showSchedule";
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

    @RequestMapping("/selectStudio")
    @ResponseBody
    public List<Studio> selectData(){
        return studioMapper.selectByExample(null);
    }

    @RequestMapping("/selectPlay")
    @ResponseBody
    public List<Play> selectLang(){
        return playMapper.selectByExample(null);
    }
}
