package com.web.entity;

import java.io.Serializable;

public class Integralexchange implements Serializable {
    private Integer integralexchangeId;

    private Integer integralexchangeAvail;

    private Integer integralexchangeReduce;

    private String integralexchangeRange;

    private Integer integralexchangeTerm;

    private Integer integralexchangeIntegralnum;

    private static final long serialVersionUID = 1L;

    public Integer getIntegralexchangeId() {
        return integralexchangeId;
    }

    public void setIntegralexchangeId(Integer integralexchangeId) {
        this.integralexchangeId = integralexchangeId;
    }

    public Integer getIntegralexchangeAvail() {
        return integralexchangeAvail;
    }

    public void setIntegralexchangeAvail(Integer integralexchangeAvail) {
        this.integralexchangeAvail = integralexchangeAvail;
    }

    public Integer getIntegralexchangeReduce() {
        return integralexchangeReduce;
    }

    public void setIntegralexchangeReduce(Integer integralexchangeReduce) {
        this.integralexchangeReduce = integralexchangeReduce;
    }

    public String getIntegralexchangeRange() {
        return integralexchangeRange;
    }

    public void setIntegralexchangeRange(String integralexchangeRange) {
        this.integralexchangeRange = integralexchangeRange == null ? null : integralexchangeRange.trim();
    }

    public Integer getIntegralexchangeTerm() {
        return integralexchangeTerm;
    }

    public void setIntegralexchangeTerm(Integer integralexchangeTerm) {
        this.integralexchangeTerm = integralexchangeTerm;
    }

    public Integer getIntegralexchangeIntegralnum() {
        return integralexchangeIntegralnum;
    }

    public void setIntegralexchangeIntegralnum(Integer integralexchangeIntegralnum) {
        this.integralexchangeIntegralnum = integralexchangeIntegralnum;
    }
}