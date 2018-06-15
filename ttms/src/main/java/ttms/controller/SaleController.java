package ttms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ttms.dao.ScheduleMapper;
import ttms.dao.StudioMapper;
import ttms.model.Play;
import ttms.model.Schedule;
import ttms.model.ScheduleById;
import ttms.service.PlayService;
import ttms.service.SaleService;
import ttms.service.ScheduleService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by dongmengyuan on 18-6-13.
 */


@Controller("/SaleController")
public class SaleController {

    @Autowired
    private SaleService saleService;
    @Autowired
    private PlayService playService;
    @Autowired
    private ScheduleService scheduleService;


    @RequestMapping("/showSaleseat")
    public String getSaleSeat() {
        return "saleseat";
    }

    @RequestMapping("/showSalePlay")
    public String showSalePlay(Model model) {
        List<Play> list = saleService.getSalePlayList();
        model.addAttribute("salePlayList",list);
        return "sale_play";
    }


    @RequestMapping("/showScheduleByPlayId")
    public String showScheduleByPlayId() {
        return "sale_schedule";
    }

    @RequestMapping("/showScheduleByPlayId/{playId}")
    @ResponseBody
    public List<Schedule> getScheduleByPlayIdList(@PathVariable(value = "playId") int playId) {
        List scheduleByPlayIdList =  saleService.getScheduleByPlayId(playId);
        return scheduleByPlayIdList;
    }

    @RequestMapping("/showScheduleByPlayId1/{playId}")
    public String getScheduleByPlayId1List(@PathVariable(value = "playId") int playId,Model model) {
        List scheduleByPlayId1List =  saleService.getScheduleByPlayId1(playId);
        model.addAttribute("scheduleByPlayId1List",scheduleByPlayId1List);
        return "sale_schedule";
    }

    @ResponseBody
    @RequestMapping("/getticketstatus")
    public String getticketstatus(String studio_id,String schedId){
        return saleService.getticketstatus(studio_id,schedId);
    }


    @ResponseBody
    @RequestMapping("/saveticketstatus")
    public String saveticketstatus(HttpServletRequest request, String studio_id, String schedId, String saveStatus, String pay, String ticketPrice, String change){
        //String empNo = request.getSession().getAttribute("emp").toString();
        return saleService.saveticketstatus(studio_id,schedId,saveStatus,pay,ticketPrice,change);
    }
}
