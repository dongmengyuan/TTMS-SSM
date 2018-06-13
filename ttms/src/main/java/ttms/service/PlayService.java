package ttms.service;


import ttms.model.Play;

import java.util.List;

/**
 * Created by dongmengyuan on 18-6-7.
 */

public interface PlayService {

    public List<Play> getPlayList();

    public Play getPlayById(int id);

    public List<Play> getPlayByName(String name);

    public List<Play> getPlayByIds(int id1,int id2);

    public void insertPlay(Play play);

    public void deletePlay(int id);

    public void updatePlay(Play play);

}
