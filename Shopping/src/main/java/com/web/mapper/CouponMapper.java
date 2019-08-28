package com.web.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.web.entity.Coupon;

@Repository("CouponMapper")
public interface CouponMapper {
	
	public int saveCoupon(Coupon coupon);
	public List<Coupon> findUseCoupon(@Param("date")Date date, @Param("userId")Integer userId);
	public List<Coupon> findUseedCoupon(@Param("userId")Integer userId);
	public List<Coupon> findNotUseCoupon(@Param("date")Date date, @Param("userId")Integer userId);
	public Coupon findById(Integer coupnId);
	public int updateCouponState(Coupon coupon);
}