package com.web.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.web.entity.Integraldetail;

@Repository("IntegraldetailMapper")
public interface IntegraldetailMapper {
	
	public int saveIntegraldetail(Integraldetail integraldetail);
	
	public List<Integraldetail> findFiveIntegraldetail(Integer userId);
	
	public List<Integraldetail> findIncome(Integer userId);
	public List<Integraldetail> findExpend(Integer userId);
	public Integraldetail findByDate(@Param("date")Date date, @Param("userId")Integer userId);
	 
}