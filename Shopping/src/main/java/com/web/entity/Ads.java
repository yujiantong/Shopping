package com.web.entity;

import java.io.Serializable;
import java.util.Date;

public class Ads implements Serializable {
    private Integer adsId;

    private String adsDesc;

    private Date adsBegaintime;

    private Date adsEndtime;

    private String adsPath;

    private String adsImg;
    
    private String adsType;
    private String adsSize;
    private Status adsState;

    private static final long serialVersionUID = 1L;

    public Integer getAdsId() {
        return adsId;
    }

    public void setAdsId(Integer adsId) {
        this.adsId = adsId;
    }

    public String getAdsDesc() {
        return adsDesc;
    }

    public void setAdsDesc(String adsDesc) {
        this.adsDesc = adsDesc == null ? null : adsDesc.trim();
    }

    public Date getAdsBegaintime() {
        return adsBegaintime;
    }

    public void setAdsBegaintime(Date adsBegaintime) {
        this.adsBegaintime = adsBegaintime;
    }

    public Date getAdsEndtime() {
        return adsEndtime;
    }

    public void setAdsEndtime(Date adsEndtime) {
        this.adsEndtime = adsEndtime;
    }

    public String getAdsPath() {
        return adsPath;
    }

    public void setAdsPath(String adsPath) {
        this.adsPath = adsPath == null ? null : adsPath.trim();
    }

    public String getAdsImg() {
        return adsImg;
    }

    public void setAdsImg(String adsImg) {
        this.adsImg = adsImg == null ? null : adsImg.trim();
    }

	public String getAdsType() {
		return adsType;
	}

	public void setAdsType(String adsType) {
		this.adsType = adsType;
	}

	public String getAdsSize() {
		return adsSize;
	}

	public void setAdsSize(String adsSize) {
		this.adsSize = adsSize;
	}

	public Status getAdsState() {
		return adsState;
	}

	public void setAdsState(Status adsState) {
		this.adsState = adsState;
	}
    
}