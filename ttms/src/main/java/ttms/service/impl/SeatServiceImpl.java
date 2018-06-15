package ttms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ttms.dao.SeatMapper;
import ttms.model.Seat;
import ttms.model.SeatExample;
import ttms.service.SeatService;

import java.util.List;

/**
 * Created by dongmengyuan on 18-6-13.
 */


@Service
public class SeatServiceImpl implements SeatService {

    @Autowired
    private SeatMapper seatMapper;

    @Override
    public List<Seat> getSeatByStudioId(int studioid) {
        SeatExample seatExample = new SeatExample();
        SeatExample.Criteria seatExampleCriteria = seatExample.createCriteria();
        seatExampleCriteria.andStudioIdEqualTo(studioid);
        return seatMapper.selectByExample(seatExample);
    }
}
