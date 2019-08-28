package com.web.entity;

import java.io.Serializable;
import java.util.Date;

public class Loginlog implements Serializable {
    private Integer loginlogId;

    private Admins loginlogAdmin;

    private String loginlogIp;

    private String loginlogAddress;

    private Date loginlogDate;

    private String loginlogResult;

    private String loginlogResultdesc;

    private static final long serialVersionUID = 1L;

    public Integer getLoginlogId() {
        return loginlogId;
    }

    public void setLoginlogId(Integer loginlogId) {
        this.loginlogId = loginlogId;
    }

    public Admins getLoginlogAdmin() {
        return loginlogAdmin;
    }

    public void setLoginlogAdmin(Admins loginlogAdmin) {
        this.loginlogAdmin = loginlogAdmin;
    }

    public String getLoginlogIp() {
        return loginlogIp;
    }

    public void setLoginlogIp(String loginlogIp) {
        this.loginlogIp = loginlogIp == null ? null : loginlogIp.trim();
    }

    public String getLoginlogAddress() {
        return loginlogAddress;
    }

    public void setLoginlogAddress(String loginlogAddress) {
        this.loginlogAddress = loginlogAddress == null ? null : loginlogAddress.trim();
    }

    public Date getLoginlogDate() {
        return loginlogDate;
    }

    public void setLoginlogDate(Date loginlogDate) {
        this.loginlogDate = loginlogDate;
    }

    public String getLoginlogResult() {
        return loginlogResult;
    }

    public void setLoginlogResult(String loginlogResult) {
        this.loginlogResult = loginlogResult == null ? null : loginlogResult.trim();
    }

    public String getLoginlogResultdesc() {
        return loginlogResultdesc;
    }

    public void setLoginlogResultdesc(String loginlogResultdesc) {
        this.loginlogResultdesc = loginlogResultdesc == null ? null : loginlogResultdesc.trim();
    }
}