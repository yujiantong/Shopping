package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.Toaddress;
import com.web.mapper.ToaddressMapper;

@Service("ToAddressService")
public class ToAddressService {
	@Autowired
	@Qualifier("ToaddressMapper")
	private ToaddressMapper adMapper;
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Toaddress> findAddresByUserId(Integer userId){
		return adMapper.findByUserId(userId);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public int updateAddress(Toaddress address){
		return adMapper.updateToAddress(address);
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public Toaddress findByAddressId(Integer addressId){
		return adMapper.findByAddressId(addressId);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public int deleteAddressByAddressId(Integer addressId){
		return adMapper.delToAddress(addressId);
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public Toaddress findMoRenByUserId(Integer userId){
		return adMapper.findMoRenByUserId(userId);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public int saveAddress(Toaddress address){
		return adMapper.saveToAddress(address);
	}
}
