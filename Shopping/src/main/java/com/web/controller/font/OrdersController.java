package com.web.controller.font;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.entity.Cart;
import com.web.entity.Coupon;
import com.web.entity.Couponstatu;
import com.web.entity.Footmark;
import com.web.entity.Goods;
import com.web.entity.Goodstype;
import com.web.entity.Integraldetail;
import com.web.entity.Logistics;
import com.web.entity.OrderDetail;
import com.web.entity.Orders;
import com.web.entity.Status;
import com.web.entity.Toaddress;
import com.web.entity.Users;
import com.web.mapper.IntegraldetailMapper;
import com.web.service.CartService;
import com.web.service.CouponService;
import com.web.service.FootmarkService;
import com.web.service.GoodsService;
import com.web.service.GoodstypeService;
import com.web.service.IntegraldetailService;
import com.web.service.LogisticsServic;
import com.web.service.OrderDetailService;
import com.web.service.OrderService;
import com.web.service.StatuService;
import com.web.service.ToAddressService;
import com.web.service.UsersService;

@Controller
@RequestMapping("ordersFont")
public class OrdersController {
	@Autowired
	@Qualifier("ToAddressService")
	private ToAddressService addressService;
	@Autowired
	@Qualifier("OrderService")
	private OrderService orderService;
	@Autowired
	@Qualifier("CartService")
	private CartService cartService;
	//用户评价
	@Autowired
	@Qualifier("UsersService")
	private UsersService usersService;
	@Autowired
	@Qualifier("IntegraldetailService")
	private IntegraldetailService integraldetailService;
	
	@Autowired
	@Qualifier("GoodsService")
	private GoodsService goodsService;
	@Autowired
	@Qualifier("LogisticsServic")
	private LogisticsServic logService;
	@Autowired
	@Qualifier("OrderDetailService")
	private OrderDetailService detailService;
	@Autowired
	@Qualifier("StatuService")
	private StatuService statuService;
	@Autowired
	@Qualifier("CouponService")
	private CouponService couponService;
	
	//yu
	@Autowired
	@Qualifier("FootmarkService")
	private FootmarkService footmarkService;
	
	@Autowired
	@Qualifier("GoodstypeService")
	private GoodstypeService goodstypeService;
	//
	@RequestMapping("choseConpon")
	@ResponseBody
	public String choseConpon(Integer conponId){
		System.out.println("choseConpon=============="+conponId);
		Coupon coupon=couponService.findById(conponId);
		int num=coupon.getCouponReduce();
		return num+"";
	}
	@RequestMapping("makeSureOrder")
	public String makeSureOrder(String orderId){
		System.out.println("makeSureOrder======="+orderId);
		Logistics log=logService.findByOrderId(orderId);
		Status logisticsStatu=new Status();
		logisticsStatu.setStatuId(14);
		logisticsStatu.setStatuName("待评价");
		log.setLogisticsStatu(logisticsStatu);
		logService.updaLogistics(log);
		return "redirect:/ordersFont/jumpToMyOrder";
	}
	/*@RequestMapping("payNow111")
	public String payNow111(){
		System.out.println("payNow111==============");
		
		
	}*/
	
	@RequestMapping("editOrder")
	public String editOrder(String orderId,String reason){
		System.out.println("editOrder=============="+reason+"======"+orderId);
		Logistics log=logService.findByOrderId(orderId);
		Status logisticsStatu=new Status();
		logisticsStatu.setStatuId(16);
		logisticsStatu.setStatuName("客服审核中");
		log.setLogisticsStatu(logisticsStatu);
		if("1".equals(reason)){
			log.setLogisticsMsg("不喜欢");
		}else if("2".equals(reason)){
			log.setLogisticsMsg("拍错了");
		}else if("3".equals(reason)){
			log.setLogisticsMsg("其他原因");
		}
		logService.updaLogistics(log);
		return "redirect:/ordersFont/jumpToMyOrder";
	}
	@RequestMapping("payNow")
	public String payNow(Integer goodsId,HttpSession session,Model model,Integer goodsNum){
		System.out.println("payNow=================");
		Users user=(Users) session.getAttribute("loginUsers");
		if(user!=null&&!"".equals(user.getUserId())){
			Toaddress morenAddress=new Toaddress();
			List<Toaddress> addressList=addressService.findAddresByUserId(user.getUserId());
			for (Toaddress toaddress : addressList) {
				if(toaddress.getAddressState()==1){
					morenAddress.setAddressDesc(toaddress.getAddressDesc());
					morenAddress.setAddressName(toaddress.getAddressName());
					morenAddress.setAddressPhone(toaddress.getAddressPhone());
				}
			}
			
			
			List<Cart> cartToOrderList1=new ArrayList<Cart>();
			Cart cart=new Cart();
			Goods g=goodsService.findById(goodsId);
			cart.setCartGoods(g);
			cart.setCartNum(goodsNum);
			cart.setCartPrice(g.getGoodsPrice()*goodsNum);
			cart.setCartUser(user);
			double priceAll=cart.getCartPrice();
			cartToOrderList1.add(cart);
			List<Coupon> couponList=couponService.findUseCoupon(user);
			List<Coupon> canUseConpon=new ArrayList<Coupon>();
			List<Coupon> noUseConpon=new ArrayList<Coupon>();
			
			for (Coupon coupon : couponList) {
				if(coupon.getCouponAvail()<=priceAll){
					canUseConpon.add(coupon);
				}else{
					noUseConpon.add(coupon);
				}
			}
			List<Cart> cartToOrderList=(List<Cart>) session.getAttribute("cartToOrderList");
			for (int i = 0; i < cartToOrderList.size(); i++) {
				cartToOrderList.remove(i);
			}
			cartToOrderList.add(cart);
			////////////////////////////////////////////////
			model.addAttribute("cartToOrderList1", cartToOrderList1);
			model.addAttribute("priceAll", priceAll);
			model.addAttribute("morenAddress", morenAddress);
			model.addAttribute("canUseConpon", canUseConpon);
			model.addAttribute("noUseConpon", noUseConpon);			
			model.addAttribute("addressList", addressList);
			return "shop/order";
		}
		return "shop/login";
	}
	
	
	@RequestMapping("closeOrder")
	public String closeOrder(String orderId){
		Logistics log=logService.findByOrderId(orderId);
		Status logisticsStatu=new Status();
		logisticsStatu.setStatuId(15);
		logisticsStatu.setStatuName("已关闭");
		log.setLogisticsStatu(logisticsStatu);
		logService.updaLogistics(log);
		return "redirect:/ordersFont/jumpToMyOrder";
	}
	@RequestMapping("jumpToMyOrder")
	public String jumpToMyOrder(HttpSession session,Model model){
		System.out.println("jumpToMyOrder=================");
		Users user=(Users) session.getAttribute("loginUsers");
		List<Logistics> logList=new ArrayList<Logistics>();
		List<Orders> ordersList=orderService.findByUserId(user.getUserId());
		int readyToPay=0;
		int readyToSend=0;
		int readyToReceive=0;
		int readyToJudge=0;
		for (Orders orders : ordersList) {
			/*Logistics log=logService.findByOrderId(orders.getOrderId());*/
			if(orders.getOrderCoupon()!=null&&!"".equals(orders.getOrderCoupon().getCouponId())){
				Coupon coupon=couponService.findById(orders.getOrderCoupon().getCouponId());
				orders.setOrderCoupon(coupon);
			}
			List<OrderDetail> detailList=detailService.findByOrder(orders.getOrderId());
			for (OrderDetail orderDetail : detailList) {
				Goods g1=goodsService.findById(orderDetail.getDetailGoods().getGoodsId());
				orderDetail.setDetailGoods(g1);
				orderDetail.setDetailOrder(orders);
			}
			orders.setOrderDetailList(detailList);
			
			System.out.println(orders.getOrderId());
			Logistics llog=logService.findByOrderId(orders.getOrderId());
			if(llog!=null){
				llog.setLogisticsOrder(orders);
				
				Status statu=statuService.findById(llog.getLogisticsStatu().getStatuId());
				llog.setLogisticsStatu(statu);
				logList.add(llog);
				int h=llog.getLogisticsStatu().getStatuId();
				if(h==5){
					readyToPay++;
				}else if(h==7){
					readyToSend++;
				}else if(h==8){
					readyToReceive++;
				}else if(h==14){
					readyToJudge++;
				}
			}
			
			
			
		}
		model.addAttribute("readyToPay", readyToPay);
		model.addAttribute("readyToSend", readyToSend);
		model.addAttribute("readyToReceive",readyToReceive );
		model.addAttribute("readyToJudge", readyToJudge);
		model.addAttribute("logList", logList);
		
		//导航栏类型start
		List<Goodstype> typeListMuying=goodstypeService.findAllMuying();
		List<Goodstype> typeListMeizhuang=goodstypeService.findAllMeizhuang();
		List<Goodstype> typeListJiaju=goodstypeService.findAllJiaju();
		List<Goodstype> typeListYinyang=goodstypeService.findAllYinyang();
		List<List<Goodstype>> typeList = new ArrayList<List<Goodstype>>();
		typeList.add(typeListMuying);
		typeList.add(typeListMeizhuang);
		typeList.add(typeListJiaju);
		typeList.add(typeListYinyang);
		model.addAttribute("typeList", typeList);
		//导航栏类型end
		//购物车及积分页的热销商品
		List<Footmark> cart_ReList=footmarkService.findAllCart_Re();
	    model.addAttribute("cart_ReList", cart_ReList);
	    //购物车及积分页的热销商品结束
		
		return "shop/my_order";
	}
	/**
	 * 展示订单前先准备好地址List，放到model里
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("readyToShowOrder")
	public String readyToShowOrder(HttpSession session,Model model){
		System.out.println("readyToShowOrder=======================");
		Users user=(Users) session.getAttribute("loginUsers");
		if(user!=null){
			Toaddress morenAddress=new Toaddress();
			List<Toaddress> addressList=addressService.findAddresByUserId(user.getUserId());
			for (Toaddress toaddress : addressList) {
				if(toaddress.getAddressState()==1){
					morenAddress.setAddressDesc(toaddress.getAddressDesc());
					morenAddress.setAddressName(toaddress.getAddressName());
					morenAddress.setAddressPhone(toaddress.getAddressPhone());
				}
			}
			List<Cart> cartToOrderList=(List<Cart>) session.getAttribute("cartToOrderList");
			double priceAll=0;
			for (Cart cart : cartToOrderList) {
				Goods g=goodsService.findById(cart.getCartGoods().getGoodsId());
				cart.setCartGoods(g);
				priceAll+=cart.getCartNum()*cart.getCartGoods().getGoodsPrice();
			}
			List<Coupon> couponList=couponService.findUseCoupon(user);
			List<Coupon> canUseConpon=new ArrayList<Coupon>();
			List<Coupon> noUseConpon=new ArrayList<Coupon>();
			for (Coupon coupon : couponList) {
				if(coupon.getCouponAvail()<=priceAll){
					canUseConpon.add(coupon);
				}else{
					noUseConpon.add(coupon);
				}
			}
			model.addAttribute("priceAll", priceAll);
			model.addAttribute("morenAddress", morenAddress);
			model.addAttribute("canUseConpon", canUseConpon);
			model.addAttribute("noUseConpon", noUseConpon);			
			model.addAttribute("addressList", addressList);
			return "shop/order";
		}else{
			return "shop/login";
		}
		
		
		
	}
	
	@RequestMapping("addGoodsToOrder")
	public String addGoodsToOrder(HttpSession session,Model model,Integer conponId){
		System.out.println("addGoodsToOrder=========================");
		List<Cart> cartToOrderList=(List<Cart>) session.getAttribute("cartToOrderList");
		if(cartToOrderList.size()>=1&&cartToOrderList!=null){
			Users user=(Users) session.getAttribute("loginUsers");
			Toaddress address=addressService.findMoRenByUserId(user.getUserId());
			Orders order=new Orders();
			order.setOrderAddress(address.getAddressDesc());
			order.setOrderPhone(address.getAddressPhone());
			order.setOrderName(address.getAddressName());
			order.setOrderDate(new Date());
			order.setOrderUser(user);
			order.setOrderId(UUID.randomUUID().toString().replace("-", ""));
			double sumPrice=0;
			List<OrderDetail> orderDetailList=new ArrayList<OrderDetail>();
			for (int i = 0; i < cartToOrderList.size(); i++) {
				Goods g=goodsService.findById(cartToOrderList.get(i).getCartGoods().getGoodsId());
				cartToOrderList.get(i).setCartGoods(g);
				sumPrice+=(cartToOrderList.get(i).getCartNum())*(cartToOrderList.get(i).getCartGoods().getGoodsPrice());
				
				OrderDetail d=new OrderDetail();
				d.setDetailGoods(cartToOrderList.get(i).getCartGoods());
				d.setDetailNum(cartToOrderList.get(i).getCartNum());
				d.setDetailPrice(cartToOrderList.get(i).getCartGoods().getGoodsPrice()*cartToOrderList.get(i).getCartNum());
				d.setDetailOrder(order);
				orderDetailList.add(d);
			}
			int res=-1;
			if(conponId!=null){
				Coupon coupon=couponService.findById(conponId);
				order.setOrderCoupon(coupon);
				order.setOrderAllPrice(sumPrice);
				order.setOrderDetailList(orderDetailList);
				res=orderService.saveOrders(order);
				Couponstatu couponState=new Couponstatu();
				couponState.setCouponstateId(2);
				couponState.setCouponstateName("已使用");
				coupon.setCouponState(couponState);
				couponService.updateCouponState(coupon);
			}else{
				order.setOrderAllPrice(sumPrice);
				order.setOrderDetailList(orderDetailList);
				res=orderService.saveOrders(order);
			}
			int cartNum=(Integer) session.getAttribute("cartNum");
			/*//给用户积分评定 Lv
			user.setUserIntegral(user.getUserIntegral()+(int)(Math.round(order.getOrderAllPrice())));
			this.usersService.updateUserIntegral(user);
			Integraldetail integraldetail = new Integraldetail();
			integraldetail.setIntegraldetailDate(new Date());
			integraldetail.setIntegraldetailIntegralnum((int)(Math.round(order.getOrderAllPrice())));
			integraldetail.setIntegraldetailOrder(order);
			integraldetail.setIntegraldetailUser(user);
			this.integraldetailService.saveIntegraldetail(integraldetail );
			//给用户积分评定
*/			
			
			//System.out.println(res);
			if(res==1){
				//保存成功，现在将已经生成订单的商品从购物车清掉
				List<Cart> cartList=(List<Cart>) session.getAttribute("cartList");
				
				for (int i = 0; i < cartToOrderList.size(); i++) {
					for (int j = 0; j < cartList.size(); j++) {
						if((cartToOrderList.get(i).getCartGoods().getGoodsId()).equals(cartList.get(j).getCartGoods().getGoodsId())){
							cartList.remove(j);
							cartService.deleteCartByCartId(cartToOrderList.get(i).getCartId());
						}
					}
				}
				cartNum=0;
				for (int i = 0; i < cartList.size(); i++) {
					cartNum=cartNum+cartList.get(i).getCartNum();
				}
				session.setAttribute("cartNum", cartNum);
				int n=cartToOrderList.size();
				for (int i = 0; i < cartToOrderList.size(); i++) {
					cartToOrderList.remove(i);
				}
				
				
			}
			
			//导航栏类型start
			List<Goodstype> typeListMuying=goodstypeService.findAllMuying();
			List<Goodstype> typeListMeizhuang=goodstypeService.findAllMeizhuang();
			List<Goodstype> typeListJiaju=goodstypeService.findAllJiaju();
			List<Goodstype> typeListYinyang=goodstypeService.findAllYinyang();
			List<List<Goodstype>> typeList = new ArrayList<List<Goodstype>>();
			typeList.add(typeListMuying);
			typeList.add(typeListMeizhuang);
			typeList.add(typeListJiaju);
			typeList.add(typeListYinyang);
			model.addAttribute("typeList", typeList);
			//导航栏类型end
			//返回订单信息（支付页面）
			Goods goods=order.getOrderDetailList().get(0).getDetailGoods();
			model.addAttribute("order", order);
			model.addAttribute("goods", goods);
			return "shop/order_1"; 
		}
		return "shop/index";
	}

}
