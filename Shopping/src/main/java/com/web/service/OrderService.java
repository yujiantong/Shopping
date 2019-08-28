package com.web.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.Integraldetail;
import com.web.entity.Logistics;
import com.web.entity.OrderDetail;
import com.web.entity.Orders;
import com.web.entity.Status;
import com.web.entity.Users;
import com.web.mapper.IntegraldetailMapper;
import com.web.mapper.LogisticsMapper;
import com.web.mapper.OrdersMapper;
import com.web.mapper.StatusMapper;
import com.web.mapper.UsersMapper;

@Service("OrderService")
public class OrderService {
	@Autowired
	@Qualifier("OrdersMapper")
	private OrdersMapper oMapper;
	@Autowired
	@Qualifier("OrderDetailService")
	private OrderDetailService detailService;
	@Autowired
	@Qualifier("LogisticsMapper")
	private LogisticsMapper logMapper;
	@Autowired
	@Qualifier("StatusMapper")
	private StatusMapper statuMapper;
	@Autowired
	@Qualifier("UsersMapper")
	private UsersMapper usersMapper;
	@Autowired
	@Qualifier("IntegraldetailMapper")
	private IntegraldetailMapper integraldetailMapper;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Orders> findOrdersByStatu(Integer statuId){
		return oMapper.findOrdersByStatu(statuId);
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Orders> findAllOrder( ){
		return oMapper.findAllOrder();
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public Orders findById(String orderId){
		return oMapper.findOrdersById(orderId);
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Orders> findByParentType(Integer typeId){
		return oMapper.findByParentType("|"+typeId+"%");
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Orders> findByUserId(Integer userId){
		return oMapper.findOrdersByUserId(userId);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public int saveOrders(Orders order){
		List<OrderDetail> dList=order.getOrderDetailList();
		int res=oMapper.saveOrders(order);
		for (OrderDetail orderDetail : dList) {
			detailService.saveOrderDetail(orderDetail);
		}
		Logistics log=new Logistics();
		log.setLogisticsOrder(order);
		Status logisticsStatu=statuMapper.findById(5);
		log.setLogisticsStatu(logisticsStatu);
		logMapper.saveLogistics(log);
		//给用户积分评定 Lv
		Users user = order.getOrderUser();
		user.setUserIntegral(user.getUserIntegral()+(int)(Math.round(order.getOrderAllPrice())));
		this.usersMapper.updateUserIntegral(user);
		Integraldetail integraldetail = new Integraldetail();
		integraldetail.setIntegraldetailDate(new Date());
		integraldetail.setIntegraldetailIntegralnum((int)(Math.round(order.getOrderAllPrice())));
		integraldetail.setIntegraldetailOrder(order);
		integraldetail.setIntegraldetailUser(user);
		this.integraldetailMapper.saveIntegraldetail(integraldetail );
		//给用户积分评定
		return res;
	}
}
