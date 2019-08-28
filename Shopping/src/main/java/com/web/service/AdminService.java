package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.Admins;
import com.web.exception.LoginErrorException;
import com.web.mapper.AdminsMapper;

@Service("AdminService")
public class AdminService {
	@Autowired
	@Qualifier("AdminsMapper")
	private AdminsMapper aMapper;
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public int updateAdmins(Admins admin){
		return aMapper.updateAdmins(admin);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public Admins findAdminId(Integer adminId){
		return aMapper.findAdminId(adminId);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public Admins findByName(String adminName){
		return aMapper.findByName(adminName);
	}
	//@Transactional(propagation=Propagation.REQUIRED)
	public boolean adminLogin(String adminName,String adminPass){
		Admins admin= aMapper.findByName(adminName);
		if(admin==null){
			throw new LoginErrorException("1001", "用户不存在");                            //无此用户名
		}else{
			if(admin.getAdminPass().equals(adminPass)){
					return true;					//登录成功
			}else{
				throw new LoginErrorException("1002", "登录密码错误");    				//密码错误
			}
		}
		    
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Admins> findAllAdminInformation(){
		return aMapper.findAllAdminInformation();
	}
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public Integer deleteAdminsByAdminId(Integer adminId){
		return aMapper.deleteAdminsByAdminId(adminId);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public Integer saveAdmins(Admins admins){
		return aMapper.saveAdmins(admins);
	}
}
