package com.web.controller.back;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.entity.Admins;
import com.web.entity.Funs;
import com.web.exception.LoginErrorException;
import com.web.service.AdminService;
import com.web.service.FunsService;
import com.web.service.LoginlogService;
import com.web.service.LogisticsServic;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	@Qualifier("AdminService")
	private AdminService adminService;
	@Autowired
	@Qualifier("LoginlogService")
	private LoginlogService loginLogService;
	@Autowired
	@Qualifier("LogisticsServic")
	private LogisticsServic lService;
	@Autowired
	@Qualifier("FunsService")
	private FunsService funsService;

	@RequestMapping("adminLogin")
	@ResponseBody
	public boolean adminLogin(String adminName,String adminPass, HttpServletRequest request) {
		System.out.println("adminLogin");
		try {
			adminService.adminLogin(adminName, adminPass);
			Admins admin=adminService.findByName(adminName);
			request.getSession().setAttribute("loginAdmin", admin);
			request.getSession().setAttribute("orderSize", lService.findAllLogistics().size());
			//后台权限
			List<Funs> funsList = this.funsService.funs(admin.getAdminRole().getRoleId());
			request.getSession().setAttribute("funsList", funsList);
			return true;
		} catch (LoginErrorException e) {
			return false;
		}
		
		
/*		Admins loginAdmin = adminService.findByName(adminName);
		Loginlog loginLog = new Loginlog();
		try {
			loginLog.setLoginlogAddress(AddressUtils.getAddresses("ip="
					+ InetAddress.getLocalHost().getHostAddress().toString(),
					"utf-8"));
			loginLog.setLoginlogDate(new Date());
			loginLog.setLoginlogIp(InetAddress.getLocalHost().getHostAddress()
					.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 登录成功
		if (loginAdmin != null) {
			if (loginAdmin.getAdminPass().equals(adminPass)) {
				request.getSession().setAttribute("loginAdmin", loginAdmin);
				loginLog.setLoginlogAdmin(loginAdmin);
				loginLog.setLoginlogResult("登录成功");
				loginLogService.saveLoginLog(loginLog);
				return true;
			}else{
				loginLog.setLoginlogResult("登录失败");
				loginLog.setLoginlogResultdesc("密码错误"+adminPass);
				loginLogService.saveLoginLog(loginLog);
				return false;
			}
		} else {
			loginLog.setLoginlogResult("登录失败");
			loginLog.setLoginlogResultdesc("用户名不存在"+adminName);
			loginLogService.saveLoginLog(loginLog);
			return false;
		}*/
	}
	@RequestMapping("findAdminId")
	public String findAdminId(Integer adminId){
		adminService.findAdminId(adminId);
		return "redirect:/admin/findAllAdminInformation";
	}

	@RequestMapping("findAllAdminInformation")
	public String findAllAdminInformation(HttpServletRequest request) {
		List<Admins> adminList=adminService.findAllAdminInformation();
		request.setAttribute("adminList", adminList);
		return "manager/administrator";
	}

	@RequestMapping("deleteAdminsByAdminId")
	public String deleteAdminsByAdminId(Integer adminId) {
		adminService.deleteAdminsByAdminId(adminId);
		return "redirect:/admin/findAllAdminInformation";
	}
	
	@RequestMapping("saveAdmins")
	public String saveAdmins(Admins admin){
		adminService.saveAdmins(admin);
		return "redirect:/admin/findAllAdminInformation";
	}
}
