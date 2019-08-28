package com.web.controller.font;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.web.entity.Integraldetail;
import com.web.entity.Users;
import com.web.service.IntegraldetailService;
import com.web.service.UsersService;
import com.web.util.SecurityUtil;
import com.web.util.SendMsgUtil;

import weibo4j.Oauth;
import weibo4j.model.WeiboException;
import weibo4j.util.BareBonesBrowserLaunch;

@Controller
@RequestMapping("UsersController")
public class UsersController {

	@Autowired
	@Qualifier("UsersService")
	private UsersService usersService;
	@Autowired
	@Qualifier("IntegraldetailService")
	private IntegraldetailService integraldetailService;
	
	/**
	 * user退出
	 * @param session
	 * @return
	 */
	@RequestMapping("exitLogin")
	public String exitLogin(HttpSession session) {
		session.removeAttribute("loginUsers");
		return "redirect:/goodstype/findAll";
	}
	
	/**
	 * user登录
	 * @param users
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("userLogin")
	public String userLogin(Users users, HttpServletRequest request, HttpSession session) {
		users.setUserPassword(SecurityUtil.KL_MD5_Two(users.getUserPassword()));
		Users  loginUsers = this.usersService.findByUserName(users.getUserName());
		if(loginUsers == null || !loginUsers.getUserPassword().equals(users.getUserPassword())) {
			request.setAttribute("msg", "用户名或密码有误!");
			return "shop/login";
		} else {
			//登录给积分
			Integraldetail integraldetailf = this.integraldetailService.findByDate(loginUsers);
			if(integraldetailf == null) {
				if(loginUsers.getUserIntegral() == null) {
					loginUsers.setUserIntegral(0);
				}
				loginUsers.setUserIntegral(loginUsers.getUserIntegral()+5);
				this.usersService.updateUserIntegral(loginUsers);
				Integraldetail integraldetail = new Integraldetail();
				integraldetail.setIntegraldetailDate(new Date());
				integraldetail.setIntegraldetailIntegralnum(5);
				integraldetail.setIntegraldetailOrder(null);
				integraldetail.setIntegraldetailUser(loginUsers);
				this.integraldetailService.saveIntegraldetail(integraldetail );
			}
			session.setAttribute("loginUsers", loginUsers);
			return "redirect:/goodstype/findAll";
		}
	}
	
	/**
	 * 判定用户名是否存在
	 * @param userName
	 * @return
	 */
	@RequestMapping("judgeUserName")
	@ResponseBody
	public String judgeUserName(String userName) {
		Users users = this.usersService.findByUserName(userName);
		if(users == null)
			return null;
		return "no";
	}
	
	/**
	 * 注册user
	 * @param user
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("saveUser")
	public String saveUser(Users user, HttpServletRequest request, HttpSession session) {
		user.setUserPassword(SecurityUtil.KL_MD5_Two(user.getUserPassword()));
		user.setUserIntegral(0);
		int res = this.usersService.saveUsers(user);
		if(res != 0) {
			session.setAttribute("randomCode", null);
			return "shop/login";
		} else {
			request.setAttribute("msg", "注册失败！");
			return "shop/zhuce";
		}
	}
	
	/**
	 * 短信验证
	 * @param userPhone
	 * @param session
	 * @return
	 */
	@RequestMapping("sendMsg")
	@ResponseBody
	public String sendMsg(String userPhone, HttpSession session) {
		String randomCode = SendMsgUtil.createRandomVcode();
		//短信验证
		String resSend = SendMsgUtil.sendMsg(userPhone, "【云众支付宝】您的验证码是"+randomCode);
		System.out.println(userPhone);
		session.setAttribute("randomCode", randomCode);
		return randomCode;
	}
	@RequestMapping("weiBoLogin")
	@ResponseBody
	public String weiBoLogin(){
		System.out.println("haha");
		Oauth oauth=new Oauth();
		try {
			BareBonesBrowserLaunch.openURL(oauth.authorize("code", ""));
			
		} catch (WeiboException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return "";
	}
}












