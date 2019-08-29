package com.web.listener;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.web.entity.Cart;

/**
 * Application Lifecycle Listener implementation class CartSessionListener
 *
 */
@WebListener
public class CartSessionListener implements HttpSessionListener {

    /**
     * Default constructor. 
     */
    public CartSessionListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent arg0)  { 
        HttpSession session=arg0.getSession();
        List<Cart> cartList=new ArrayList<Cart>();
        List<Cart> cartToOrderList=new ArrayList<Cart>();
        Boolean cartState=true;
        Integer cartNum=0;
        session.setAttribute("cartNum", cartNum);
        session.setAttribute("cartList", cartList);
        session.setAttribute("cartToOrderList", cartToOrderList);
        session.setAttribute("cartState", cartState);
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent arg0)  { 
         // TODO Auto-generated method stub
    }
	
}
