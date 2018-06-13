package ttms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ttms.dao.ScheduleMapper;
import ttms.model.Schedule;
import ttms.model.ScheduleExample;
import ttms.service.ScheduleService;

import java.util.List;

/**
 * Created by dongmengyuan on 18-6-7.
 */


@Service
public class ScheduleServiceImpl implements ScheduleService{
    @Autowired
    private ScheduleMapper scheduleMapper;

    @Override
    public List<Schedule> getScheduleList() {
        return scheduleMapper.selectByExample(new ScheduleExample());

    }

    @Override
    public void insertSchedule(Schedule schedule) {
        scheduleMapper.insertSelective(schedule);
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
