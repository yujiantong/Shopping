package com.web.entity;

import java.io.Serializable;
import java.util.Date;

public class Footmark implements Serializable {
    private Integer footmarkId;

    private Users footmarkUser;

    private Goods footmarkGood;

    private Date footmarkDate;

    private Integer footmarkTimes;

    private static final long serialVersionUID = 1L;

    public Integer getFootmarkId() {
        return footmarkId;
    }

    public void setFootmarkId(Integer footmarkId) {
        this.footmarkId = footmarkId;
    }

    public Users getFootmarkUser() {
		return footmarkUser;
	}

	public void setFootmarkUser(Users footmarkUser) {
		this.footmarkUser = footmarkUser;
	}

	public Goods getFootmarkGood() {
		return footmarkGood;
	}

	public void setFootmarkGood(Goods footmarkGood) {
		this.footmarkGood = footmarkGood;
	}

	public Date getFootmarkDate() {
        return footmarkDate;
    }

    public void setFootmarkDate(Date footmarkDate) {
        this.footmarkDate = footmarkDate;
    }

    public Integer getFootmarkTimes() {
        return footmarkTimes;
    }

    public void setFootmarkTimes(Integer footmarkTimes) {
        this.footmarkTimes = footmarkTimes;
    }
}