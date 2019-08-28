package com.web.entity;

import java.io.Serializable;
import java.util.List;

public class Roles implements Serializable {
    private Integer roleId;

    private String roleName;
    
    private List<Funs> funList;

    private static final long serialVersionUID = 1L;

    
    public List<Funs> getFunList() {
		return funList;
	}

	public void setFunList(List<Funs> funList) {
		this.funList = funList;
	}

	public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }
}