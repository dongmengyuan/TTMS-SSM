package ttms.model;

import java.util.Date;

public class Ticket {
    private Long ticketId;

    private Integer seatId;

    private Integer schedId;

    private Double ticketPrice;

    private Short ticketStatus;

    private Date ticketLockedTime;

    public Long getTicketId() {
        return ticketId;
    }

    public void setTicketId(Long ticketId) {
        this.ticketId = ticketId;
    }

    public Integer getSeatId() {
        return seatId;
    }

    public void setSeatId(Integer seatId) {
        this.seatId = seatId;
    }

    public Integer getSchedId() {
        return schedId;
    }

    public void setSchedId(Integer schedId) {
        this.schedId = schedId;
    }

    public Double getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(Double ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public Short getTicketStatus() {
        return ticketStatus;
    }

    public void setTicketStatus(Short ticketStatus) {
        this.ticketStatus = ticketStatus;
    }

    public Date getTicketLockedTime() {
        return ticketLockedTime;
    }

    public void setTicketLockedTime(Date ticketLockedTime) {
        this.ticketLockedTime = ticketLockedTime;
    }
}