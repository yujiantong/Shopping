package com.web.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Repository;

import com.web.entity.OrderDetail;
@Repository("OrderDetailMapper")
public interface OrderDetailMapper {
	public int saveDetail(OrderDetail detail);
	public int updateDetail(OrderDetail detail);
	public int deleteDetailByDetailId(Integer detailId);
	public OrderDetail findDetailById(Integer detailId);
	public List<OrderDetail> findDetailByOrderId(String orderId);
}
