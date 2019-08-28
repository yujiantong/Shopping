package com.web.test;

import static org.junit.Assert.*;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.web.entity.Admins;
import com.web.entity.Funs;
import com.web.entity.Goods;
import com.web.entity.Loginlog;
import com.web.mapper.FunsMapper;
import com.web.mapper.LoginlogMapper;

public class TaoTest {

	@Test
	public void test() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		SqlSessionFactory sessionFactory =  (SqlSessionFactory) context.getBean("sqlSessionFactory");
		SqlSession session = sessionFactory.openSession();
		LoginlogMapper loginlogMapper = context.getBean(LoginlogMapper.class);
		/*List<Loginlog> list=loginlogMapper.findAll();
		for (Loginlog l : list) {
			System.out.println(l.getLoginlogId()+"\t"+l.getLoginlogAdmin().getAdminId()+"\t"+l.getLoginlogIp());
		}*/
		/*Integer n=loginlogMapper.deleteLoginlogById(1);
		System.out.println(n);*/
		
		/*Loginlog l=new Loginlog();
		l.setLoginlogId(2);
		Admins loginlogAdmin=new Admins();
		loginlogAdmin.setAdminId(1);
		l.setLoginlogAdmin(loginlogAdmin);
		loginlogMapper.saveLoginlog(l);*/
		
		/*Loginlog l=new Loginlog();
		l.setLoginlogId(1);
		l.setLoginlogAddress("qwertyu");
		loginlogMapper.updateLoginlogById(l);*/
		session.commit();
	}

}
