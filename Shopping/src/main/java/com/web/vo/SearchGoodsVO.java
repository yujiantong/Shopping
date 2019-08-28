package com.web.vo;

import java.util.List;


public class SearchGoodsVO {
	
	private String goodsName;
	private String goodsDate;
	private Float minPrice;
	private Float maxPrice;
	private Integer goodsType;
	//这里的Id用于后台批量删除
	
	private List<Integer> goodsId;
	
	private List<Integer> adsIds;
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsDate() {
		return goodsDate;
	}
	public void setGoodsDate(String goodsDate) {
		this.goodsDate = goodsDate;
	}
	public Float getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(Float minPrice) {
		this.minPrice = minPrice;
	}
	public Float getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(Float maxPrice) {
		this.maxPrice = maxPrice;
	}
	public Integer getGoodsType() {
		return goodsType;
	}
	public void setGoodsType(Integer goodsType) {
		this.goodsType = goodsType;
	}
	public List<Integer> getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(List<Integer> goodsId) {
		this.goodsId = goodsId;
	}
	public List<Integer> getAdsIds() {
		return adsIds;
	}
	public void setAdsIds(List<Integer> adsIds) {
		this.adsIds = adsIds;
	}

	
}
