package com.web.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.entity.Cart;
@Repository("CartMapper")
public interface CartMapper {
    public int saveCart(Cart cart);
    public int deleteCartByCartId(Integer cartId);
    public int deleteCartByUserId(Integer userId);
    public int updateCart(Cart cart);
    
    public Cart findCartByCartId(Integer cartId);
    public List<Cart> findCartByUserId(Integer userId);
}