package ttms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ttms.dao.DataDictMapper;
import ttms.model.DataDict;
import ttms.model.DataDictExample;
import ttms.model.Play;
import ttms.service.PlayService;

import java.util.List;

/**
 * Created by dongmengyuan on 18-6-11.
 */

@Controller("/PlayController")
public class PlayController {

    @Autowired
    private PlayService playService;
    @Autowired
    private DataDictMapper dataDictMapper;
    private static final int TypeId = 2;
    private static final int LangId = 3;

    @RequestMapping("/showPlay")
    public String getPlayList(Model model) {
        List<Play> list = playService.getPlayList();
        model.addAttribute("playList",list);
        return "play";
    }

    @RequestMapping("/addPlay")
    public String addPlay(Play play) {
        playService.insertPlay(play);
        return "redirect:/showPlay";
    }

    @RequestMapping("/deletePlay")
    public String deletePlay(int playId) {
        playService.deletePlay(playId);
        return "play";
    }

    @RequestMapping("/updatePlay")
    public String updatePlay(Play play) {
        playService.updatePlay(play);
        return "play";
    }

    @RequestMapping("/selectType")
    @ResponseBody
    public List<DataDict> selectData(){
        DataDictExample example = new DataDictExample();
        DataDictExample.Criteria criteria = example.createCriteria();
        criteria.andDictParentIdEqualTo(TypeId);
        List<DataDict> dataDicts = dataDictMapper.selectByExample(example);
        return dataDicts;
    }

    @RequestMapping("/selectLang")
    @ResponseBody
    public List<DataDict> selectLang(){
        DataDictExample example = new DataDictExample();
        DataDictExample.Criteria criteria = example.createCriteria();
        criteria.andDictParentIdEqualTo(LangId);
        List<DataDict> dataDicts = dataDictMapper.selectByExample(example);
        return dataDicts;
    }

}
