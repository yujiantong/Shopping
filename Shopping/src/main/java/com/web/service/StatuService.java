package com.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.Status;
import com.web.mapper.StatusMapper;

@Service("StatuService")
public class StatuService {
	@Autowired
	@Qualifier("StatusMapper")
	private StatusMapper sMapper;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public Status findById(Integer statuId){
		return sMapper.findById(statuId);
	}
}
