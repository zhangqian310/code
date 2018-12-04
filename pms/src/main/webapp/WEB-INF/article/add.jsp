<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<link href="../res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<!-- 引时间控件 -->
<script type="text/javascript" src="../js/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../res/fckeditor/fckeditor.js"></script>
<script src="../res/common/js/jquery.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href="../res/css/style.css" />
<!-- 引入jquery  -->
<script type="text/javascript" language="javascript" src="js/jquery-1.11.0.min.js"></script>






<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>article-add</title>
<style type="">
.h2_ch a:hover, .h2_ch a.here {
    color: #FFF;
    font-weight: bold;
    background-position: 0px -32px;
}
.h2_ch a {
    float: left;
    height: 32px;
    margin-right: -1px;
    padding: 0px 16px;
    line-height: 32px;
    font-size: 14px;
    font-weight: normal;
    border: 1px solid #C5C5C5;
    background: url('../res/lecheng/img/admin/bg_ch.gif') repeat-x scroll 0% 0% transparent;
}
a {
    color: #06C;
    text-decoration: none;
}
</style>


<script type="text/javascript">
	//标题不能为空  不能全是空格
	var CHKTITLE="^(?![\\s]+$).+$";
	//内容不能为空  不能全是空格   可以 换行
	var CHKCONTENT="^(?![\\s]+$)[\\s\\S]+$";
	//时间 不能为空 有插件 不用判断格式
	var CHKCRTIME="^.+$";
	//作者不能为空  不能全是空格
	var CHKAUTHOR="^(?![\\s]+$).+$";
	//汉字             笔名                英文名xxx·xxx·xx ^[a-zA-Z]+(·[a-zA-Z]+)*$
	//var CHKAUTHOR="^([u4e00-u9fa5]|\\w)+$";
	/* //提交条件  默认不可提交
	var submitTitle=false;
	var submitContent=false;
	var submitCrtime=false; */
	
	//jquery
	//验证标题
	function chkTitle(){
		//获得栏目名
		var title=$("#title").val();
		//设置正则
		var reg=new RegExp(CHKTITLE);
		if(reg.test(title)){//输入正确
			$("#resultTitle").html("✔");
			$("#resultTitle").css("color","green");
			//submitTitle=true;
			//返回true
			return true;
		}else{//输入错误
			$("#resultTitle").html("标题不能为空，不能全是空格");
			$("#resultTitle").css("color","red");
			//重新聚焦
			$("#title").focus();
			//submitTitle=false;
			//返回false
			return false;
		}
	}
	
	//验证内容
	function chkContent(){
		//获得内容
		var content=$("#content").val();
		//设置正则
		var reg=new RegExp(CHKCONTENT);
		if(reg.test(content)){//输入正确
			$("#resultContent").html("✔");
			$("#resultContent").css("color","green");
			//submitContent=true;
			//返回true
			return true;
		}else{//输入错误
			$("#resultContent").html("内容不能为空，不能全是空格");
			$("#resultContent").css("color","red");
			//重新聚焦
			$("#content").focus();
			//submitContent=false;
			//返回false
			return false;
		}
	}
	
	//验证日期
	function chkCrtime(){
		//获得日期
		var crtime=$("#crtime").val();
		//设置正则
		var reg=new RegExp(CHKCRTIME);
		if(reg.test(crtime)){//输入正确
			$("#resultCrtime").html("✔");
			$("#resultCrtime").css("color","green");
			//submitCrtime=true;
			//返回true
			return true;
		}else{//输入错误
			$("#resultCrtime").html("日期不能为空");
			$("#resultCrtime").css("color","red");
			//重新聚焦
			$("#crtime").focus();
			//submitCrtime=false;
			//返回false
			return false;
		}
	}
	
	//验证作者
	function chkAuthor(){
		//获得作者
		var author=$("#author").val();
		//设置正则
		var reg=new RegExp(CHKAUTHOR);
		if(reg.test(author)){//输入正确
			$("#resultAuthor").html("✔");
			$("#resultAuthor").css("color","green");
			//submitTitle=true;
			//返回true
			return true;
		}else{//输入错误
			$("#resultAuthor").html("作者不能为空，不能全是空格");
			$("#resultAuthor").css("color","red");
			//重新聚焦
			$("#author").focus();
			//submitTitle=false;
			//返回false
			return false;
		}
	}
	
	
	/* //验证标题
	function chkTitle(){
		//获得栏目名
		var titleEle=document.getElementById("title");
		var title=titleEle.value;
		//设置正则
		var reg=new RegExp(CHKTITLE);
		//获取显示标题是否输入正确的元素对象
		var spanEle=document.getElementById("resultTitle");
		if(reg.test(title)){//输入正确
			spanEle.innerHTML="✔";
			spanEle.style.color="green";
			//submitTitle=true;
			//返回true
			return true;
		}else{//输入错误
			spanEle.innerHTML="标题不能为空，不能全是空格";
			spanEle.style.color="red";
			//重新聚焦
			titleEle.focus();
			//submitTitle=false;
			//返回false
			return false;
		}
	}
	
	//验证内容
	function chkContent(){
		//获得内容
		var conEle=document.getElementById("content");
		var content=conEle.value;
		//设置正则
		var reg=new RegExp(CHKCONTENT);
		//获取显示内容是否输入正确的元素对象
		var spanEle=document.getElementById("resultContent");
		if(reg.test(content)){//输入正确
			spanEle.innerHTML="✔";
			spanEle.style.color="green";
			//submitContent=true;
			//返回true
			return true;
		}else{//输入错误
			spanEle.innerHTML="内容不能为空，不能全是空格";
			spanEle.style.color="red";
			//重新聚焦
			conEle.focus();
			//submitContent=false;
			//返回false
			return false;
		}
	}
	
	//验证日期
	function chkCrtime(){
		//获得日期
		var crtimeEle=document.getElementById("crtime");
		var crtime=crtimeEle.value;
		//设置正则
		var reg=new RegExp(CHKCRTIME);
		//获取显示日期是否输入正确的元素对象
		var spanEle=document.getElementById("resultCrtime");
		if(reg.test(crtime)){//输入正确
			spanEle.innerHTML="✔";
			spanEle.style.color="green";
			//submitCrtime=true;
			//返回true
			return true;
		}else{//输入错误
			spanEle.innerHTML="日期不能为空";
			spanEle.style.color="red";
			//重新聚焦
			crtimeEle.focus();
			//submitCrtime=false;
			//返回false
			return false;
		}
	}
	
	//验证作者
	function chkAuthor(){
		//获得作者
		var authorEle=document.getElementById("author");
		var author=authorEle.value;
		//设置正则
		var reg=new RegExp(CHKAUTHOR);
		//获取显示作者是否输入正确的元素对象
		var spanEle=document.getElementById("resultAuthor");
		if(reg.test(author)){//输入正确
			spanEle.innerHTML="✔";
			spanEle.style.color="green";
			//submitTitle=true;
			//返回true
			return true;
		}else{//输入错误
			spanEle.innerHTML="作者不能为空，不能全是空格";
			spanEle.style.color="red";
			//重新聚焦
			authorEle.focus();
			//submitTitle=false;
			//返回false
			return false;
		}
	} */
	
	/* //判断是否能提交   在提交时一起判断
	function chkAll(){
		return chkTitle()&&chkContent()&&chkCrtime()&&chkAuthor();
	}
	 */
</script>


</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 文章管理 - 添加</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='javascript:window.history.back()';" value="返回列表" class="return-button"/>
	</form>											<!--http://localhost:8080/ZSCMS/articlelist.do  -->
	<div class="clear"></div>
</div>

<div class="body-box" style="float:right">
	<form id="jvForm" action="add.do" method="post" onsubmit="<!-- return chkAll() -->" >
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody id="tab_1">
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						文章标题:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="title" id="title" maxlength="100" size="100"/>
					<span id="resultTitle"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						
						文章内容:</td><td width="80%" class="pn-fcontent">
						<textarea name="content" id="content" rows="30" cols="100"></textarea>
					<span id="resultContent"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						
						作者:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="author" id="author" maxlength="100" size="30"/>
					<span id="resultAuthor"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						添加日期:</td><td width="80%" class="pn-fcontent">
						<input type="text"  name="crtime"  id="crtime" maxlength="80"   class="Wdate" onclick="WdatePicker()" readonly="readonly"/>
					<span id="resultCrtime"></span>
					</td>
				</tr>
				<tr>
					
					<td width="20%" class="pn-flabel pn-flabel-h">
						
						所属栏目:</td><td width="80%" class="pn-fcontent">
						<select name="channel.id">
							<c:forEach items="${channels }" var="channel">
								<option value="${channel.id }">${channel.cname }</option>
							</c:forEach>
									
											
						</select>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						是否推荐:</td><td width="80%" class="pn-fcontent">
						<input type="radio" name="isremod" value="1" checked="checked"/>推荐
						<input type="radio" name="isremod" value="-1"/>非推荐
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						是否热点:</td><td width="80%" class="pn-fcontent">
						<input type="radio" name="ishot" value="1" checked="checked"/>热点
						<input type="radio" name="ishot" value="-1"/>非热点
					</td>
				</tr>
				
			</tbody>
			<tbody id="tab_2" style="display: none">
				<tr>
					<td >
						<textarea rows="10" cols="10" id="productdesc" name="description"></textarea>
					</td>
				</tr>
			</tbody>
			<tbody id="tab_3" style="display: none">
				<tr>
					<td >
						<textarea rows="15" cols="136" id="productList" name="packageList"></textarea>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="pn-fbutton" colspan="2">
						<input type="submit" class="submit" value="提交"/> &nbsp; <input type="reset" class="reset" value="重置"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>