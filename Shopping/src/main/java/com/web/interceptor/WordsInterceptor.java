package com.web.interceptor;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class WordsInterceptor implements HandlerInterceptor {
	
	private static List<String> banWordsList = new ArrayList<String>();
	private static List<String> auditWordsList = new ArrayList<String>();
	private static List<String> replaceWordsList = new ArrayList<String>();
	
	static{
		try {
			String path = WordsInterceptor.class.getClassLoader().getResource("cn/itcast/words").getPath();
			File[] files = new File(path).listFiles();
			for (File file : files) {
				if(!file.getName().endsWith(".txt")) {
					continue;
				}
				BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file), "UTF-8"));
				String line = null;
				while((line=br.readLine()) != null) {
					String[] s = line.split("\\|");
					if(s.length != 2) {
						continue;
					}
					if(s[1].trim().equals("1")) {
						banWordsList.add(s[0].trim());
					}
					if(s[1].trim().equals("2")) {
						auditWordsList.add(s[0].trim());
					}
					if(s[1].trim().equals("3")) {
						replaceWordsList.add(s[0].trim());
					}
				}
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2) throws Exception {
		System.out.println("敏感词拦截器************");
		String discussComment = arg0.getParameter("msgName");
		//String msg=new String(discussComment.getBytes("ISO-8859-1"),"UTF-8");
		System.out.println(discussComment+"=========");
		for (String regex : banWordsList) {
			Pattern pattern = Pattern.compile(regex);
			Matcher matcher = pattern.matcher(discussComment);
			if(matcher.find()) {
				System.out.println("敏感词==出现！！");
				arg0.getSession().setAttribute("msg", "备注中包含非法词汇，请检查后再提交！！！");
				//arg0.getRequestDispatcher("path/shop/defaultsavediucuss").forward(arg0, arg1);
				arg1.sendRedirect(arg0.getContextPath()+"/path/manager/product-category-add");
				System.out.println("end");
				return false;
			}
		}
		return true;
	}
}
