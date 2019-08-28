package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.Cart;
import com.web.mapper.CartMapper;



@Service("CartService")
public class CartService {
	@Autowired
	@Qualifier("CartMapper")
	private CartMapper cartMapper;
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public int saveCart(Cart cart){
		int res=0;
		try {
			res=cartMapper.saveCart(cart);
			return res;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Cart> findCartGoodsByUserId(Integer userId){
		return cartMapper.findCartByUserId(userId);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public int deleteCartByCartId(Integer cartId){
		return cartMapper.deleteCartByCartId(cartId);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public int updateCartGoods(Cart cart){
		return cartMapper.updateCart(cart);
	}
}
