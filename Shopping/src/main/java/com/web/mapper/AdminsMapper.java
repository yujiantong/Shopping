package com.web.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.entity.Admins;

@Repository("AdminsMapper")
public interface AdminsMapper {
	public Admins findAdminId(Integer adminId);
	public List<Admins> findAllAdminInformation();
	public int saveAdmins(Admins admins);
	public int deleteAdminsByAdminId(Integer adminId);
	public int updateAdmins(Admins admins);
	public List<Admins> findAllAdmin();
	public Admins findByName(String adminName);
}