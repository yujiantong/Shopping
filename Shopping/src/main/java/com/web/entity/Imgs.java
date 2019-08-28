package com.web.entity;

import java.io.Serializable;

public class Imgs implements Serializable {
    private Integer imgId;

    private String imgPath;

    private Goods imgGoods;

    private static final long serialVersionUID = 1L;

    public Integer getImgId() {
        return imgId;
    }

    public void setImgId(Integer imgId) {
        this.imgId = imgId;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath == null ? null : imgPath.trim();
    }

	public Goods getImgGoods() {
		return imgGoods;
	}

	public void setImgGoods(Goods imgGoods) {
		this.imgGoods = imgGoods;
	}
    

}