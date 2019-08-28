package com.web.controller.font;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.web.entity.Footmark;
import com.web.entity.Goodstype;
import com.web.entity.Integraldetail;
import com.web.entity.Integralexchange;
import com.web.entity.Users;
import com.web.service.FootmarkService;
import com.web.service.GoodstypeService;
import com.web.service.IntegraldetailService;
import com.web.service.IntegralexchangeService;

@Controller
@RequestMapping("IntegralexchangeController")
public class IntegralexchangeController {
	
	@Autowired
	@Qualifier("IntegralexchangeService")
	private IntegralexchangeService integralexchangeService;
	@Autowired
	@Qualifier("IntegraldetailService")
	private IntegraldetailService integraldetailService;
	@Autowired
	@Qualifier("GoodstypeService")
	private GoodstypeService goodstypeService;

	@Autowired
	@Qualifier("FootmarkService")
	private FootmarkService footmarkService;
	
	@RequestMapping("findAllExchange")
	public ModelAndView findAllExchange(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		Users user = (Users) session.getAttribute("loginUsers");
		List<Integralexchange> exchangeList = this.integralexchangeService.findAllExchange();
		PageHelper.startPage(1, 7);
		List<Integraldetail> integraldetailList = this.integraldetailService.findFiveIntegraldetail(user.getUserId());
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
		modelAndView.addObject("exchangeList", exchangeList);
		modelAndView.addObject("integraldetailList", integraldetailList);
		
		//购物车及积分页的热销商品
		List<Footmark> cart_ReList=footmarkService.findAllCart_Re();
		modelAndView.addObject("cart_ReList", cart_ReList);
		//购物车及积分页的热销商品结束
		modelAndView.setViewName("shop/jifen");
		return modelAndView;
	}
	
	@RequestMapping("findIntegraldetail")
	public ModelAndView findIntegraldetail(String flag, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		Users user = (Users) session.getAttribute("loginUsers");
		if(flag.equals("income")) {
			PageHelper.startPage(1, 7);
			List<Integraldetail> integraldetailList = this.integraldetailService.findIncome(user.getUserId());
			/*if(integraldetailList.size()>5) {
				for(int i = 5; i<integraldetailList.size(); i++) {
					integraldetailList.remove(i);
				}
			}*/
			modelAndView.addObject("integraldetailList", integraldetailList);
		}
		if(flag.equals("expend")) {
			PageHelper.startPage(1, 7);
			List<Integraldetail> integraldetailList = this.integraldetailService.findExpend(user.getUserId());
			/*if(integraldetailList.size()>5) {
				for(int i = 5; i<integraldetailList.size(); i++) {
					integraldetailList.remove(i);
				}
			}*/
			modelAndView.addObject("integraldetailList", integraldetailList);
		}
		if(flag.equals("all")) {
			PageHelper.startPage(1, 7);
			List<Integraldetail> integraldetailList = this.integraldetailService.findFiveIntegraldetail(user.getUserId());
			modelAndView.addObject("integraldetailList", integraldetailList);
		}
		modelAndView.setViewName("shop/integraldetail");
		return modelAndView;
	}
}
