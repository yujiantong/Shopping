package com.web.entity;

import java.io.Serializable;

public class Couponstatu implements Serializable {
    private Integer couponstateId;

    private String couponstateName;

    private static final long serialVersionUID = 1L;

    public Integer getCouponstateId() {
        return couponstateId;
    }

    public void setCouponstateId(Integer couponstateId) {
        this.couponstateId = couponstateId;
    }

    public String getCouponstateName() {
        return couponstateName;
    }

    public void setCouponstateName(String couponstateName) {
        this.couponstateName = couponstateName == null ? null : couponstateName.trim();
    }
}