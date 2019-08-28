package com.web.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.web.entity.Orders;
@Repository("OrdersMapper")
public interface OrdersMapper {
	public int saveOrders(Orders order);
	public int updateOrders(Orders orders);
	public int deleteOrdersById(Integer ordersId);
	public List<Orders> findOrdersByUserId(Integer userId);
	public Orders findOrdersById(String orderId);
	public List<Orders> findOrdersByStatu(Integer statuId);
	public List<Orders> findAllOrder();
	/**
	 * 使用时注意将参数拼接为“|typeId%”
	 * @param typeId
	 * @return
	 */
	public List<Orders> findByParentType(String typeId);
}
