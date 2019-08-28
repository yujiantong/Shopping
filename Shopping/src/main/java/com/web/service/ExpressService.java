package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.Express;
import com.web.mapper.ExpressMapper;

@Service("ExpressService")
public class ExpressService {
	@Autowired
	@Qualifier("ExpressMapper")
	private ExpressMapper eMapper;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Express> findAll(){
		return eMapper.findAllExpress();
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public Express findById(Integer expressId) {
		return eMapper.findById(expressId);
	}
}
