<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="images/skin.css" rel="stylesheet" type="text/css" />

	
</head>
<body leftmargin="0" topmargin="0">
	<table width="100%" height="64" border="0" cellpadding="0"
		cellspacing="0" class="admin_topbg">
		<tr>
			<td width="61%" height="64" valign="top"><img src="images/logo4.png"
				width="176" height="54" ></td>
			<td width="39%" valign="top"><table width="100%" border="0"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="54%" height="38" class="admin_txt"><b></b>
							${userBean.relname } &nbsp;&nbsp;&nbsp;
							<fmt:formatDate value="<%=new Date() %>"  pattern="a "/>好，
							
							今天是
							<fmt:formatDate value="<%=new Date() %>"  pattern="yyyy-MM-dd E "/>
							&nbsp;&nbsp;&nbsp; 感谢登录使用！
							<span id="time"></span>
							<script type="text/javascript">
								window.setInterval(getTime, 1000);
								function getTime(){
									var date=new Date();
									var hour=date.getHours();
									if(hour<10){
										hour="0"+hour;
									}
									var min=date.getMinutes();
									if(min<10){
										min="0"+min;
									}
									var sec=date.getSeconds();
									if(sec<10){
										sec="0"+sec;
									}
									document.getElementById("time").innerHTML=hour+":"+min+":"+sec;
								}
							</script>
							
							<!-- 
							<div id="show_time0" style="margin-top: 0px; float: right;">
								<script>
								setInterval("show_time0.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());", 1000);
								</script>
							</div>
							 -->
						</td>
						
						<td width="42%">
												<!-- _top会清除所有被包含的框架并将文档载入整个浏览器窗口 -->
							 <a href="tologin.do" target="_top">	
								<img src="images/out.gif" alt="安全退出" width="46" height="20"
								border="0" onclick="javascript:window.history.go(-(history.length-1))">
							</a>							<!-- history.length 浏览历史的数量 登录页面是1 go(-(history.length-1))就是返回最开始的页面也就是登录页面  -->
						</td>										<!-- 用这个退出登录 就不能 在新增和修改页面使用history.back() 历史的长度不变 但所在的不是这个长度的位置时长度-1 这样上面就要-2 -->
						<td width="4%">&nbsp;</td>
					</tr>
					<tr>
						<td height="19" colspan="3">&nbsp;</td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>