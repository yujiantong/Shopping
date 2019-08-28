package com.web.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.Goods;
import com.web.entity.Integraldetail;
import com.web.entity.OrderDetail;
import com.web.entity.Orders;
import com.web.entity.Users;
import com.web.mapper.IntegraldetailMapper;
import com.web.mapper.OrdersMapper;

@Service("IntegraldetailService")
public class IntegraldetailService {

	@Autowired
	@Qualifier("IntegraldetailMapper")
	private IntegraldetailMapper integraldetailMapper;
	@Autowired
	@Qualifier("OrdersMapper")
	private OrdersMapper ordersMapper;
	@Autowired
	@Qualifier("OrderDetailService")
	private OrderDetailService orderDetailService;
	@Autowired
	@Qualifier("GoodsService")
	private GoodsService goodsService;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public Integraldetail findByDate(Users user) {
		return this.integraldetailMapper.findByDate(new Date(), user.getUserId());
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int saveIntegraldetail(Integraldetail integraldetail) {
		int res = 0;
		try {
			res = this.integraldetailMapper.saveIntegraldetail(integraldetail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public List<Integraldetail> findFiveIntegraldetail(Integer userId) {
		List<Integraldetail> integraldetailList = this.integraldetailMapper.findFiveIntegraldetail(userId);
		for (Integraldetail integraldetail : integraldetailList) {
			if(integraldetail.getIntegraldetailOrder() != null) {
				Orders integraldetailOrder = this.ordersMapper.findOrdersById(integraldetail.getIntegraldetailOrder().getOrderId());
				List<OrderDetail> orderDetailList = this.orderDetailService.findByOrder(integraldetailOrder.getOrderId());
				for (OrderDetail orderDetail : orderDetailList) {
					Goods detailGoods = this.goodsService.findById(orderDetail.getDetailGoods().getGoodsId());
					orderDetail.setDetailGoods(detailGoods );
				}
				integraldetailOrder.setOrderDetailList(orderDetailList );
				integraldetail.setIntegraldetailOrder(integraldetailOrder );
			}
		}
		return integraldetailList;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public List<Integraldetail> findIncome(Integer userId) {
		List<Integraldetail> integraldetailList = this.integraldetailMapper.findIncome(userId);
		for (Integraldetail integraldetail : integraldetailList) {
			if(integraldetail.getIntegraldetailOrder() != null) {
				Orders integraldetailOrder = this.ordersMapper.findOrdersById(integraldetail.getIntegraldetailOrder().getOrderId());
				List<OrderDetail> orderDetailList = this.orderDetailService.findByOrder(integraldetailOrder.getOrderId());
				for (OrderDetail orderDetail : orderDetailList) {
					Goods detailGoods = this.goodsService.findById(orderDetail.getDetailGoods().getGoodsId());
					orderDetail.setDetailGoods(detailGoods );
				}
				integraldetailOrder.setOrderDetailList(orderDetailList );
				integraldetail.setIntegraldetailOrder(integraldetailOrder );
			}
		}
		return integraldetailList;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public List<Integraldetail> findExpend(Integer userId) {
		List<Integraldetail> integraldetailList = this.integraldetailMapper.findExpend(userId);
		for (int i = 0; i < integraldetailList.size(); i++) {
			/*if(integraldetailList.get(i).getIntegraldetailIntegralnum() > 0)
				integraldetailList.remove(i);*/
			if(integraldetailList.get(i).getIntegraldetailOrder() != null) {
				Orders integraldetailOrder = this.ordersMapper.findOrdersById(integraldetailList.get(i).getIntegraldetailOrder().getOrderId());
				List<OrderDetail> orderDetailList = this.orderDetailService.findByOrder(integraldetailOrder.getOrderId());
				for (OrderDetail orderDetail : orderDetailList) {
					Goods detailGoods = this.goodsService.findById(orderDetail.getDetailGoods().getGoodsId());
					orderDetail.setDetailGoods(detailGoods );
				}
				integraldetailOrder.setOrderDetailList(orderDetailList );
				integraldetailList.get(i).setIntegraldetailOrder(integraldetailOrder );
			}
		}
		return integraldetailList;
	}
}











