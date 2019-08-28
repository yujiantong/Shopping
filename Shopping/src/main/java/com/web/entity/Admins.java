package com.web.entity;

import java.io.Serializable;

public class Admins implements Serializable {
    private Integer adminId;

    private String adminName;

    private String adminPass;

    private Roles adminRole;

    private static final long serialVersionUID = 1L;

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName == null ? null : adminName.trim();
    }

    public String getAdminPass() {
        return adminPass;
    }

    public void setAdminPass(String adminPass) {
        this.adminPass = adminPass == null ? null : adminPass.trim();
    }

	public Roles getAdminRole() {
		return adminRole;
	}

	public void setAdminRole(Roles adminRole) {
		this.adminRole = adminRole;
	}

}