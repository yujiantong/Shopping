package com.web.controller.back;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.entity.Users;
import com.web.service.UsersService;

@Controller
@RequestMapping("UserBackController")
public class UserBackController {
	@Autowired
	@Qualifier("UsersService")
	private UsersService usersService;
	
	@RequestMapping("findByUserId")
	public String findByUserId(Integer userId,HttpServletRequest request){
		Users user=usersService.findById(userId);
		request.setAttribute("user", user);
		return "manager/updateUser";
	}
	
	@RequestMapping("updateUser")
	public String updateUser(Users user){
		usersService.updateUser(user);
		return "redirect:/UserBackController/findAllUser";
	}
	
	@RequestMapping("deleteUserById")
	public String deleteUserById(Integer userId){
		usersService.deleteUserById(userId);
		return "redirect:/UserBackController/findAllUser";
	}
	
	@RequestMapping("saveUser")
	public String saveUser(Users user, HttpServletRequest request) {
		int res = this.usersService.saveUsers(user);
		return "redirect:/UserBackController/findAllUser";
	}
	
	@RequestMapping("findAllUser")
	public String findAllUser(HttpServletRequest request){
		List<Users> userList=usersService.findAllUser();
		userList.remove(usersService.findByUserName("somebody"));
		request.setAttribute("userList", userList);
		return "manager/user_list";
	}
}
