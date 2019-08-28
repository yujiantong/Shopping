package com.web.controller.font;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.entity.Logistics;
import com.web.entity.Status;
import com.web.entity.Users;
import com.web.service.LogisticsServic;
import com.web.service.UsersService;
import com.web.util.PaymentUtil;

@Controller
@RequestMapping("OrderPayCollbackAction")
public class OrderPayCollbackAction{

	// 支付网关发来的加密验证码
	// 商户编号
	// 业务类型
	// 支付结果
	// 易宝支付交易流水号
	// 支付金额
	// 交易币种
	// 商品名称
	// 商户订单号
	// 易宝支付会员ID
	// 商户扩展信息
	// 交易结果返回类型
	@Autowired
	@Qualifier("LogisticsServic")
	private LogisticsServic logService;
	
	@Autowired
	@Qualifier("UsersService")
	private UsersService userService;
	
	@RequestMapping("orderpaycallback")
	public String execute(HttpSession session,Model model,String hmac,String p1_MerId,String r0_Cmd,String r1_Code,
			String r2_TrxId,String r3_Amt,String r4_Cur,String r5_Pid,String r6_Order,String r7_Uid,String r8_MP,String r9_BType)  {
		String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";// 密钥
		System.out.println(hmac + p1_MerId + r0_Cmd + r1_Code + r2_TrxId
				+ r3_Amt + r4_Cur + r5_Pid + r6_Order + r7_Uid + r8_MP
				+ r9_BType + keyValue);
		boolean bool = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd,
				r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid,
				r8_MP, r9_BType, keyValue);
		if (bool) {
			//支付成功,进行支付成功之后对数据库的操作
			System.out.println(r6_Order);//页面选取的银行名称
			
			// 修改logis表状态
			Logistics log=logService.findByOrderId(r6_Order);  
			Status logisticsStatu=new Status();
			logisticsStatu.setStatuId(7);
			logisticsStatu.setStatuName("待发货");
			log.setLogisticsStatu(logisticsStatu);
			logService.updaLogistics(log);
			//订单号
			model.addAttribute("r6_Order", r6_Order);
			
			Users loginUsers=this.userService.findById(Integer.valueOf(r8_MP));
			/*loginUsers.setUserName(r5_Pid);
			loginUsers.setUserId(Integer.valueOf(r8_MP));*/
			
			session.setAttribute("loginUsers", loginUsers);
			System.out.println(r5_Pid+"\t"+r8_MP);
			return "shop/success";
		} else {
			//支付失败
			return "shop/error";
		}
	}
}
