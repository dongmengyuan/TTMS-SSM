package ttms.model;

import java.util.Date;

public class Schedule {
    private Integer schedId;

    private Integer studioId;

    private Integer playId;

    private Date schedTime;

    private Double schedTicketPrice;

    public Integer getSchedId() {
        return schedId;
    }

    public void setSchedId(Integer schedId) {
        this.schedId = schedId;
    }

    public Integer getStudioId() {
        return studioId;
    }

    public void setStudioId(Integer studioId) {
        this.studioId = studioId;
    }

    public Integer getPlayId() {
        return playId;
    }

    public void setPlayId(Integer playId) {
        this.playId = playId;
    }

    public Date getSchedTime() {
        return schedTime;
    }

    public void setSchedTime(Date schedTime) {
        this.schedTime = schedTime;
    }

    public Double getSchedTicketPrice() {
        return schedTicketPrice;
    }

    public void setSchedTicketPrice(Double schedTicketPrice) {
        this.schedTicketPrice = schedTicketPrice;
    }
}