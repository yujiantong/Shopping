package com.web.controller.font;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.entity.Coupon;
import com.web.entity.Couponstatu;
import com.web.entity.Footmark;
import com.web.entity.Goodstype;
import com.web.entity.Integraldetail;
import com.web.entity.Integralexchange;
import com.web.entity.Users;
import com.web.service.CouponService;
import com.web.service.FootmarkService;
import com.web.service.GoodstypeService;
import com.web.service.IntegraldetailService;
import com.web.service.IntegralexchangeService;

@Controller
@RequestMapping("CouponController")
public class CouponController {

	@Autowired
	@Qualifier("CouponService")
	private CouponService couponService;
	@Autowired
	@Qualifier("IntegralexchangeService")
	private IntegralexchangeService exchangeService;
	@Autowired
	@Qualifier("IntegraldetailService")
	private IntegraldetailService integraldetailService;
	@Autowired
	@Qualifier("GoodstypeService")
	private GoodstypeService goodstypeService;
	@Autowired
	@Qualifier("FootmarkService")
	private FootmarkService footmarkService;
	
	@RequestMapping("findConpon")
	public ModelAndView findConpon(String flag, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		Users user = (Users) session.getAttribute("loginUsers");
		if(flag.equals("use")) {
			List<Coupon> couponList = this.couponService.findUseCoupon(user);
			modelAndView.addObject("couponList", couponList);
		} else if(flag.equals("useed")) {
			List<Coupon> couponList = this.couponService.findUseedCoupon(user);
			modelAndView.addObject("couponList", couponList);
		} else if(flag.equals("notuse")) {
			List<Coupon> couponList = this.couponService.findNotUseCoupon(user);
			modelAndView.addObject("couponList", couponList);
		}
		modelAndView.setViewName("shop/youhuijuandetail");
		return modelAndView;
	}
	
	@RequestMapping("findUseConpon")
	public ModelAndView findUseConpon(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		Users user = (Users) session.getAttribute("loginUsers");
		List<Coupon> couponList = this.couponService.findUseCoupon(user);
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
				modelAndView.addObject("typeList", typeList);
				//导航栏类型end
		
				//购物车及积分页的热销商品
				List<Footmark> cart_ReList=footmarkService.findAllCart_Re();
				modelAndView.addObject("cart_ReList", cart_ReList);
				//购物车及积分页的热销商品结束
		modelAndView.addObject("couponList", couponList);
		modelAndView.setViewName("shop/youhuijuan");
		return modelAndView;
	}
	
	@RequestMapping("saveCoupon")
	@ResponseBody
	public String saveCoupon(Integer exchangeId, HttpSession session) {
		Integralexchange integralexchange = this.exchangeService.findByExchangeId(exchangeId);
		Coupon coupon = new Coupon();
		coupon.setCouponAvail(integralexchange.getIntegralexchangeAvail());
		coupon.setCouponBegin(new Date());
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.add(Calendar.DAY_OF_MONTH, 7);
		coupon.setCouponEnd(calendar.getTime());
		coupon.setCouponRange(integralexchange.getIntegralexchangeRange());
		coupon.setCouponReduce(integralexchange.getIntegralexchangeReduce());
		Couponstatu couponState = new Couponstatu();
		couponState.setCouponstateId(1);
		coupon.setCouponState(couponState );
		Users couponUser = (Users) session.getAttribute("loginUsers");
		coupon.setCouponUser(couponUser );
		boolean res = this.couponService.saveCoupon(coupon, integralexchange);
		if(res) {
			Integraldetail integraldetail = new Integraldetail();
			integraldetail.setIntegraldetailDate(new Date());
			integraldetail.setIntegraldetailIntegralnum(-integralexchange.getIntegralexchangeIntegralnum());
			integraldetail.setIntegraldetailOrder(null);
			integraldetail.setIntegraldetailUser(couponUser);
			this.integraldetailService.saveIntegraldetail(integraldetail );
		}
		String strIntegral = couponUser.getUserIntegral().toString();
		return strIntegral;
	}
}













