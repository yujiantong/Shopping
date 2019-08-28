package com.web.entity;

import java.io.Serializable;

public class Logistics implements Serializable {
    private Integer logisticsId;

    private Orders logisticsOrder;

    private Status logisticsStatu;

    private String logisticsMsg;
    
    private Express logisticsExpress;

    private static final long serialVersionUID = 1L;

    public Integer getLogisticsId() {
        return logisticsId;
    }

    public void setLogisticsId(Integer logisticsId) {
        this.logisticsId = logisticsId;
    }

    public Orders getLogisticsOrder() {
		return logisticsOrder;
	}

	public void setLogisticsOrder(Orders logisticsOrder) {
		this.logisticsOrder = logisticsOrder;
	}

	public Status getLogisticsStatu() {
		return logisticsStatu;
	}

	public void setLogisticsStatu(Status logisticsStatu) {
		this.logisticsStatu = logisticsStatu;
	}

	public String getLogisticsMsg() {
        return logisticsMsg;
    }

    public void setLogisticsMsg(String logisticsMsg) {
        this.logisticsMsg = logisticsMsg == null ? null : logisticsMsg.trim();
    }

	public Express getLogisticsExpress() {
		return logisticsExpress;
	}

	public void setLogisticsExpress(Express logisticsExpress) {
		this.logisticsExpress = logisticsExpress;
	}
    
}