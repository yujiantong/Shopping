package com.web.controller.font;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.entity.Ads;
import com.web.entity.Discuss;
import com.web.entity.Footmark;
import com.web.entity.Goods;
import com.web.entity.Goodstype;
import com.web.entity.Users;
import com.web.service.AdsService;
import com.web.service.DiscussService;
import com.web.service.DiscussService;
import com.web.service.FootmarkService;
import com.web.service.GoodsService;
import com.web.service.GoodstypeService;

@Controller
@RequestMapping("fontGoods")
public class GoodsFontController {
	@Autowired
	@Qualifier("GoodsService")
	private GoodsService goodsService;
	@Autowired
	@Qualifier("GoodstypeService")
	private GoodstypeService goodstypeService;
	@Autowired
	@Qualifier("DiscussService")
	private DiscussService discussService;
	
	@Autowired
	@Qualifier("AdsService")
	private AdsService adsService;
	
	@Autowired
	@Qualifier("FootmarkService")
	private FootmarkService footmarkService;
	/**
	 * 商品详情信息
	 * @param goodsId
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("goodsDetail")
	public String goodsDetail(Integer goodsId,Model model,HttpSession session){
		
		//System.out.println(goodsId+"OOOOOOOOOOOOOO");
		Users users = (Users) session.getAttribute("loginUsers");
		Goods goodsDetail=goodsService.goodsDetail(goodsId, users);
		model.addAttribute("goodsDetail", goodsDetail);
		//评价类型
		List<Map<String, Object>> discussStyleList = this.discussService.countDiscussByStyle(goodsId);
		model.addAttribute("discussStyleList", discussStyleList);
		//输出全部评价
		List<Discuss> discussList = this.discussService.findByGoodsIdJoinUsers(goodsId);
		model.addAttribute("discussList", discussList);
		//商品类型
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
		
		//购物车及积分页的热销商品
	    List<Footmark> cart_ReList=footmarkService.findAllCart_Re();
	    model.addAttribute("cart_ReList", cart_ReList);
	    //购物车及积分页的热销商品结束
		return "shop/show";
	}
	
	@RequestMapping("findBytypeId")
	public String findBytypeId(Integer typePid, Integer typeId,HttpServletRequest request){
		List<Goodstype> typeListMuying=goodstypeService.findAllMuying();
		List<Goodstype> typeListMeizhuang=goodstypeService.findAllMeizhuang();
		List<Goodstype> typeListJiaju=goodstypeService.findAllJiaju();
		List<Goodstype> typeListYinyang=goodstypeService.findAllYinyang();
		List<List<Goodstype>> typeList = new ArrayList<List<Goodstype>>();
		typeList.add(typeListMuying);
		typeList.add(typeListMeizhuang);
		typeList.add(typeListJiaju);
		typeList.add(typeListYinyang);
		request.setAttribute("typeList", typeList);
		
		List<Goodstype> goodstypeList=goodstypeService.findByTypePid(typePid);
		request.setAttribute("goodstypeList", goodstypeList);
		System.out.println(goodstypeList.size()+"********");
		
		List<Goods> goodsList=goodsService.findByTypeId(typeId);
		request.setAttribute("goodsList", goodsList);
		return "shop/liebiao";
	}
	@RequestMapping("findnewGoods")
	public String newGoods(Model model){
		//新品推荐
		List<Goods> newGoodsList=goodsService.findnewGoods();
		//热门唇妆
		List<Goods> newGoods_ReLipList=goodsService.findnewGoods_ReLip();
		//休闲零食
		List<Goods> newGoods_ArderList=goodsService.findnewGoods_Arder();
		List<Ads> adsList=adsService.findAllAds();
		
		
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
		
		
		
		model.addAttribute("newGoodsList", newGoodsList);
		model.addAttribute("newGoods_ReLipList", newGoods_ReLipList);
		model.addAttribute("newGoods_ArderList", newGoods_ArderList);
		model.addAttribute("adsList", adsList);
		
		return "shop/lanmu";
	}
}
