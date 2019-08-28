package com.web.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.entity.Users;
@Repository("UsersMapper")
public interface UsersMapper {
	public Users findById(Integer userId);
    public int saveUser(Users user);
    public int delUser(Integer userId);
    public int updateUser(Users user);
    public List<Users> findAllUser();
    public Users findByUserName(String userName);
	public int updateUserIntegral(Users users);
	public int deleteUserById(Integer userId);
}