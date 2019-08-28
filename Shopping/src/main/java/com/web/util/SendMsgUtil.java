package com.web.util;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class SendMsgUtil {

    /**
     * 发送短信消息
     * 方法说明
     *
     */
    @SuppressWarnings("deprecation")
    public static String sendMsg(String phones, String content) {
        //短信接口URL提交地址
        String url = "http://121.43.192.197:8888/sms.aspx";
        Map<String, String> params = new HashMap<String, String>();
        params.put("action", "send");
        params.put("userid", "9863");
        params.put("account", "940054296");
        params.put("password", "123456");
        params.put("mobile", phones);
        params.put("content", URLEncoder.encode(content));
        params.put("sendTime", "");
        params.put("extno", "");
        return HttpRequestUtil.getRequest(url, params);
    }

    /**
     * 随机生成6位随机验证码
     */
    public static String createRandomVcode() {
        //验证码
        String vcode = "";
        for (int i = 0; i < 6; i++) {
            vcode += (int) (Math.random() * 9);
        }
        return vcode;
    }

    /**
     * 测试
     * 方法说明
     */
    public static void main(String[] args) {
        // System.out.println(SendMsgUtil.createRandomVcode());
    	//System.out.println("&ecb=12".substring(1));
        System.out.println(sendMsg("18310244601", "【云众支付宝】您的验证码是" + SendMsgUtil.createRandomVcode() + "，有效期为60秒"));
    }
}