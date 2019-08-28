package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.Users;
import com.web.mapper.UsersMapper;

@Service("UsersService")
public class UsersService {

	@Autowired
	@Qualifier("UsersMapper")
	private UsersMapper usersMapper;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public Users findById(Integer userId){
		return usersMapper.findById(userId);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public int updateUser(Users user){
		return usersMapper.updateUser(user);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public int deleteUserById(Integer userId){
		return usersMapper.deleteUserById(userId);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public void updateUserIntegral(Users users) {
		try {
			this.usersMapper.updateUserIntegral(users);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public Users findByUserName(String userName) {
		return this.usersMapper.findByUserName(userName);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int saveUsers(Users user) {
		int res = 0;
		try {
			res = this.usersMapper.saveUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Users> findAllUser(){
		return usersMapper.findAllUser();
	}
			
}
