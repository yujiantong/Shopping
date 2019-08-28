package com.web.mapper;

import org.springframework.stereotype.Repository;

import com.web.entity.Roles;

@Repository("RolesMapper")
public interface RolesMapper {
	public Roles findByRoleId(Integer roleId);
}