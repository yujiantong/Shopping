package com.web.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.web.entity.Cart;
import com.web.entity.Goods;
import com.web.entity.OrderDetail;
import com.web.entity.Orders;
import com.web.entity.Users;
import com.web.mapper.CartMapper;
import com.web.mapper.OrderDetailMapper;
import com.web.mapper.OrdersMapper;

public class TestZhang {

	@Test
	public void testFindAllUser() {
		CartMapper uMapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(CartMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();

		Cart c=uMapper.findCartByCartId(1);
		System.out.println(c.getCartNum());
		List<Cart> cartList=uMapper.findCartByUserId(1);
		for (Cart cart : cartList) {
			System.out.println(cart.getCartId());
			System.out.println(cart.getCartGoods().getGoodsId());
		}
		Cart cart1=new Cart();
		Goods cartGoods=new Goods();
		cartGoods.setGoodsId(1);
		cart1.setCartGoods(cartGoods);
		cart1.setCartNum(5);
		cart1.setCartPrice(12.5d);
		Users cartUser=new Users();
		cartUser.setUserId(1);
		cart1.setCartUser(cartUser);
		int res=uMapper.saveCart(cart1);
		s.commit();
		System.out.println(res);
	}
	@Test
	public void test1(){
		CartMapper uMapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(CartMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		Cart c=uMapper.findCartByCartId(1);
		c.setCartNum(100);
		int res=uMapper.updateCart(c);
		s.commit();
		System.out.println(res);
	}
	@Test
	public void test2(){
		OrderDetailMapper uMapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(OrderDetailMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		List<OrderDetail> o=uMapper.findDetailByOrderId("402889f95f80d09c015f80d09dd50000");
		System.out.println(o.get(0).getDetailOrder().getOrderId());
		System.out.println(o.get(0).getDetailNum());
		System.out.println(o.get(0).getDetailId());
	}
	@Test
	public void test3(){
		OrdersMapper uMapper=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(OrdersMapper.class);
		SqlSession s=new ClassPathXmlApplicationContext("applicationContext.xml").getBean(SqlSessionFactory.class).openSession();
		Orders o=new Orders();
		o.setOrderId("123654");
		int res=uMapper.saveOrders(o);
		s.commit();
		System.out.println(res);
	}
}
