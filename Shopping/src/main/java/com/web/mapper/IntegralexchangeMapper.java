package com.web.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.entity.Integralexchange;

@Repository("IntegralexchangeMapper")
public interface IntegralexchangeMapper {
    
	public List<Integralexchange> findAllExchange();
	public Integralexchange findByExchangeId(Integer exchangeId);
}