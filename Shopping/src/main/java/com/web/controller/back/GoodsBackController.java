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
import org.springframework.web.servlet.ModelAndView;

import com.web.entity.Goods;
import com.web.entity.Imgs;
import com.web.service.GoodsService;
import com.web.service.ImgsService;
import com.web.vo.SearchGoodsVO;

@Controller
@RequestMapping("goodsBack")
public class GoodsBackController {
	
	@Autowired
	@Qualifier("GoodsService")
	private GoodsService goodsService;
	
	@Autowired
	@Qualifier("ImgsService")
	private ImgsService imgsService;
	/**
	 * 查找商品ID
	 * @return
	 */
	@RequestMapping("findByIdGoods")
	public String findByIdGoods(HttpServletRequest request,Integer goodsId){
		Goods goods=goodsService.findById(goodsId);
		request.setAttribute("goods", goods);
		return "manager/editGoods";
	}
	
	
	/**
	 * 更新商品信息
	 * @return
	 */
	@RequestMapping(value="updateGoods",method={RequestMethod.GET,RequestMethod.POST})
	public String updateGoods(Model model,HttpServletRequest request,Integer goodsId,Goods good,@RequestParam("myimg") MultipartFile file){
		System.out.println(good.getGoodsName()+"测试-------");
		String path=request.getServletContext().getRealPath("/resources/upfile");
		 try {
				file.transferTo(new File(path+"/"+file.getOriginalFilename()));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		 
		    Goods goods=goodsService.findById(goodsId);
		    model.addAttribute("goods", goods);    
		 
			good.setGoodsImg(file.getOriginalFilename());
		    goodsService.updateGoods(good);
		return "manager/editGoods";
	}
	/**
	 * 后台商品的展示
	 * @param page
	 * @return
	 */
	@RequestMapping("findAll")
	public ModelAndView findAll(SearchGoodsVO vo){
		System.out.println("模糊查询的名称"+vo.getGoodsName());
		  List<Goods> goodsList=this.goodsService.findAll(vo);
		  ModelAndView  mv=new ModelAndView();
		  mv.addObject("goodsList", goodsList);
		  mv.setViewName("manager/Products_List");
		  return mv;
      }
	/**
	 * 后台商品的添加
	 * @param request
	 * @param goods
	 * @param file
	 * @return
	 */
	@RequestMapping(value="saveGoods",method={RequestMethod.GET,RequestMethod.POST})
	public String saveGoods(HttpServletRequest request,Goods goods,@RequestParam("myimg") MultipartFile file[]){
		System.out.println("******************666");
		String path=request.getServletContext().getRealPath("/resources/upfile");
		 try { 
			    for (MultipartFile multipartFile : file) {
			    	multipartFile.transferTo(new File(path+"/"+multipartFile.getOriginalFilename()));
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		     goods.setGoodsDate(new Date());
		     
		     
			 goods.setGoodsImg(file[0].getOriginalFilename());
			 
			 for (int i = 1; i < file.length; i++) {
				Imgs img=new Imgs();
				img.setImgPath(file[i].getOriginalFilename());
				img.setImgGoods(goods);
				imgsService.saveImgs(img);
			}
			 goodsService.saveGoods(goods);
			 return "manager/picture-add";
	}
	
	/**
	 * 后台商品的上下架
	 */
	@RequestMapping("updateStatu")
	@ResponseBody
	public String updateStatu(Integer statuId,Integer goodsId){
		System.out.println("@@@@@@@@@@@@@@@@"+goodsId+"%%%"+statuId);
		goodsService.updateStatu(statuId,goodsId);
		return "1";
	}
	
	/**
	 * 删除商品/只修改状态
	 */
	@RequestMapping("delete")
	@ResponseBody
	public String delete(Integer goodsId){
		goodsService.delete(goodsId);
		return "已删除";
	}
	
	/**
	 * 批量删除/只修改状态
	 */
	@RequestMapping("deleteAll")
	public String deleteAll(SearchGoodsVO vo){
		System.out.println("!!!!!!!!!1");
		List<Integer> goodsId=vo.getGoodsId();
		List<Goods> goodsList=new ArrayList<Goods>();
		if(goodsId!=null&&goodsId.size()>0){
			for (Integer integer : goodsId) {
				goodsList.add(this.goodsService.findById(integer));
			}
		}
		goodsService.deleteAll(goodsList);
		return "redirect:/goodsBack/findAll";
	}
	
}
