package ttms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ttms.dao.ScheduleMapper;
import ttms.dao.SeatMapper;
import ttms.dao.TicketMapper;
import ttms.model.*;
import ttms.service.ScheduleService;

import java.util.List;

/**
 * Created by dongmengyuan on 18-6-7.
 */


@Service
public class ScheduleServiceImpl implements ScheduleService{
    @Autowired
    private ScheduleMapper scheduleMapper;

    @Autowired
    private SeatMapper seatMapper;

    @Autowired
    private TicketMapper ticketMapper;

    @Override
    public List<Schedule> getScheduleList() {
        return scheduleMapper.selectByExample(new ScheduleExample());

    }

    @Override
    public void insertSchedule(Schedule schedule) {
        scheduleMapper.insertSelective(schedule);
        List<Schedule> sche = scheduleMapper.selectByExample(null);
        int schedule_id=0;
        for(Schedule s:sche) {
            if(s.getSchedId()>schedule_id)
                schedule_id  = s.getSchedId();
        }
        SeatExample example = new SeatExample();
        SeatExample.Criteria criteria = example.createCriteria();
        criteria.andStudioIdEqualTo(schedule.getStudioId());
        criteria.andSeatStatusEqualTo((short) 1);
        List<Seat> seat = seatMapper.selectByExample(example);
        for(Seat s:seat) {
            Ticket ticket=  new Ticket();
            ticket.setSchedId(schedule_id);
            ticket.setSeatId(s.getSeatId());
            ticket.setTicketPrice(schedule.getSchedTicketPrice());
            ticket.setTicketStatus((short) 0);
            ticketMapper.insertSelective(ticket);
        }

    }

    @Override
    public void deleteSchedule(int id) {
        scheduleMapper.deleteByPrimaryKey(id);

    }

    @Override
    public void updateSchedule(Schedule schedule) {
        scheduleMapper.updateByPrimaryKeySelective(schedule);

    }
}
