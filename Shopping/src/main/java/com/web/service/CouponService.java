package com.web.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.Coupon;
import com.web.entity.Integralexchange;
import com.web.entity.Users;
import com.web.mapper.CouponMapper;
import com.web.mapper.UsersMapper;

@Service("CouponService")
public class CouponService {

	@Autowired
	@Qualifier("CouponMapper")
	private CouponMapper couponMapper;
	@Autowired
	@Qualifier("UsersMapper")
	private UsersMapper usersMapper;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public List<Coupon> findUseCoupon(Users user) {
		return this.couponMapper.findUseCoupon(new Date(), user.getUserId());
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public List<Coupon> findUseedCoupon(Users user) {
		return this.couponMapper.findUseedCoupon(user.getUserId());
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public List<Coupon> findNotUseCoupon(Users user) {
		return this.couponMapper.findNotUseCoupon(new Date(), user.getUserId());
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public Coupon findById(Integer couponId){
		return this.couponMapper.findById(couponId);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int updateCouponState(Coupon coupon){
		return this.couponMapper.updateCouponState(coupon);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public boolean saveCoupon(Coupon coupon, Integralexchange integralexchange) {
		try {
			this.couponMapper.saveCoupon(coupon);
			Users users = coupon.getCouponUser();
			users.setUserIntegral(users.getUserIntegral()-integralexchange.getIntegralexchangeIntegralnum());
			this.usersMapper.updateUserIntegral(users);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
