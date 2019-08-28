package com.web.entity;

import java.io.Serializable;

public class Status implements Serializable {
    private Integer statuId;

    private String statuName;

    private static final long serialVersionUID = 1L;

    public Integer getStatuId() {
        return statuId;
    }

    public void setStatuId(Integer statuId) {
        this.statuId = statuId;
    }

    public String getStatuName() {
        return statuName;
    }

    public void setStatuName(String statuName) {
        this.statuName = statuName == null ? null : statuName.trim();
    }
}