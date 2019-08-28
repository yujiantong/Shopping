/*package com.web.controller.font;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import weibo4j.Oauth;
import weibo4j.Users;
import weibo4j.http.AccessToken;
import weibo4j.model.User;
import weibo4j.model.WeiboException;

@Controller
@RequestMapping("weiBoGetLogin")
public class WeiBoGetLogin {
	@RequestMapping("afterLogin")
	public String afterLogin(HttpServletRequest request){
		String code=request.getParameter("code");
		try {
			Oauth oauth=new Oauth();
			String token=oauth.getAccessTokenByCode(code).toString();
			Users users=new Users(token);
			String str[]=token.split(",");
			String accessToken=str[0].split("=")[1];
			String str1[] =str[3].split("]");
			String uid=str1[0].split("=")[1];
			com.web.entity.Users loginUsers=new com.web.entity.Users();
			loginUsers.setUserName("孙奋逗");
			request.getSession().setAttribute("loginUsers", loginUsers);
		} catch (WeiboException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/goodstype/findAll";
	}
}
*/