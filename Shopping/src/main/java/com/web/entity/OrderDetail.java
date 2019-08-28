package com.web.entity;

public class OrderDetail {
	private Integer detailId;
	private Orders detailOrder;
	private Goods detailGoods;
	private Double detailPrice;
	private Integer detailNum;
	public Integer getDetailId() {
		return detailId;
	}
	public void setDetailId(Integer detailId) {
		this.detailId = detailId;
	}
	public Orders getDetailOrder() {
		return detailOrder;
	}
	public void setDetailOrder(Orders detailOrder) {
		this.detailOrder = detailOrder;
	}
	public Goods getDetailGoods() {
		return detailGoods;
	}
	public void setDetailGoods(Goods detailGoods) {
		this.detailGoods = detailGoods;
	}
	public Double getDetailPrice() {
		return detailPrice;
	}
	public void setDetailPrice(Double detailPrice) {
		this.detailPrice = detailPrice;
	}
	public Integer getDetailNum() {
		return detailNum;
	}
	public void setDetailNum(Integer detailNum) {
		this.detailNum = detailNum;
	}
	public OrderDetail(Integer detailId, Orders detailOrder, Goods detailGoods,
			Double detailPrice, Integer detailNum) {
		super();
		this.detailId = detailId;
		this.detailOrder = detailOrder;
		this.detailGoods = detailGoods;
		this.detailPrice = detailPrice;
		this.detailNum = detailNum;
	}
	public OrderDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
