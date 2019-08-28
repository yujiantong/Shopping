package com.web.entity;

import java.io.Serializable;
import java.util.List;


public class Goodstype implements Serializable {
    private Integer typeId;

    private String typeName;

    private Goodstype typePid;

    private Integer typeLevel;

    private String typePath;
    
	private List<Goods> goodsList;

    private static final long serialVersionUID = 1L;

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName == null ? null : typeName.trim();
    }

    
    public Goodstype getTypePid() {
		return typePid;
	}

	public void setTypePid(Goodstype typePid) {
		this.typePid = typePid;
	}

	public Integer getTypeLevel() {
        return typeLevel;
    }

    public void setTypeLevel(Integer typeLevel) {
        this.typeLevel = typeLevel;
    }

    public String getTypePath() {
        return typePath;
    }

    public void setTypePath(String typePath) {
        this.typePath = typePath == null ? null : typePath.trim();
    }

	public List<Goods> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}
    
}