package com.web.controller.font;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("Msg")
public class GetMsgController {
	@RequestMapping(value="getMsg",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String getMsg(HttpSession session,String flag,HttpServletRequest request){
		String message=null;
		if(flag.equals("user")){
			message=(String) session.getAttribute("userMsg");
			session.setAttribute("userMsg", null);
		}else{
			message=(String) session.getAttribute("managerMsg");
			
			session.setAttribute("managerMsg", null);
		}
		return message;
	}
	@RequestMapping(value="sendMsg",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String sendMsg(HttpSession session,String flag,String message){
		String msg=null;
		try {
			msg=new String(message.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag.equals("user")){
			session.setAttribute("userMsg", msg);
		}else{
			session.setAttribute("managerMsg", msg);
		}
		return "";
	}
}
