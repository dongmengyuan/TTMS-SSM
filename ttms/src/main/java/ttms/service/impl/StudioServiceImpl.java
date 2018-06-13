package ttms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ttms.dao.SeatMapper;
import ttms.dao.StudioMapper;
import ttms.model.Seat;
import ttms.model.SeatExample;
import ttms.model.Studio;
import ttms.model.StudioExample;
import ttms.service.StudioService;

import javax.xml.transform.Result;
import java.util.List;

/**
 * Created by dongmengyuan on 18-6-7.
 */

@Service
public class StudioServiceImpl implements StudioService {

    @Autowired
    private StudioMapper studioMapper;

    @Autowired
    private SeatMapper seatMapper;

    @Override
    public List<Studio> getStudioList() {
        return studioMapper.selectByExample(new StudioExample());
    }

    @Override
    public void insertStudio(Studio studio) {
        studioMapper.insertSelective(studio);
        for(int i = 1; i <= studio.getStudioRowCount(); i++) {
            for(int j = 1; j <= studio.getStudioColCount(); j++) {
                Seat seat = new Seat();
                seat.setStudioId(studio.getStudioId());
                seat.setSeatRow(i);
                seat.setSeatColumn(j);
                Short s = 1;
                seat.setSeatStatus(s);
                seatMapper.insertSelective(seat);
            }
        }
    }

    @Override
    public void deleteStudio(int id) {
        SeatExample seatExample = new SeatExample();
        SeatExample.Criteria seatExampleCriteria = seatExample.createCriteria();
        seatExampleCriteria.andStudioIdEqualTo(id);
        seatMapper.deleteByExample(seatExample);

        studioMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateStudio(Studio studio) {
        studioMapper.updateByPrimaryKeySelective(studio);
    }
}
