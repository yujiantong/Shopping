package com.web.controller.font;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.entity.Users;
import com.web.util.PaymentUtil;


@Controller
@RequestMapping("pay")
public class OrderPayAction {
	//为了在配置文件中得到构建好的URL
	//订单编号
	//银行代码

	@RequestMapping("payOrder")
	public String payOrder(HttpSession session,  HttpServletRequest request,StringBuffer s,String ordersId,String pd_FrpId,
			String goodsId){
		Users loginUsers=(Users) session.getAttribute("loginUsers");
		System.out.println(pd_FrpId+"*******************"+ordersId);
		// 付款需要的参数:
		// 测试商户：商户编号
		String p1_MerId = "10001126856";
		// 测试商户：密钥
		String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";
		// 测试商户：商户接收支付成功数据的地址，这个是要手工改的，支付成功后的处理action
		String p8_Url = "http://172.20.177.105:8080/Shopping/OrderPayCollbackAction/orderpaycallback";
		// 获取订单号
		//测试先随机生成
		//ordersId=UUID.randomUUID().toString().replace("-", "");
		String p2_Order = ordersId;
		// 获取支付金额
		String p3_Amt = "0.01";// 测试写死
		// 获取用户所选择的银行
		String p0_Cmd = "Buy"; // 业务类型。Buy为在线支付
		String p4_Cur = "CNY"; // 交易币种。CNY为人民币
		String p7_Pdesc = ""; // 商品描述
		String p6_Pcat = ""; // 商品种类
		String p5_Pid = goodsId; // 商品ID
		String p9_SAF = "0"; // 送货地址。0为不需要，1为需要
		String pa_MP = loginUsers.getUserId().toString(); // 商户扩展信息
		String pr_NeedResponse = "0"; // 应答机制
		// 秘钥
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
				p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
				pd_FrpId, pr_NeedResponse, keyValue);// hmac
		s = new StringBuffer("https://www.yeepay.com/app-merchant-proxy/node?");

		s.append("p0_Cmd=").append(p0_Cmd).append("&");
		s.append("p1_MerId=").append(p1_MerId).append("&");
		s.append("p2_Order=").append(p2_Order).append("&");
		s.append("p3_Amt=").append(p3_Amt).append("&");
		s.append("p4_Cur=").append(p4_Cur).append("&");
		s.append("p5_Pid=").append(p5_Pid).append("&");
		s.append("p6_Pcat=").append(p6_Pcat).append("&");
		s.append("p7_Pdesc=").append(p7_Pdesc).append("&");
		s.append("p8_Url=").append(p8_Url).append("&");
		s.append("p9_SAF=").append(p9_SAF).append("&");
		s.append("pa_MP=").append(pa_MP).append("&");
		s.append("pd_FrpId=").append(pd_FrpId).append("&");
		s.append("pr_NeedResponse=").append(pr_NeedResponse).append("&");
		s.append("hmac=").append(hmac);
		return "redirect:"+s.toString();
	}

}