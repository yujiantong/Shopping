package com.web.entity;

import java.util.Date;
import java.util.List;

public class Orders {
	private String orderId;
	private Users orderUser;
	private String orderAddress;
	private String orderPhone;
	private String orderName;
	private Date orderDate;
	private Double orderAllPrice;
	private Coupon orderCoupon;
	
	private List<OrderDetail> orderDetailList;
	
	public Coupon getOrderCoupon() {
		return orderCoupon;
	}
	public void setOrderCoupon(Coupon orderCoupon) {
		this.orderCoupon = orderCoupon;
	}
	public Double getOrderAllPrice() {
		return orderAllPrice;
	}
	public void setOrderAllPrice(Double orderAllPrice) {
		this.orderAllPrice = orderAllPrice;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Users getOrderUser() {
		return orderUser;
	}
	public void setOrderUser(Users orderUser) {
		this.orderUser = orderUser;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public String getOrderPhone() {
		return orderPhone;
	}
	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public List<OrderDetail> getOrderDetailList() {
		return orderDetailList;
	}
	public void setOrderDetailList(List<OrderDetail> orderDetailList) {
		this.orderDetailList = orderDetailList;
	}
	
	public Orders(String orderId, Users orderUser, String orderAddress,
			String orderPhone, String orderName, Date orderDate,
			List<OrderDetail> orderDetailList) {
		super();
		this.orderId = orderId;
		this.orderUser = orderUser;
		this.orderAddress = orderAddress;
		this.orderPhone = orderPhone;
		this.orderName = orderName;
		this.orderDate = orderDate;
		this.orderDetailList = orderDetailList;
	}
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
