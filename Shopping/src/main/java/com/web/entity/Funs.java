package com.web.entity;

import java.io.Serializable;
import java.util.List;

public class Funs implements Serializable {
    private Integer funId;

    private String funName;

    private String funUrl;

    private Funs funPid;

    private String funTarget;
    
    private List<Funs> fundsList;

    private static final long serialVersionUID = 1L;

    public List<Funs> getFundsList() {
		return fundsList;
	}

	public void setFundsList(List<Funs> fundsList) {
		this.fundsList = fundsList;
	}

	public Integer getFunId() {
        return funId;
    }

    public void setFunId(Integer funId) {
        this.funId = funId;
    }

    public String getFunName() {
        return funName;
    }

    public void setFunName(String funName) {
        this.funName = funName == null ? null : funName.trim();
    }

    public String getFunUrl() {
        return funUrl;
    }

    public void setFunUrl(String funUrl) {
        this.funUrl = funUrl == null ? null : funUrl.trim();
    }

    public Funs getFunPid() {
		return funPid;
	}

	public void setFunPid(Funs funPid) {
		this.funPid = funPid;
	}

	public String getFunTarget() {
        return funTarget;
    }

    public void setFunTarget(String funTarget) {
        this.funTarget = funTarget == null ? null : funTarget.trim();
    }
}