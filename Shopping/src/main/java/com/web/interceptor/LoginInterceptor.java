package com.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.web.entity.Admins;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2) throws Exception {
		System.out.println("登录拦截器=");
		System.out.println(arg0.getContextPath()+"/WEB-INF/view/adminlogin.jsp");
		HttpSession session=arg0.getSession();
		Admins admin=(Admins) session.getAttribute("loginAdmin");
		if(admin==null){
			/*arg1.sendRedirect(arg0.getContextPath()+"/WEB-INF/view/adminlogin.jsp");*/
			arg0.getRequestDispatcher("/WEB-INF/view/adminlogin.jsp").forward(arg0, arg1);
			return false;
			}
		else
			return true;
	}

}
