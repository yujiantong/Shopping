package com.web.controller.font;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.web.entity.Discuss;
import com.web.entity.DiscussImg;
import com.web.entity.Discussstyle;
import com.web.entity.Goods;
import com.web.entity.Logistics;
import com.web.entity.OrderDetail;
import com.web.entity.Status;
import com.web.entity.Users;
import com.web.service.DiscussImgService;
import com.web.service.DiscussService;
import com.web.service.GoodsService;
import com.web.service.LogisticsServic;
import com.web.service.OrderDetailService;
import com.web.service.OrderService;
import com.web.service.StatuService;

@Controller
@RequestMapping("DiscussController")
public class DiscussController {

	@Autowired
	@Qualifier("DiscussService")
	private DiscussService discussService;
	@Autowired
	@Qualifier("GoodsService")
	private GoodsService gService;
	@Autowired
	@Qualifier("DiscussImgService")
	private DiscussImgService dService;
	@Autowired
	@Qualifier("OrderService")
	private OrderService oService;
	@Autowired
	@Qualifier("LogisticsServic")
	private LogisticsServic lService;
	@Autowired
	@Qualifier("OrderDetailService")
	private OrderDetailService detailService;
	@Autowired
	@Qualifier("StatuService")
	private StatuService sService;
	
	@RequestMapping("discuss")
	public ModelAndView discuss(Integer goodsId, Integer styleId) {
		ModelAndView modelAndView = new ModelAndView();
		List<Discuss> discussList = this.discussService.findByGoodsIdAndStyleIdJoinUsers(goodsId, styleId);
		modelAndView.addObject("discussList", discussList);
		modelAndView.setViewName("shop/discuss");
		return modelAndView;
	}
	
	@RequestMapping("discussT")
	public ModelAndView discussT(Integer goodsId) {
		ModelAndView modelAndView = new ModelAndView();
		List<Discuss> discussList = this.discussService.findByGoodsIdJoinUsers(goodsId);
		modelAndView.addObject("discussList", discussList);
		modelAndView.setViewName("shop/discuss");
		return modelAndView;
	}
	@RequestMapping("saveDiucss")
	@ResponseBody
	public String saveDiucss(HttpServletRequest request, @RequestParam("myimg")MultipartFile file[],String comment,String orderId,Integer service,Integer logistics,Integer quality,HttpSession session){
		Logistics logsitics=lService.findByOrderId(orderId);
		String comment2 = null;
		try {
			comment2 = new String(comment.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		List<Goods> goodList=new ArrayList<Goods>();
		List<OrderDetail> detailList=detailService.findByOrder(logsitics.getLogisticsOrder().getOrderId());
		logsitics.getLogisticsOrder().setOrderDetailList(detailList);
		for (int i = 0; i < logsitics.getLogisticsOrder().getOrderDetailList().size(); i++) {
			goodList.add(logsitics.getLogisticsOrder().getOrderDetailList().get(i).getDetailGoods());
		}
		
		Users user=(Users) session.getAttribute("loginUsers");
		List<DiscussImg> imgList=new ArrayList<DiscussImg>();
		for (Goods good : goodList) {
			Discuss discuss=new Discuss();
			
			discuss.setDiscussComment(comment2);
			
			discuss.setDiscussDate(new Date());
			
			discuss.setDiscussGood(good);
			
			Discussstyle discussStyle=new Discussstyle();
			discuss.setDiscussStyle(discussStyle);//0-5差评5-10中评10-15好评
			int count=service+logistics+quality;
			if(count>=0 && count<=5){
				discussStyle.setDiscussstyleId(3);
			}else if(count>5 && count<=10){
				discussStyle.setDiscussstyleId(2);
			}else{
				discussStyle.setDiscussstyleId(1);
			}
			discuss.setDiscussStyle(discussStyle);
			
			discuss.setDiscussUser(user);
			
			discuss.setDiscussService(service);
			
			discuss.setDiscussLogistics(logistics);
			
			discuss.setDiscussQuality(quality);
			for (MultipartFile multipartFile : file) {
				String imgType=multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf("."), multipartFile.getOriginalFilename().length());
				String imgName=UUID.randomUUID().toString().replace("-", "")+imgType;
				try {
					multipartFile.transferTo(new File(request.getServletContext().getRealPath("/resources/upfile/"+imgName)));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				DiscussImg img=new DiscussImg();
				img.setDiscussImgdis(discuss);
				img.setDiscussImgPath(imgName);
				imgList.add(img);
				
				discuss.setDiscussImg(imgName);
				
			}
			discuss.setImgList(imgList);
			discussService.saveDiscuss(discuss);
		}
		Status statu=sService.findById(9);
		logsitics.setLogisticsStatu(statu);
		lService.updaLogistics(logsitics);
		return "";
	}
	@RequestMapping("testpic")
	@ResponseBody
	public String testpic(@RequestParam("myimg")MultipartFile file[]){
		System.out.println(file.length);
		return "";
	}
}
