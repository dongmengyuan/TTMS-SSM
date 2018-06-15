package ttms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ttms.dao.*;
import ttms.model.*;
import ttms.service.SaleService;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by dongmengyuan on 18-6-13.
 */

@Service
public class SaleServiceImpl implements SaleService {

    @Autowired
    private SaleMapper saleMapper;
    @Autowired
    private PlayMapper playMapper;
    @Autowired
    private ScheduleMapper scheduleMapper;
    @Autowired
    private StudioMapper studioMapper;
    @Autowired
    private SeatMapper seatMapper;
    @Autowired
    private TicketMapper ticketMapper;
    @Autowired
    private SaleItemMapper saleItemMapper;
    @Autowired
    private DataDictMapper dataDictMapper;
    @Autowired
    private EmployeeMapper employeeMapper;


    @Override
    public List<Play> getSalePlayList() {
        return playMapper.selectByExample(new PlayExample());
    }



    //通过剧目id获得该剧目的演出计划
    @Override
    public List<Schedule> getScheduleByPlayId(int id) {
        ScheduleExample scheduleExample = new ScheduleExample();
        ScheduleExample.Criteria scheduleExampleCriteria = scheduleExample.createCriteria();
        scheduleExampleCriteria.andPlayIdEqualTo(id);
        return scheduleMapper.selectByExample(scheduleExample);
    }

    //通过剧目id获得该剧目的演出计划
    @Override
    public List<ScheduleById> getScheduleByPlayId1(int id) {
        ScheduleExample scheduleExample = new ScheduleExample();
        ScheduleExample.Criteria scheduleExampleCriteria = scheduleExample.createCriteria();
        scheduleExampleCriteria.andPlayIdEqualTo(id);
        List<Schedule> scheduleList = scheduleMapper.selectByExample(scheduleExample);
        List<ScheduleById> scheduleByIds = new ArrayList<>();
        for(Schedule s:scheduleList){
            ScheduleById scheduleById = new ScheduleById();
            scheduleById.setPlayId(s.getPlayId());
            scheduleById.setSchedId(s.getSchedId());
            scheduleById.setSchedTicketPrice(s.getSchedTicketPrice());
            scheduleById.setSchedTime(s.getSchedTime());
            scheduleById.setStudioId(s.getStudioId());
            scheduleById.setStudioRow(studioMapper.selectByPrimaryKey(s.getStudioId()).getStudioRowCount());
            scheduleById.setStudioCol(studioMapper.selectByPrimaryKey(s.getStudioId()).getStudioColCount());
            scheduleById.setPlayName(playMapper.selectByPrimaryKey(s.getPlayId()).getPlayName());
            scheduleByIds.add(scheduleById);
        }
        return scheduleByIds;
    }


    public String getticketstatus(String studio_id,String schedId){
        String json ="";
        if(StringUtil.isNotEmpty(studio_id))
        {
            SeatExample example = new SeatExample();
            example.createCriteria().andStudioIdEqualTo(Integer.parseInt(studio_id));
            List<Seat> ss=seatMapper.selectByExample(example);
            for(Seat s:ss) {
                if(s.getSeatStatus()==-1||s.getSeatStatus()==0)
                    json += "-1,";
                else {
                    TicketExample example2 = new TicketExample();
                    TicketExample.Criteria criteria = example2.createCriteria();
                    criteria.andSeatIdEqualTo(s.getSeatId());
                    if(schedId!=null) {
                        criteria.andSchedIdEqualTo(Integer.valueOf(schedId));
                    }
                    List<Ticket> tickets = ticketMapper.selectByExample(example2);
                    if(tickets.get(0).getTicketStatus() == 0) {
                        json += "0,";
                    }else if(tickets.get(0).getTicketStatus() == 9 ||tickets.get(0).getTicketStatus() == 1){
                        json += "1,";
                    }else{
                        json="false";
                    }

                }
            }
        }else {
            json = "false";
        }
        return json;
    }

    public String saveticketstatus(String studio_id, String schedId, String saveStatus,String pay,String ticketPrice,String change) {

        String json="";
        DataDictExample example5 = new DataDictExample();
        example5.createCriteria().andDictNameEqualTo("锁失效时间");
        String LockTime = dataDictMapper.selectByExample(example5).get(0).getDictValue();
        List<Integer> integers = new ArrayList<>();
        String str[]=saveStatus.split(",");
        SeatExample example = new SeatExample();
        SeatExample.Criteria criteria = example.createCriteria();
        criteria.andStudioIdEqualTo(Integer.parseInt(studio_id));
        List<Seat> ss=seatMapper.selectByExample(example);
        for(int i=0;i<str.length;i++) {
            System.out.println(ss.get(Integer.parseInt(str[i])-1).getSeatId());
            integers.add(ss.get(Integer.parseInt(str[i])-1).getSeatId());
        }
        TicketExample example2 = new TicketExample();
        TicketExample.Criteria criteria2 = example2.createCriteria();
        criteria2.andSeatIdIn(integers);
        criteria2.andSchedIdEqualTo(Integer.parseInt(schedId));
        List<Ticket> tickets = ticketMapper.selectByExample(example2);
        for(Ticket t:tickets) {
            if(t.getTicketStatus()== 1) {
                Date now = new Date();
                long minutes = (now.getTime()-tickets.get(0).getTicketLockedTime().getTime())/(1000*60);
                if(LockTime!=null) {
                    if(minutes>=Long.parseLong(LockTime)) {
                        t.setTicketStatus((short) 9);
                        t.setTicketLockedTime(null);
                        ticketMapper.updateByPrimaryKey(t);

                        json = "{\"success\":" + true + "}";
                    }else {
                        return json="{\"success\":" + false + ",\"errormessage\":" + "该位置已经被其他人选择！" + "}";
                    }
                }
            }else if(t.getTicketStatus()== 9) {
                return json="{\"success\":" + false + ",\"errormessage\":" + "该位置已经被购买！" + "}";
            }else {
                t.setTicketStatus((short) 9);
                ticketMapper.updateByPrimaryKeySelective(t);
                json = "{\"success\":" + true + "}";
            }
        }

        Sale sale = new Sale();
        sale.setEmpId(1);
        sale.setSaleTime(new Date());
        sale.setSalePayment(new BigDecimal(pay));
        sale.setSaleStatus((short) 1);
        sale.setSaleType((short) 1);
        sale.setSaleChange(new BigDecimal(change));
        saleMapper.insertSelective(sale);


        for(Ticket t:tickets) {
            SaleItem sale_item = new SaleItem();
            sale_item.setSaleId(sale.getSaleId());
            sale_item.setSaleItemPrice(new BigDecimal(ticketPrice));
            sale_item.setTicketId(t.getTicketId());
            saleItemMapper.insertSelective(sale_item);
        }

        return json;
    }
}
