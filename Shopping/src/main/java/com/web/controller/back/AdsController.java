package com.web.controller.back;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.web.entity.Ads;
import com.web.entity.Goods;
import com.web.service.AdsService;
import com.web.vo.SearchGoodsVO;

@Controller
@RequestMapping("AdsController")
public class AdsController {
	
	@Autowired
	@Qualifier("AdsService")
	private AdsService adsService;
	/**
	 * 后台广告/轮播查询
	 * @return
	 */
	@RequestMapping("findAllAds")
	public String findAllAds(Model model){
		List<Ads> adsList=adsService.findAllAds();
		model.addAttribute("adsList", adsList);
		return "manager/advertising";
	}
	
	/***
	 * 后台添加广告
	 * @param request
	 * @param ads
	 * @param file
	 * @return
	 */
	@RequestMapping(value="saveAds",method={RequestMethod.GET,RequestMethod.POST})
	public String saveAds(HttpServletRequest request,Ads ads,@RequestParam("adsimg") MultipartFile file){
		
		String path=request.getServletContext().getRealPath("/resources/upfile");
		 try {
				file.transferTo(new File(path+"/"+file.getOriginalFilename()));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		 ads.setAdsBegaintime(new Date());
		 ads.setAdsImg(file.getOriginalFilename());
		 adsService.saveAds(ads);
		 
		return "redirect:/AdsController/findAllAds";
	}
	
	/**
	 * 更新广告状态
	 * @param statuId
	 * @param adsId
	 * @return
	 */
	@RequestMapping("updateAdsState")
	@ResponseBody
	public String updateAdsState(Integer statuId,Integer adsId){
		adsService.updateAdsState(statuId,adsId);
		return "1";//这里返回字符串
	}
	
	/**
	 * 删除广告、修改状态
	 * @param adsId
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public String delete(Integer adsId){
		adsService.delete(adsId);
		return "1";//这里返回字符串
	}
	
	/**
	 * 批量删除/只修改状态
	 */
	@RequestMapping("deleteAllAds")
	public String deleteAllAds(SearchGoodsVO vo){
		System.out.println("9999999999999999999");
		List<Integer> adsIds=vo.getAdsIds();
		List<Ads> adsList=new ArrayList<Ads>();
		if(adsIds!=null&&adsIds.size()>0){
			for (Integer integer : adsIds) {
				adsList.add(this.adsService.findByAdsId(integer));
			}
		}
		adsService.deleteAllAds(adsList);
		return "redirect:/AdsController/findAllAds";
	}
}
