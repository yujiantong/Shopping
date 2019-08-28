package com.web.listener;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.web.entity.Goodstype;
import com.web.entity.Status;
import com.web.service.GoodsService;
import com.web.service.GoodstypeService;

@WebListener
public class ApplicationTypeListener implements ServletContextListener {

    public ApplicationTypeListener() {
    }

    public void contextInitialized(ServletContextEvent arg0)  { 
    	ServletContext application = arg0.getServletContext();
    	GoodstypeService goodstypeService = WebApplicationContextUtils.getWebApplicationContext(application).getBean(GoodstypeService.class);
    	List<Goodstype> typeList=goodstypeService.findAll();
    	application.setAttribute("typeList", typeList);
    	System.out.println("启动成功=====》》》》》商品类型已加载");
    }
    public void contextDestroyed(ServletContextEvent arg0)  { 
    }
	
}
