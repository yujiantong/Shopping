package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.Loginlog;
import com.web.mapper.LoginlogMapper;

@Service("LoginlogService")
public class LoginlogService {
	@Autowired
	@Qualifier("LoginlogMapper")
	private LoginlogMapper loginlogmapper;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Loginlog> findAll(){
		return loginlogmapper.findAll();
	}
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public Integer saveLoginLog(Loginlog loginLog){
		try {
			return loginlogmapper.saveLoginlog(loginLog);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
			
		}
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public Loginlog LoginLogFindById(Integer loginLogId){
		return loginlogmapper.findById(loginLogId);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public void updateLoginlogById(Loginlog loginlog){
		try {
			loginlogmapper.updateLoginlogById(loginlog);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
