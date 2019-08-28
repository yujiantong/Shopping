package com.web.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.SimpleHttpConnectionManager;
import org.apache.commons.httpclient.methods.GetMethod;

public class HttpRequestUtil {

    /**
     * HttpClient 模拟POST请求
     * 方法说明
     * @param url
     * @param params
     * @return String
     */
    public static String getRequest(String url, Map<String, String> params) {
    	String paramStr = "";
        //添加参数
        for (String key : params.keySet()) {
            paramStr = paramStr + "&" + key + "=" + params.get(key);
        }
        String path = url + "?" + paramStr;
        //System.out.println("请检查输入的URL!" + path);

        // 开启线程来发起网络请求
        HttpURLConnection connection = null;
        try {
            URL url1 = new URL(path);

            connection = (HttpURLConnection) url1.openConnection();

            connection.setRequestMethod("GET");
            connection.setConnectTimeout(8000);

            connection.setDoOutput(true);
            connection.setDoInput(true);
            InputStream in = connection.getInputStream(); // 下面对获取到的输入流进行读取
            BufferedReader reader = new BufferedReader(new
                    InputStreamReader(in));
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }

            return response.toString();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }

        return "";

    }

    /**
     * HttpClient 模拟GET请求
     * 方法说明
     *
     * @param url
     * @param params
     * @return String
     */
    public static String postRequest(String url, Map<String, String> params) {
        //构造HttpClient实例
        //拼接参数
        String paramStr = "";
        for (String key : params.keySet()) {
            paramStr = paramStr + "&" + key + "=" + params.get(key);
        }
        paramStr = paramStr.substring(1);
        //System.out.println("请检查输入的URL!" + url + "?" + paramStr);

        HttpClient client = new HttpClient();

        //创建GET方法的实例
        GetMethod method = new GetMethod(url + "?" + paramStr);

        //接收返回结果
        String result = null;
        try {
            //执行HTTP GET方法请求
            client.executeMethod(method);

            //返回处理结果
            result = method.getResponseBodyAsString();
        } catch (HttpException e) {
            // 发生致命的异常，可能是协议不对或者返回的内容有问题
            System.out.println("请检查输入的URL!");
            e.printStackTrace();
        } catch (IOException e) {
            // 发生网络异常
            System.out.println("发生网络异常!");
            e.printStackTrace();
        } finally {
            //释放链接
            method.releaseConnection();

            //关闭HttpClient实例
            if (client != null) {
                ((SimpleHttpConnectionManager) client.getHttpConnectionManager()).shutdown();
                client = null;
            }
        }
        return result;
    }
}