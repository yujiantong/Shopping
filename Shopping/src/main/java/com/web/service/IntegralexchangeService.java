package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.Integralexchange;
import com.web.mapper.IntegralexchangeMapper;

@Service("IntegralexchangeService")
public class IntegralexchangeService {

	@Autowired
	@Qualifier("IntegralexchangeMapper")
	private IntegralexchangeMapper integralexchangeMapper;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public Integralexchange findByExchangeId(Integer exchangeId) {
		return this.integralexchangeMapper.findByExchangeId(exchangeId);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public List<Integralexchange> findAllExchange() {
		return this.integralexchangeMapper.findAllExchange();
	}
}
