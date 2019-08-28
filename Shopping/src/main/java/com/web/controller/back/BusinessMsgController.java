package com.web.controller.back;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.entity.Express;
import com.web.entity.Goods;
import com.web.entity.Goodstype;
import com.web.entity.Imgs;
import com.web.entity.Logistics;
import com.web.entity.OrderDetail;
import com.web.entity.Orders;
import com.web.entity.Status;
import com.web.entity.Users;
import com.web.service.ExpressService;
import com.web.service.GoodsService;
import com.web.service.GoodstypeService;
import com.web.service.ImgsService;
import com.web.service.LogisticsServic;
import com.web.service.OrderDetailService;
import com.web.service.OrderService;
import com.web.service.StatuService;
import com.web.service.UsersService;
import com.web.vo.SearchGoodsVO;
import com.web.vo.SearchOrderVO;

@Controller
@RequestMapping("businessMsg")
public class BusinessMsgController {
	@Autowired
	@Qualifier("OrderService")
	private OrderService oService;
	@Autowired
	@Qualifier("OrderDetailService")
	private OrderDetailService detailService;
	@Autowired
	@Qualifier("LogisticsServic")
	private LogisticsServic lService;
	@Autowired
	@Qualifier("UsersService")
	private UsersService uService;
	@Autowired
	@Qualifier("GoodsService")
	private GoodsService gService;
	@Autowired
	@Qualifier("GoodstypeService")
	private GoodstypeService tService;
	@Autowired
	@Qualifier("StatuService")
	private StatuService sService;
	@Autowired
	@Qualifier("ImgsService")
	private ImgsService iService;
	@Autowired
	@Qualifier("ExpressService")
	private ExpressService eService;
	
	/**
	 * 获取交易额 孙
	 * @param model
	 * @return
	 */
	@RequestMapping("getBusinessMsgTop")
	public String getBusinessMsgTop(Model model){
		List<Orders> successList=oService.findOrdersByStatu(1);  //成功
		List<Orders> failList=oService.findOrdersByStatu(2);     //失败
		List<Orders> allList=oService.findAllOrder();
		//交易成功金额
		Double successMoney=0d;
		//订单总数
		Integer totalOrder=allList.size();
		//交易成功单数
		Integer successOrder=successList.size();
		//交易失败单数
		Integer failOrder=failList.size();
		//退款金额
		Double backMoney=0d;
		
		for (Orders orders : allList) {
			successMoney+=orders.getOrderAllPrice();
		}
		for (Orders orders : failList) {
			backMoney+=orders.getOrderAllPrice();
		}
		model.addAttribute("successMoney", successMoney);
		model.addAttribute("totalOrder", totalOrder);
		model.addAttribute("successOrder", successOrder);
		model.addAttribute("failOrder", failOrder);
		model.addAttribute("backMoney", backMoney);
		return "manager/transaction";
	}
	
	/**
	 * 获取月份报表 孙
	 * @param model
	 * @return
	 */
	@RequestMapping("getBusinessMsgBar")
	@ResponseBody
	public String getBusinessMsgBar(String flag){
		Map<Integer, List<Logistics>> allMap = new HashMap<Integer, List<Logistics>>();
		Map<Integer, List<Logistics>> successMap = new HashMap<Integer, List<Logistics>>();
		Map<Integer, List<Logistics>> havePayMap = new HashMap<Integer, List<Logistics>>();
		Map<Integer, List<Logistics>> unSendMap = new HashMap<Integer, List<Logistics>>();
		SearchOrderVO AllVO =new SearchOrderVO(new Date().toString().substring(24),  null);
		for (Integer i = 1; i < 13; i++) {
			AllVO.setMonth(i.toString());
			List<Logistics> list=lService.findByVO(AllVO);
			allMap.put(i, list);
		}
		SearchOrderVO successVO =new SearchOrderVO(new Date().toString().substring(24),  2);
		for (Integer i = 1; i < 13; i++) {
			successVO.setMonth(i.toString());
			List<Logistics> list=lService.findByVO(successVO);
			successMap.put(i, list);
		}
		SearchOrderVO havePayVO =new SearchOrderVO(new Date().toString().substring(24),  3);
		for (Integer i = 1; i < 13; i++) {
			havePayVO.setMonth(i.toString());
			List<Logistics> list=lService.findByVO(havePayVO);
			havePayMap.put(i, list);
		}
		SearchOrderVO unSendVO =new SearchOrderVO(new Date().toString().substring(24),  4);
		for (Integer i = 1; i < 13; i++) {
			unSendVO.setMonth(i.toString());
			List<Logistics> list=lService.findByVO(unSendVO);
			unSendMap.put(i, list);
		}
		List<Integer> allOrderList = new ArrayList<Integer>();
		List<Integer> successList = new ArrayList<Integer>();
		List<Integer> havePayList = new ArrayList<Integer>();
		List<Integer> unSendList = new ArrayList<Integer>();
		for (int i = 0; i < 12; i++) {
			if(allMap.get(i)!=null)
				allOrderList.add(allMap.get(i).size());
			else
				allOrderList.add(0);	
			if(successMap.get(i)!=null)
				successList.add(successMap.get(i).size());
			else
				successList.add(0);
			if(havePayMap.get(i)!=null)
				havePayList.add(havePayMap.get(i).size());
			else
				havePayList.add(0);
			if(unSendMap.get(i)!=null)
				unSendList.add(unSendMap.get(i).size());
			else
				unSendList.add(0);
		}
		//每个月份所有订单
		String allOrder = "";
		//每个月份成功交易订单
		String successOrder = "";
		//每个月已支付订单
		String havePayOrder = "";
		//每个月未发货订单
		String unSendOrder = "";
		
		for (int i = 0; i < 12; i++) {
			allOrder=allOrder+allOrderList.get(i).toString()+",";
			successOrder=successOrder+successList.get(i).toString()+",";
			havePayOrder=havePayOrder+havePayList.get(i).toString()+",";
			unSendOrder=unSendOrder+unSendList.get(i).toString()+",";
		}
		allOrder="["+allOrder.substring(0, allOrder.length()-1)+"]";
		successOrder="["+successOrder.substring(0, successOrder.length())+"]";
		havePayOrder="["+havePayOrder.substring(0, havePayOrder.length())+"]";
		unSendOrder="["+unSendOrder.substring(0, unSendOrder.length())+"]";
		if(flag.equals("success")){
			return successOrder;
		}else if(flag.equals("havePay")){
			return havePayOrder;
		}else if(flag.equals("all")){
			return allOrder;
		}else{
			return unSendOrder;
		}
	}
	/**
	 * 获取商城信息 孙
	 * @param flag
	 * @return
	 */
	@RequestMapping("getShopMsg")
	@ResponseBody
	public String getShopMsg(){
		List<Users> userList=uService.findAllUser();
		List<Orders> orderList=oService.findAllOrder();
		Double allPrice =0d;
		Double unPayPrice=0d;
		for (Orders orders : orderList) {
			allPrice+=orders.getOrderAllPrice();
		}
		List<Orders> unPayList=oService.findOrdersByStatu(2); //待定未发货状态编号
		for (Orders orders : unPayList) {
			unPayPrice+=orders.getOrderAllPrice();
		}
		String msg=userList.size()+","+unPayPrice+","+orderList.size()+","+allPrice+"";
		return msg;
	}
	/**
	 * 随便查询集中商品类型（2级）
	 * @param model
	 * @return
	 */
	@RequestMapping("getDetailMsg")
	public String getDetailMsg(Model model,String orderId,String orderDate,SearchGoodsVO vo){
		System.out.println("getDetailMsg");
		List<Goods> allGoodList=gService.findAll(vo);
		List<Goods> babyCareList=gService.findByType(2);
		List<Goods> babyCarList=gService.findByType(9);
		List<Goods> skinCareList=gService.findByType(15);
		List<Goods> lifeDianqi=gService.findByType(39);
		List<Goods> userOfBedList=gService.findByType(36);
		List<Goods> xiuxianFood=gService.findByType(41);
		List<Goods> FruitGoodList=gService.findByType(42);
		List<Goods> bingganList=gService.findByType(47);
		
		List<Goodstype> typeList= tService.findParent();
		
		List<Logistics> logisticsList=lService.findAllLogistics();
		for (Logistics logistics : logisticsList) {
			Orders order =oService.findById(logistics.getLogisticsOrder().getOrderId());
			List<OrderDetail> orderDetailList=detailService.findByOrder(logistics.getLogisticsOrder().getOrderId());
			for (OrderDetail orderDetail : orderDetailList) {
				orderDetail.setDetailGoods(gService.findById(orderDetail.getDetailGoods().getGoodsId()));
			}
			order.setOrderDetailList(orderDetailList);
			Status statu=sService.findById(logistics.getLogisticsStatu().getStatuId());
			logistics.setLogisticsOrder(order);
			logistics.setLogisticsStatu(statu);
		}
		/**
		 * 所有商品的数量
		 */
		model.addAttribute("babyCare" , babyCareList.size()/allGoodList.size());
		/**
		 * 几种桑品类型的数量
		 */
		model.addAttribute("muying", oService.findByParentType(1));
		model.addAttribute("meizhuang", oService.findByParentType(14));
		model.addAttribute("jiaju", oService.findByParentType(27));
		model.addAttribute("shipin", oService.findByParentType(40));
		model.addAttribute("babyCar" , babyCarList.size());
		model.addAttribute("babyCare" , babyCareList.size());
		model.addAttribute("skinCare" , skinCareList.size());
		model.addAttribute("lifeDianqi" , lifeDianqi.size());
		model.addAttribute("userOfBed" , userOfBedList.size());
		model.addAttribute("xiuxianFood" , xiuxianFood.size());
		model.addAttribute("FruitGood" , FruitGoodList.size());
		model.addAttribute("binggan" , bingganList.size());
		/**
		 * 所有父亲级类型
		 */
		model.addAttribute("typeList", typeList);
		/**
		 * 所有的订单 包含订单详细和状态详细
		 */
		if((orderId=="" || orderId==null) && (orderDate==null || orderDate=="")){
			model.addAttribute("logisticsList", logisticsList);
			List<Express> expressList=eService.findAll();
			System.out.println(expressList.size()+"********");
			model.addAttribute("expressList",expressList );
		}else{
			if(orderId=="") orderId=null;
			if(orderDate=="") orderDate=null;
			System.out.println("else==========="+"\n"+"orderId="+orderId+"\n"+"orderDate="+orderDate);
			List<Logistics> List=lService.findByIdOrDate(orderId, orderDate);
			System.out.println(List.size());
			for (Logistics logistics : List) {
				logistics.setLogisticsOrder(oService.findById(logistics.getLogisticsOrder().getOrderId()));
				logistics.getLogisticsOrder().setOrderDetailList(detailService.findByOrder(logistics.getLogisticsOrder().getOrderId()));
				List<OrderDetail> detailList=logistics.getLogisticsOrder().getOrderDetailList();
				for (OrderDetail orderDetail : detailList) {
					orderDetail.setDetailGoods(gService.findById(orderDetail.getDetailGoods().getGoodsId()));
				}
				logistics.setLogisticsStatu(sService.findById(logistics.getLogisticsStatu().getStatuId()));
			}
			model.addAttribute("logisticsList", List);
			List<Express> expressList=eService.findAll();
			model.addAttribute("expressList",expressList );
		}
		return "manager/Orderform";
	}
	/**
	 * 获取订单详细
	 * @param model
	 * @param orderId
	 * @return
	 */
	@RequestMapping("getDetail")
	public String findDetail(Model model,String orderId){
		Orders order=oService.findById(orderId);
		List<OrderDetail> detailList=detailService.findByOrder(orderId);
		for (OrderDetail orderDetail : detailList) {
			orderDetail.setDetailGoods(gService.findById(orderDetail.getDetailGoods().getGoodsId()));
			List<Imgs> imgList=iService.findByGoodsId(orderDetail.getDetailGoods().getGoodsId());
			orderDetail.getDetailGoods().setImgsList(imgList);
			orderDetail.setDetailGoods(gService.findById(orderDetail.getDetailGoods().getGoodsId()));
		}
		order.setOrderDetailList(detailList);
		model.addAttribute("order", order);
		List<Logistics> l=lService.findByIdOrDate(orderId, null);
		Status statu=sService.findById(l.get(0).getLogisticsStatu().getStatuId());
		l.get(0).setLogisticsStatu(statu);
		model.addAttribute("logistics", l.get(0));
		return "manager/order_detailed";
	}
	@RequestMapping("delOrder")
	@ResponseBody
	public String delOrder(Model model,String orderId){
		List<Logistics> logisticsList= lService.findByIdOrDate(orderId, null);
		logisticsList.get(0).getLogisticsStatu().setStatuId(4);
		lService.updaLogistics(logisticsList.get(0));
		return "";
		//return "businessMsg/getDetailMsg";
	}
	@RequestMapping("updateOrder")
	@ResponseBody
	public String updateOrder(Model model,String orderId,String kuaidi,Integer expressId){
		List<Logistics> logisticsList= lService.findByIdOrDate(orderId, null);
		Express express=eService.findById(expressId);
		logisticsList.get(0).setLogisticsExpress(express);
		Status logisticsStatu=sService.findById(8);
		logisticsList.get(0).setLogisticsStatu(logisticsStatu);
		lService.updaLogistics(logisticsList.get(0));
		return express.getExpressName();
		//return "businessMsg/getDetailMsg";
	}
	@RequestMapping("getOrderSize")
	@ResponseBody
	public Integer getOrderSize(Integer orderSize,HttpSession session){
		//System.out.println("else="+orderSize);
		Integer newSize=lService.findAllLogistics().size();
		if(orderSize==null) orderSize=0;
		//System.out.println("if="+newSize);
		if(newSize>orderSize){
			//System.out.println("if");
			session.setAttribute("orderSize", newSize);
			//播放声音
			//VoiceUtil.speak("您有新的订单，请及时处理");
		}
		return newSize;
	}
}
