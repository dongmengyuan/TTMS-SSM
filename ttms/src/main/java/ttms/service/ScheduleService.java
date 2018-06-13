package ttms.service;

import ttms.model.Schedule;

import java.util.List;

/**
 * Created by dongmengyuan on 18-6-7.
 */

public interface ScheduleService {

    public List<Schedule> getScheduleList();

    public void insertSchedule(Schedule schedule);

    public void deleteSchedule(int id);

    public void updateSchedule(Schedule schedule);
}
