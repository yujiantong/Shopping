package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.OrderDetail;
import com.web.mapper.OrderDetailMapper;

@Service("OrderDetailService")
public class OrderDetailService {
	@Autowired
	@Qualifier("OrderDetailMapper")
	private OrderDetailMapper dMapper;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<OrderDetail> findByOrder(String orderId){
		return dMapper.findDetailByOrderId(orderId);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public int saveOrderDetail(OrderDetail orderDetail){
		return dMapper.saveDetail(orderDetail);
	}
}
