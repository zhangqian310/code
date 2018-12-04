package com.zs.pms.util;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	public static String showDay(){
		//日历类 获得当前时间    使用获得实例的方法获得实例
		Calendar cal =Calendar.getInstance();
		//获得当前年
		int y=cal.get(Calendar.YEAR);
		//获得月  因为月份是0-11月 所以数字加1
		int m=cal.get(Calendar.MONTH)+1;
		//日
		int d=cal.get(Calendar.DATE);
		//小时  12小时制
//		int hh=cal.get(Calendar.HOUR);
		//小时	24小时制
		int hh1=cal.get(Calendar.HOUR_OF_DAY);
		//分钟
		int mm=cal.get(Calendar.MINUTE);
		//秒
		int ss=cal.get(Calendar.SECOND);
		return y+"-"+m+"-"+d+" "+hh1+":"+mm+":"+ss;
		//System.out.println(y+"-"+m+"-"+d+" "+hh1+":"+mm+":"+ss);
		
		/*
		//增加时间（给日历哪个属性加值，增加多少）
		cal.add(Calendar.MONTH, 5);
		m=cal.get(Calendar.MONTH)+1;
		y=cal.get(Calendar.YEAR);
		System.out.println(y+"-"+m+"-"+d+" "+hh1+":"+mm+":"+ss);
		*/
		
	}
	
	/**把Date转换为字符串类型数据的方法
	 * @param time	需要转化的Date类型数据
	 * @param pattern	yyyy-MM-dd HH-dd-ss
	 * 								y年 M月 d日 H24小时制 h12小时制 d分 s秒
	 * @return	转化后的字符串
	 */
	public static String getDateToStr(Date time,String pattern){
		//创建一个日期格式化的对象，构造函数（格式化成什么样）
		DateFormat df=new SimpleDateFormat(pattern);
		//调用format方法可以把Date类型数据转换为字符串类型数据
		return df.format(time);
	}
	
	/**把字符串转换为Date数据的方法
	 * @param time 需要转化的字符串
	 * @param pattern	字符串的格式
	 * @return	转化后的Date数据
	 * @throws ParseException	因为字符串不一定能转换为时间 所以可能会产生异常
	 */
	public static Date getStrToDate(String time,String pattern) throws ParseException{
		//创建一个日期格式化的对象，构造函数（格式化成什么样）
		DateFormat df=new SimpleDateFormat(pattern);
		//调用parse方法可以把字符串转换为date
		return  df.parse(time);
	}
	
	public static void main(String[] args) {
		DateUtil.showDay();
	}
}
