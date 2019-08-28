package com.web.test;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.web.entity.Discuss;
import com.web.entity.Funs;
import com.web.entity.Integraldetail;
import com.web.entity.Users;
import com.web.mapper.DiscussMapper;
import com.web.mapper.IntegraldetailMapper;
import com.web.mapper.UsersMapper;
import com.web.service.DiscussService;
import com.web.service.FunsService;

public class LvTest {
	
	@Test
	public void testDiscussService() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		SqlSessionFactory sessionFactory =  (SqlSessionFactory) context.getBean("sqlSessionFactory");
		SqlSession session = sessionFactory.openSession();
		DiscussService discussService = context.getBean(DiscussService.class);
		List<Discuss> discussList = discussService.findByGoodsIdJoinUsers(14);
		for (Discuss discuss : discussList) {
			System.out.println(discuss.getDiscussComment());
		}
	}
	
	@Test
	public void testUserIntegral() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		SqlSessionFactory sessionFactory =  (SqlSessionFactory) context.getBean("sqlSessionFactory");
		SqlSession session = sessionFactory.openSession();
		UsersMapper usersMapper = context.getBean(UsersMapper.class);
		Users user = usersMapper.findByUserName("user");
		System.out.println(user.getUserIntegral());
	}
	
	@Test
	public void testSaveIntegraldetail() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		SqlSessionFactory sessionFactory =  (SqlSessionFactory) context.getBean("sqlSessionFactory");
		SqlSession session = sessionFactory.openSession();
		IntegraldetailMapper integraldetailMapper = context.getBean(IntegraldetailMapper.class);
		Integraldetail integraldetail = new Integraldetail();
		integraldetail.setIntegraldetailDate(new Date());
		integraldetail.setIntegraldetailIntegralnum(-2);
		integraldetailMapper.saveIntegraldetail(integraldetail );
		session.commit();
		System.out.println(integraldetail.getIntegraldetailId());
	}
	
	@Test
	public void testFuns() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		SqlSessionFactory sessionFactory =  (SqlSessionFactory) context.getBean("sqlSessionFactory");
		SqlSession session = sessionFactory.openSession();
		FunsService funsService = context.getBean(FunsService.class);
		List<Funs> funsList = funsService.funs(2);
		for (Funs funs : funsList) {
			System.out.println(funs.getFunName()+"1级");
			List<Funs> list = funs.getFundsList();
			for (Funs funs2 : list) {
				System.out.println(funs2.getFunName()+"2级");
			}
		}
	}
	
	@Test
	public void testDiscuss() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		SqlSessionFactory sessionFactory =  (SqlSessionFactory) context.getBean("sqlSessionFactory");
		SqlSession session = sessionFactory.openSession();
		DiscussMapper discussMapper = context.getBean(DiscussMapper.class);
		//session.commit();
		/*List<Map<String, Object>> mapList = discussMapper.countDiscussByStyle(1);
		System.out.println(mapList.size());
		for (Map<String, Object> map : mapList) {
			System.out.print(map.get("name")+"\t");
			System.out.print(map.get("num"));
			System.out.println();
		}*/
		List<Discuss> discussList = discussMapper.findByGoodsIdAndStyleIdJoinUsers(1, 1);
		System.out.println(discussList.size());
		for (Discuss discuss : discussList) {
			System.out.println(discuss.getDiscussComment()+discuss.getDiscussUser().getUserName());
		}
	}

	/*@Test
	public void test() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		SqlSessionFactory sessionFactory =  (SqlSessionFactory) context.getBean("sqlSessionFactory");
		SqlSession session = sessionFactory.openSession();
		FunsMapper funsMapper = context.getBean(FunsMapper.class);
		Funs funs = funsMapper.findByFunsId(1);
		System.out.println(funs.getFunName());
		session.commit();
		
	}
	
	@Test
	public void SecurityUtil() {
		String aValue = "654321";
		String sValue = DigestUtil.hmacSign(aValue, "ajjdfl;sdjfsajfl;sj");
		System.out.println(sValue);
		sValue = com.web.util.SecurityUtil.KL_MD5_Two(aValue);
		System.out.println(sValue);
	}
*/
}
