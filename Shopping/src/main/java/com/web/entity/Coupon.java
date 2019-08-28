package com.web.entity;

import java.io.Serializable;
import java.util.Date;

public class Coupon implements Serializable {
    private Integer couponId;
    private Users couponUser;
    private Integer couponReduce;
    private Integer couponAvail;
    private Date couponBegin;
    private Date couponEnd;
    private String couponRange;
    private Couponstatu couponState;

    private static final long serialVersionUID = 1L;

    public Integer getCouponId() {
        return couponId;
    }

    public void setCouponId(Integer couponId) {
        this.couponId = couponId;
    }

    public Integer getCouponReduce() {
        return couponReduce;
    }

    public void setCouponReduce(Integer couponReduce) {
        this.couponReduce = couponReduce;
    }

    public Integer getCouponAvail() {
        return couponAvail;
    }

    public void setCouponAvail(Integer couponAvail) {
        this.couponAvail = couponAvail;
    }

    public Date getCouponBegin() {
        return couponBegin;
    }

    public void setCouponBegin(Date couponBegin) {
        this.couponBegin = couponBegin;
    }

    public Date getCouponEnd() {
        return couponEnd;
    }

    public void setCouponEnd(Date couponEnd) {
        this.couponEnd = couponEnd;
    }

    public String getCouponRange() {
        return couponRange;
    }

    public void setCouponRange(String couponRange) {
        this.couponRange = couponRange == null ? null : couponRange.trim();
    }

	public Users getCouponUser() {
		return couponUser;
	}

	public void setCouponUser(Users couponUser) {
		this.couponUser = couponUser;
	}

	public Couponstatu getCouponState() {
		return couponState;
	}

	public void setCouponState(Couponstatu couponState) {
		this.couponState = couponState;
	}

}