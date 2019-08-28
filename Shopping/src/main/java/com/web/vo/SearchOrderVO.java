package com.web.vo;

public class SearchOrderVO {
	private String year;
	private String month;
	private String dayOfYear;
	private Integer statuId;
	private Integer orderId;
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDayOfYear() {
		return dayOfYear;
	}
	public void setDayOfYear(String dayOfYear) {
		this.dayOfYear = dayOfYear;
	}
	public Integer getStatuId() {
		return statuId;
	}
	public void setStatuId(Integer statuId) {
		this.statuId = statuId;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public SearchOrderVO(String year ,Integer statuId) {
		super();
		this.year = year;
		this.statuId = statuId;
	}
	
	
}
