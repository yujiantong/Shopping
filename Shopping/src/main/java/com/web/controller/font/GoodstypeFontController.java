package com.web.controller.font;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.web.entity.Ads;
import com.web.entity.Announcement;
import com.web.entity.Footmark;
import com.web.entity.Goods;
import com.web.entity.Goodstype;
import com.web.service.AdsService;
import com.web.service.AnnouncementService;
import com.web.service.FootmarkService;
import com.web.service.GoodsService;
import com.web.service.GoodstypeService;

@Controller
@RequestMapping("goodstype")
public class GoodstypeFontController {
	
	@Autowired
	@Qualifier("GoodsService")
	private GoodsService goodsService;
	@Autowired
	@Qualifier("GoodstypeService")
	private GoodstypeService goodstypeService;
	
	@Autowired
	@Qualifier("AnnouncementService")
	private AnnouncementService announcementService;
	
	@Autowired
	@Qualifier("AdsService")
	private AdsService adsService;
	@Autowired
	@Qualifier("FootmarkService")
	private FootmarkService footmarkService;
	
	@RequestMapping("findAll")
	public String findAll(HttpServletRequest request){
		// 这里的公告要展示在首页，所以直接写在此控制器里面
		List<Announcement> announcementList=announcementService.findAllAnnouncement();
		//首页左侧商品种类
		List<Goodstype> typeListMuying=goodstypeService.findAllMuying();
		List<Goodstype> typeListMeizhuang=goodstypeService.findAllMeizhuang();
		List<Goodstype> typeListJiaju=goodstypeService.findAllJiaju();
		List<Goodstype> typeListYinyang=goodstypeService.findAllYinyang();
		request.setAttribute("typeListMuying", typeListMuying);
		request.setAttribute("typeListMeizhuang", typeListMeizhuang);
		request.setAttribute("typeListJiaju", typeListJiaju);
		request.setAttribute("typeListYinyang", typeListYinyang);
		
		//首页中间商品
		PageHelper.startPage(1, 4);
		List<Goods> goodsListMuyin=goodsService.findAllMuyinGoods();
		PageHelper.startPage(1, 4);
		List<Goods> goodsListMeizhuang=goodsService.findAllMeizhuangGoods();
		PageHelper.startPage(1, 4);
		List<Goods> goodsListJiaju=goodsService.findAllJiajuGoods();
		PageHelper.startPage(1, 4);
		List<Goods> goodsListYinyang=goodsService.findAllYingyangGoods();
		request.setAttribute("goodsListMuyin", goodsListMuyin);
		request.setAttribute("goodsListMeizhuang", goodsListMeizhuang);
		request.setAttribute("goodsListJiaju", goodsListJiaju);
		request.setAttribute("goodsListYinyang", goodsListYinyang);
		
		
		//首页热销商品
		List<Footmark> goodsListMuyin_Re=footmarkService.findAllMuyinGoods_Re();
		List<Footmark> goodsListMeizhuang_Re=footmarkService.findAllMeizhuang_Re();
		List<Footmark> goodsListJiaju_Re=footmarkService.findAllJiaju_Re();
		List<Footmark> goodsListYinyang_Re=footmarkService.findAllYinyang_Re();
		request.setAttribute("goodsListMuyin_Re", goodsListMuyin_Re);
		request.setAttribute("goodsListMeizhuang_Re", goodsListMeizhuang_Re);
		request.setAttribute("goodsListJiaju_Re", goodsListJiaju_Re);
		request.setAttribute("goodsListYinyang_Re", goodsListYinyang_Re);
		
		//轮播
		List<Ads> adsList=adsService.findAllAds();
		request.setAttribute("adsList", adsList);
		
		request.setAttribute("announcementList", announcementList);
		//商城首页推荐
		List<Footmark> findAllTuijian=footmarkService.findAllTuijian();
		request.setAttribute("findAllTuijian", findAllTuijian);
		//商城推荐结束
		return "shop/index";
	}
}
