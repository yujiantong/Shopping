package com.web.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.entity.Permissions;

@Repository("PermissionsMapper")
public interface PermissionsMapper {
   public List<Permissions> findByRole(Integer roleId);
}