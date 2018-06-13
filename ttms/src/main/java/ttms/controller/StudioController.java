package ttms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import ttms.model.Studio;
import ttms.service.StudioService;

import java.util.List;

/**
 * Created by dongmengyuan on 18-6-7.
 */


@Controller("/StudioController")
public class StudioController {

    @Autowired
    private StudioService studioService;

    @RequestMapping("/showStudio")
    public String showStudio(Model model) {
        List<Studio> list = studioService.getStudioList();
        model.addAttribute("studioList",list);
        return "studio";
    }

    @RequestMapping("/addStudio")
    public String addStudio(Studio studio) {
        studioService.insertStudio(studio);
        return "redirect:/showStudio";
    }

    @RequestMapping("/deleteStudio")
    public String deleteStudio(int studioId) {
        studioService.deleteStudio(studioId);
        return "studio";
    }

    @RequestMapping("/updateStudio")
    public String updateStudio(Studio studio) {
        studioService.updateStudio(studio);
        return "redirect:/showStudio";
    }


}
