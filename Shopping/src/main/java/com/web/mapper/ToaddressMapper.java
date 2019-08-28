package com.web.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.entity.Toaddress;
@Repository("ToaddressMapper")
public interface ToaddressMapper {
    public List<Toaddress> findAllToAddress();
    public Integer saveToAddress(Toaddress toAddress);
    public Integer updateToAddress(Toaddress toAddress);
    public Integer delToAddress(Integer toAddressId);
    public List<Toaddress> findByUserId(Integer userId);
    public Toaddress findByAddressId(Integer addressId);
    public Toaddress findMoRenByUserId(Integer userId);
}