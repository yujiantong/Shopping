package com.web.controller.back;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.entity.Admins;
import com.web.entity.Loginlog;
import com.web.service.AdminService;
import com.web.service.LoginlogService;

@Controller
@RequestMapping("Loginlog")
public class LoginlogController {
	@Autowired
	@Qualifier("LoginlogService")
	private LoginlogService loginLogService;
	
	@Autowired
	@Qualifier("AdminService")
	private AdminService adminService;
	
	@RequestMapping("updateAdmins")
	public String updateAdmins(Admins admin){
		System.out.println(admin.getAdminName()+"44444444444");
		adminService.updateAdmins(admin);
		return "redirect:/Loginlog/findAll";
	}
	
	@RequestMapping("findAll")
	public String findAll(HttpServletRequest request,HttpSession session,Integer adminId){
		//adminService.findAdminId(adminId);
		Admins admins=(Admins) session.getAttribute("loginAdmin");
		Admins admin=adminService.findAdminId(admins.getAdminId());
		
		List<Loginlog> loginlogList=loginLogService.findAll();
		request.setAttribute("admin", admin);
		request.setAttribute("loginlogList", loginlogList);
		return "manager/admin_info";
	}
}
