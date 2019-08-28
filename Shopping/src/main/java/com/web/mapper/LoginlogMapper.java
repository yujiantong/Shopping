package com.web.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.entity.Loginlog;

@Repository("LoginlogMapper")
public interface LoginlogMapper {
	public List<Loginlog> findAll();
	public int saveLoginlog(Loginlog loginlog);
	public int deleteLoginlogById(Integer loginlogId);
	public void updateLoginlogById(Loginlog loginlog);
	public Loginlog findById(Integer loginLogId);
}