package com.web.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SecurityUtil {
	
	public static String KL_MD5_Two(String inStr) {
		return KL(MD5_Two(inStr));
	}
	
	public static String MD5_Two(String inStr) {
		return MD5(MD5(inStr));
	}
	
	public static String MD5(String inStr) {
		MessageDigest md5 = null;

		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			System.out.println(e.toString());
			return "";
		}
		
		char[] charArray = inStr.toCharArray();
		byte[] byteArray = new byte[charArray.length];
		for (int i = 0; i < charArray.length; i++) 
			byteArray[i] = (byte) charArray[i];
		
		byte[] md5Bytes = md5.digest(byteArray);
		StringBuffer hexValue = new StringBuffer();
		
		for (int j = 0; j < md5Bytes.length; j++) {
			int val = ((int) md5Bytes[j]) & 0xff;
			if (val < 16)
				hexValue.append("0");
			hexValue.append(Integer.toHexString(val));
		}
		return hexValue.toString();
	}
	
	public static String KL(String inStr) {
		char[] a = inStr.toCharArray();
		for (int i = 0; i < a.length; i++) {
			a[i] = (char)(a[i]^'y');
		}
		String s = new String(a);
		return s;
	}
	
	/*public static void main(String args[]) {
		String s = new String("12345");
		System.out.println(s);
		System.out.println(MD5(s));
		System.out.println(KL(MD5(s)));
		System.out.println();
		System.out.println();
		
		String s2 = new String("1234569");
		System.out.println(s2);
		System.out.println(MD5(s2));
		System.out.println(KL(MD5(s2)));
	}*/
}
