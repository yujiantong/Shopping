package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.Logistics;
import com.web.mapper.LogisticsMapper;
import com.web.vo.SearchOrderVO;

@Service("LogisticsServic")
public class LogisticsServic {
	@Autowired
	@Qualifier("LogisticsMapper")
	private LogisticsMapper lMapper;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Logistics> findByVO(SearchOrderVO vo){
		return lMapper.findByVO(vo);
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Logistics> findAllLogistics(){
		return lMapper.findAllLogistics();
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Logistics> findByIdOrDate(String orderId,String orderDate){
		return lMapper.findByIdOrDate(orderId, orderDate);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public void updaLogistics(Logistics logistics){
		lMapper.updateLogistics(logistics);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public int saveLogistics(Logistics logistics){
		return lMapper.saveLogistics(logistics);
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public Logistics findByOrderId(String orderId){
		return lMapper.findByOrderId(orderId);
	}
}
