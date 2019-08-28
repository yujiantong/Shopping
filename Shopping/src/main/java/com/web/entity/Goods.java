package com.web.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class Goods implements Serializable {

	private Integer goodsId;
	private String goodsName;
	private Double goodsPrice;
	private Integer goodsNum;
	private String goodsImg;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date goodsDate;
	private Goodstype goodsType;
	private String goodsFromaddress;
	private String goodsRemark;
	private Integer goodsStandard;
	private Status goodsState;
	private Integer goodsWarnnum;
	private String goodsDetail;
	private List<Imgs> imgsList;
	private static final long serialVersionUID = 1L;

	public Integer getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName == null ? null : goodsName.trim();
	}

	public Double getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(Double goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public Integer getGoodsNum() {
		return goodsNum;
	}

	public void setGoodsNum(Integer goodsNum) {
		this.goodsNum = goodsNum;
	}

	public String getGoodsImg() {
		return goodsImg;
	}

	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg == null ? null : goodsImg.trim();
	}

	public Date getGoodsDate() {
		return goodsDate;
	}

	public void setGoodsDate(Date goodsDate) {
		this.goodsDate = goodsDate;
	}

	
	public Goodstype getGoodsType() {
		return goodsType;
	}

	public void setGoodsType(Goodstype goodsType) {
		this.goodsType = goodsType;
	}

	public String getGoodsFromaddress() {
		return goodsFromaddress;
	}

	public void setGoodsFromaddress(String goodsFromaddress) {
		this.goodsFromaddress = goodsFromaddress == null ? null
				: goodsFromaddress.trim();
	}

	public String getGoodsRemark() {
		return goodsRemark;
	}

	public void setGoodsRemark(String goodsRemark) {
		this.goodsRemark = goodsRemark == null ? null : goodsRemark.trim();
	}

	public Integer getGoodsStandard() {
		return goodsStandard;
	}

	public void setGoodsStandard(Integer goodsStandard) {
		this.goodsStandard = goodsStandard;
	}
	public Status getGoodsState() {
		return goodsState;
	}

	public void setGoodsState(Status goodsState) {
		this.goodsState = goodsState;
	}

	public Integer getGoodsWarnnum() {
		return goodsWarnnum;
	}

	public void setGoodsWarnnum(Integer goodsWarnnum) {
		this.goodsWarnnum = goodsWarnnum;
	}
	

	public String getGoodsDetail() {
		return goodsDetail;
	}

	public void setGoodsDetail(String goodsDetail) {
		this.goodsDetail = goodsDetail;
	}

	public List<Imgs> getImgsList() {
		return imgsList;
	}

	public void setImgsList(List<Imgs> imgsList) {
		this.imgsList = imgsList;
	}

}
