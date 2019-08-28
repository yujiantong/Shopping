package com.web.entity;

import java.io.Serializable;

public class Toaddress implements Serializable {
    private Integer addressId;

    private String addressDesc;

    private Users addressUser;
    private String addressName;
    private String addressPhone;
    private Integer addressState;

    private static final long serialVersionUID = 1L;
    
    public Integer getAddressState() {
		return addressState;
	}

	public void setAddressState(Integer addressState) {
		this.addressState = addressState;
	}

	public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public String getAddressDesc() {
        return addressDesc;
    }

    public void setAddressDesc(String addressDesc) {
        this.addressDesc = addressDesc == null ? null : addressDesc.trim();
    }

	public Users getAddressUser() {
		return addressUser;
	}

	public void setAddressUser(Users addressUser) {
		this.addressUser = addressUser;
	}

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

	public String getAddressPhone() {
		return addressPhone;
	}

	public void setAddressPhone(String addressPhone) {
		this.addressPhone = addressPhone;
	}

	public Toaddress(Integer addressId, String addressDesc, Users addressUser,
			String addressName, String addressPhone) {
		super();
		this.addressId = addressId;
		this.addressDesc = addressDesc;
		this.addressUser = addressUser;
		this.addressName = addressName;
		this.addressPhone = addressPhone;
	}

	public Toaddress() {
		super();
		// TODO Auto-generated constructor stub
	}

   
}