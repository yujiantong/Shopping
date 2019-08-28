package com.web.entity;

import java.io.Serializable;

public class Permissions implements Serializable {
    private Roles permissionRole;

    private Funs permissionFun;

    private static final long serialVersionUID = 1L;

	public Roles getPermissionRole() {
		return permissionRole;
	}

	public void setPermissionRole(Roles permissionRole) {
		this.permissionRole = permissionRole;
	}

	public Funs getPermissionFun() {
		return permissionFun;
	}

	public void setPermissionFun(Funs permissionFun) {
		this.permissionFun = permissionFun;
	}

 
}