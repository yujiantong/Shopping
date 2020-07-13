package com.web.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

public class Test {

	public static void main(String[] args) {
		try{
				//1、创建Socket并指定端口
				Socket socket=new Socket("localhost",8888);
				//2、向服务端发送一个请求
				PrintWriter os=new PrintWriter(socket.getOutputStream());
				System.out.println("消息是：我是张三客户端");
				os.write("我是张三客户端");
				os.flush();//将缓冲区输出
				socket.shutdownOutput();
				//3、等待服务端的回应获取输入流，读取客户端信息(将字节流转化为字符流)，并保存在
				InputStreamReader is=new InputStreamReader(socket.getInputStream());
				BufferedReader br=new BufferedReader(is);
				String info=null;
				while((info=br.readLine())!=null){
				System.out.println("客户端焦急等待收到了回应是："+info);
				}
				socket.shutdownInput(); //关闭输入流
				//4、关闭资源
				os.close();
				is.close();
				br.close();
				socket.close();
		    } catch(UnknownHostException e) {
				  e.printStackTrace();
				} catch(IOException e) {
				  e.printStackTrace();

	        }
	}

}
