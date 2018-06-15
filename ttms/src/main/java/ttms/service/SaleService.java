package ttms.service;

import ttms.model.Play;
import ttms.model.Schedule;
import ttms.model.ScheduleById;

import java.util.List;

/**
 * Created by dongmengyuan on 18-6-13.
 */

public interface SaleService {

    public List<Play> getSalePlayList();

    public List<Schedule> getScheduleByPlayId(int id);

    public List<ScheduleById> getScheduleByPlayId1(int id);


    public String getticketstatus(String studio_id,String schedId);

    public String saveticketstatus(String studio_id, String schedId, String saveStatus,String pay,String ticketPrice,String change);
}
