package com.web.entity;

import java.io.Serializable;
import java.util.List;

public class Users implements Serializable {
    private Integer userId;

    private String userName;

    private String userPassword;

    private String userPhone;

    private String userEmail;
    
    private Integer userAddress;
    
    private Integer userIntegral;
    
    private List<Footmark> footMarkList;
    
    private List<Discuss> discussList;
    
    private List<Toaddress> userAddressList;
    
    private List<Cart> cartList;

    private static final long serialVersionUID = 1L;

    public Integer getUserIntegral() {
		return userIntegral;
	}

	public void setUserIntegral(Integer userIntegral) {
		this.userIntegral = userIntegral;
	}

	public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public List<Discuss> getDiscussList() {
		return discussList;
	}

	public void setDiscussList(List<Discuss> discussList) {
		this.discussList = discussList;
	}

	public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

	public Integer getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(Integer userAddress) {
		this.userAddress = userAddress;
	}

	public List<Toaddress> getUserAddressList() {
		return userAddressList;
	}

	public void setUserAddressList(List<Toaddress> userAddressList) {
		this.userAddressList = userAddressList;
	}

	public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone == null ? null : userPhone.trim();
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }

	public List<Footmark> getFootMarkList() {
		return footMarkList;
	}

	public void setFootMarkList(List<Footmark> footMarkList) {
		this.footMarkList = footMarkList;
	}

	public List<Cart> getCartList() {
		return cartList;
	}

	public void setCartList(List<Cart> cartList) {
		this.cartList = cartList;
	}
	
    
}