package com.web.aop;

import java.net.InetAddress;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import com.web.entity.Admins;
import com.web.entity.Loginlog;
import com.web.service.AdminService;
import com.web.service.LoginlogService;
import com.web.service.LogisticsServic;
import com.web.util.AddressUtils;

@Aspect
@Component("LoginLogAOP")
public class LoginLogAOP {
	
	@Autowired
	@Qualifier("AdminService")
	private AdminService adminService;
	@Autowired
	@Qualifier("LoginlogService")
	private LoginlogService lService;
	private Integer loginLogId=null;
	/**
	 * 切入点 
	 */
	@Pointcut("execution(* com.web.service.AdminService.adminLogin(..))")
	public void pointCut(){
		
	}
	@After("pointCut()")
	public void afterLogin(JoinPoint jp){
		System.out.println("after"+"\t"+jp.getArgs()[0]);
		Admins admin=adminService.findByName((String)jp.getArgs()[0]);
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
		loginLog.setLoginlogAdmin(admin);
		loginLog.setLoginlogResult("登录成功");
		System.out.println(lService.saveLoginLog(loginLog)+"*************");
		System.out.println(loginLog.getLoginlogId());
		loginLogId=loginLog.getLoginlogId();
	}
	@AfterThrowing(pointcut="pointCut()",throwing="e")
	public void getException(Exception e){
		System.out.println("exception");
		Loginlog loginLog=lService.LoginLogFindById(loginLogId);
		if(loginLog!=null){
		loginLog.setLoginlogResult("登录失败");
		loginLog.setLoginlogResultdesc(e.getMessage());}
		lService.updateLoginlogById(loginLog);
	}
}
