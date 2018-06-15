package ttms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ttms.model.Seat;
import ttms.service.SeatService;

import java.util.List;

/**
 * Created by dongmengyuan on 18-6-13.
 */


@Controller("/SeatController")
public class SeatController {

    @Autowired
    private SeatService seatService;

    @RequestMapping("/seat/{id}")
    @ResponseBody
    public List<Seat> getSeat(@PathVariable(value = "id")int id){
        List<Seat> seatByStudioId = seatService.getSeatByStudioId(id);
        return seatByStudioId;
    }


    @RequestMapping("/showSeat/{studioId}")
    public String getSeatList(@PathVariable(value = "studioId") int studioId, Model model) {
        model.addAttribute("id",studioId);
        return "seat";
    }





}
