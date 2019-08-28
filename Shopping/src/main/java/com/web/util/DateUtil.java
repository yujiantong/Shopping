package com.web.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	/**
	 * 字符串转换为日期类型
	 * @param strDate
	 * @param format
	 * @return
	 * @throws ParseException
	 */
	public static Date stringToDate(String strDate, String format) throws ParseException {
		SimpleDateFormat sf = new SimpleDateFormat(format);
		return sf.parse(strDate);
	}
	/**
	 * 日期转换为字符串类型
	 * @param date
	 * @param format
	 * @return
	 */
	public static String dateToString(Date date, String format) {
		SimpleDateFormat sf = new SimpleDateFormat(format);
		return sf.format(date);
	}
}
