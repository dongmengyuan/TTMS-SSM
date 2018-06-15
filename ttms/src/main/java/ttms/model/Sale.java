package ttms.model;

import java.math.BigDecimal;
import java.util.Date;

public class Sale {
    private Long saleId;

    private Integer empId;

    private Date saleTime;

    private BigDecimal salePayment;

    private Double saleChange;

    private Short saleType;

    private Short saleStatus;

    public Long getSaleId() {
        return saleId;
    }

    public void setSaleId(Long saleId) {
        this.saleId = saleId;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public Date getSaleTime() {
        return saleTime;
    }

    public void setSaleTime(Date saleTime) {
        this.saleTime = saleTime;
    }

    public Double getSaleChange() {
        return saleChange;
    }

    public BigDecimal getSalePayment() {
        return salePayment;
    }

    public void setSaleChange(Double saleChange) {
        this.saleChange = saleChange;
    }

    public void setSalePayment(BigDecimal salePayment) {
        this.salePayment = salePayment;
    }

    public Short getSaleType() {
        return saleType;
    }

    public void setSaleType(Short saleType) {
        this.saleType = saleType;
    }

    public Short getSaleStatus() {
        return saleStatus;
    }

    public void setSaleStatus(Short saleStatus) {
        this.saleStatus = saleStatus;
    }

    public void setSaleChange(BigDecimal bigDecimal) {
    }
}