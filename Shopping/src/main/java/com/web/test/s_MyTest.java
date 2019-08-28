package com.web.test;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.web.entity.Admins;
import com.web.entity.Ads;
import com.web.entity.Discuss;
import com.web.entity.Express;
import com.web.entity.Goods;
import com.web.entity.Loginlog;
import com.web.entity.Logistics;
import com.web.entity.Orders;
import com.web.entity.Permissions;
import com.web.entity.Status;
import com.web.entity.Toaddress;
import com.web.entity.Users;
import com.web.mapper.AdsMapper;
import com.web.mapper.DiscussMapper;
import com.web.mapper.ExpressMapper;
import com.web.mapper.GoodsMapper;
import com.web.mapper.LoginlogMapper;
import com.web.mapper.LogisticsMapper;
import com.web.mapper.OrdersMapper;
import com.web.mapper.PermissionsMapper;
import com.web.mapper.StatusMapper;
import com.web.mapper.ToaddressMapper;
import com.web.mapper.UsersMapper;
import com.web.service.AdminService;
import com.web.service.LoginlogService;
import com.web.service.OrderService;
import com.web.vo.SearchOrderVO;

public class s_MyTest {

	@Test
	public void testFindAllUser() {
		UsersMapper uMapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(UsersMapper.class);
		List<Users> userList=uMapper.findAllUser();
		for (Users users : userList) {
			System.out.println(users.getUserName());
		}
	}
	@Test
	public void test1Update() {
		UsersMapper uMapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(UsersMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		Users u=new Users();
		u.setUserName("ss");
		u.setUserId(1);
		Integer n=uMapper.updateUser(u);
		System.out.println(n);
		s.commit();
		
	}
	@Test
	public void test1Del() {
		UsersMapper uMapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(UsersMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		Integer n=uMapper.delUser(2);
		System.out.println(n);
		s.commit();
		
	}
	@Test
	public void test1Insert() {
		UsersMapper uMapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(UsersMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		Users u=new Users();
		u.setUserName("zz");
		uMapper.saveUser(u);
		s.commit();
		
	}
	
	
	
	
	
	
	
	@Test
	public void testFindAllToAddress() {
		ToaddressMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(ToaddressMapper.class);
		List<Toaddress> List=Mapper.findAllToAddress();
		for (Toaddress toaddress : List) {
			System.out.println(toaddress.getAddressId());
		}
	}
	@Test
	public void testupdateToAddress() {
		ToaddressMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(ToaddressMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		Toaddress t=new Toaddress();
		t.setAddressId(1);
		t.setAddressDesc("ddd");
		Mapper.updateToAddress(t);
		s.commit();
		
	}
	@Test
	public void testdelToAddress() {
		ToaddressMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(ToaddressMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		Mapper.delToAddress(1);
		s.commit();
		
	}
	@Test
	public void testsaveToAddress() {
		ToaddressMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(ToaddressMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		Toaddress t=new Toaddress();
		t.setAddressId(1);
		t.setAddressDesc("ddd");
		Users addressUser=new Users();
		addressUser.setUserId(1);
		t.setAddressUser(addressUser);
		Mapper.saveToAddress(t);
		s.commit();
		
	}

	@Test
	public void testdelStatus() {
		StatusMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(StatusMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		Mapper.delStatus(1);
		s.commit();
		/*List<Status> List=Mapper.findAllStatus();
		for (Status statu : List) {
			System.out.println(statu.getStatuName());
		}*/
	}
	@Test
	public void testFindAllStatus() {
		StatusMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(StatusMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		
		List<Status> List=Mapper.findAllStatus();
		for (Status statu : List) {
			System.out.println(statu.getStatuName());
		}
	}
	@Test
	public void testupdateStatus() {
		StatusMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(StatusMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		Status ss=new Status();
		ss.setStatuName("dd");
		ss.setStatuId(2);
		Mapper.updateStatus(ss);
		s.commit();
		
	}
	@Test
	public void testsaveStatus() {
		StatusMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(StatusMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		Status ss=new Status();
		ss.setStatuName("dd");
		Mapper.saveStatus(ss);
		s.commit();
		
	}
	
	@Test
	public void testfindByRole() {
		PermissionsMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(PermissionsMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		List<Permissions> list=Mapper.findByRole(1);
		for (Permissions permissions : list) {
			System.out.println(permissions.getPermissionFun().getFunName());
		}
		
	}
	@Test
	public void testfindAllAds() {
		AdsMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(AdsMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		List<Ads> list=Mapper.findAllAds();
		for (Ads ads : list) {
			System.out.println(ads.getAdsDesc());
		}
		
	}
	@Test
	public void testupdateAds() {
		AdsMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(AdsMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		Ads ad=new Ads();
		ad.setAdsId(1);
		ad.setAdsDesc("zzzzzzzzz");
		Mapper.updateAds(ad);
		s.commit();
		
	}
	@Test
	public void testdelAds() {
		AdsMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(AdsMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		
		Mapper.delAds(1);
		s.commit();
		
	}
	@Test
	public void testsaveAds() {
		AdsMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(AdsMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		Ads ad=new Ads();
		ad.setAdsDesc("zzzzzzzzz");
		Mapper.saveAds(ad);
		s.commit();
		
	}
	@Test
	public void testFindAllLogistics() {
		LogisticsMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(LogisticsMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		List<Logistics> list=Mapper.findAllLogistics();
		for (Logistics logistics : list) {
			System.out.println(logistics.getLogisticsOrder().getOrderId());
		}
		s.commit();
		
	}
	@Test
	public void testupdateLogistics() {
		LogisticsMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(LogisticsMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		Logistics l=new Logistics();
		l.setLogisticsId(2);
		l.setLogisticsMsg("dddd");
		Express logisticsExpress=new Express();
		logisticsExpress.setExpressId(2);
		l.setLogisticsExpress(logisticsExpress);
		Mapper.updateLogistics(l);
		s.commit();
	}
	@Test
	public void testdelLogistics() {
		LogisticsMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(LogisticsMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		Mapper.delLogistics(1);
		s.commit();
	}
	@Test
	public void testsaveLogistics() {
		LogisticsMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(LogisticsMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		Logistics l=new Logistics();
		l.setLogisticsMsg("z");
		Mapper.saveLogistics(l);
		s.commit();
	}
	@Test
	public void testfindBystatuOrder() {
		OrdersMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(OrdersMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		System.out.println(Mapper.findOrdersByStatu(1));
		s.commit();
	}
	@Test
	public void testgetOrderNum() {
		OrdersMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(OrdersMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		System.out.println(Mapper.findOrdersByStatu(1).get(0).getOrderAllPrice());
		s.commit();
	}
	@Test
	public void testfindVO() {
		LogisticsMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(LogisticsMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		SearchOrderVO vo=new SearchOrderVO("2017", 1);
		System.out.println(Mapper.findByVO(vo).get(0).getLogisticsOrder().getOrderId());
	}

	@Test
	public void testDate() {
		Date d=new Date();
		System.out.println(d.toString().substring(24));
	}
	@Test
	public void testFindGoodByType() {
		GoodsMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(GoodsMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		
		List<Goods> List=Mapper.findByType(39);
		for (Goods good : List) {
			System.out.println(good.getGoodsName());
		}
	}
	@Test
	public void testFindOrder() {
		LogisticsMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(LogisticsMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		List<Logistics> List=Mapper.findByIdOrDate(null,"2017-10-13");
		System.out.println(List);
		
	}

	@Test
	public void testexpress() {
		ExpressMapper Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(ExpressMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		System.out.println(Mapper.findAllExpress().size());
		
	}
	@Test
	public void testFindOrderByType() {
		OrderService Mapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(OrderService.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		List<Orders> List=Mapper.findByParentType(1);
		System.out.println(List);
		
	}
	@Test
	public void sendmsg() {

		
		//SendMsgUtil.sendMsg("15910344486", "【云众支付宝】您的验证码是"+SendMsgUtil.createRandomVcode());
	}
	@Test
	public void aop() {
		ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
		AdminService adminService=context.getBean(AdminService.class);
		adminService.adminLogin("admin", "12345");
	}
	@Test
	public void lgoinLog() {
		ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
		LoginlogMapper mapper=context.getBean(LoginlogMapper.class);
		SqlSession session=context.getBean(SqlSessionFactory.class).openSession();
		Loginlog l=new Loginlog();
		l.setLoginlogAddress("dddddd");
		Admins loginlogAdmin=new Admins();
		loginlogAdmin.setAdminId(1);
		l.setLoginlogAdmin(loginlogAdmin);
		l.setLoginlogDate(new Date());
		l.setLoginlogIp("192.168.0.0");
		l.setLoginlogResult("test");
		l.setLoginlogResultdesc("testID");
		System.out.println(mapper.saveLoginlog(l));
		session.commit();
		System.out.println(l.getLoginlogId());
	}
	@Test
	public void lgoinLog222() {
		ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
		LoginlogService mapper=context.getBean(LoginlogService.class);
		SqlSession session=context.getBean(SqlSessionFactory.class).openSession();
		Loginlog l=new Loginlog();
		l.setLoginlogAddress("dddddd");
		Admins loginlogAdmin=new Admins();
		loginlogAdmin.setAdminId(1);
		l.setLoginlogAdmin(loginlogAdmin);
		l.setLoginlogDate(new Date());
		l.setLoginlogIp("192.168.0.0");
		l.setLoginlogResult("test");
		l.setLoginlogResultdesc("testID");
		mapper.saveLoginLog(l);
		session.commit();
		System.out.println(l.getLoginlogId());
	}
	@Test
	public void lgoinLogFindByID() {
		ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
		LoginlogMapper mapper=context.getBean(LoginlogMapper.class);
		Loginlog l=mapper.findById(1);
		System.out.println(l.getLoginlogResultdesc());
	}
	
}
