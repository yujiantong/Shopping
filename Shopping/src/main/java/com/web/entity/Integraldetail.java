package com.web.entity;

import java.io.Serializable;
import java.util.Date;

public class Integraldetail implements Serializable {
    private Integer integraldetailId;

    private Orders integraldetailOrder;

    private Date integraldetailDate;

    private Integer integraldetailIntegralnum;
    
    private Users integraldetailUser;

    private static final long serialVersionUID = 1L;

    public Users getIntegraldetailUser() {
		return integraldetailUser;
	}

	public void setIntegraldetailUser(Users integraldetailUser) {
		this.integraldetailUser = integraldetailUser;
	}

	public Integer getIntegraldetailId() {
        return integraldetailId;
    }

    public void setIntegraldetailId(Integer integraldetailId) {
        this.integraldetailId = integraldetailId;
    }

    public Date getIntegraldetailDate() {
        return integraldetailDate;
    }

    public void setIntegraldetailDate(Date integraldetailDate) {
        this.integraldetailDate = integraldetailDate;
    }

    public Integer getIntegraldetailIntegralnum() {
        return integraldetailIntegralnum;
    }

    public void setIntegraldetailIntegralnum(Integer integraldetailIntegralnum) {
        this.integraldetailIntegralnum = integraldetailIntegralnum;
    }

	public Orders getIntegraldetailOrder() {
		return integraldetailOrder;
	}

	public void setIntegraldetailOrder(Orders integraldetailOrder) {
		this.integraldetailOrder = integraldetailOrder;
	}
    
}