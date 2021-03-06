<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



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
<title>advert-update</title>
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
	//提交条件  默认可提交
	var submitTitle=true;
	var submitContent=true;
	var submitCrtime=true;
	
	
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
			submitTitle=true;
			//返回true
			return true;
		}else{//输入错误
			$("#resultTitle").html("标题不能为空，不能全是空格");
			$("#resultTitle").css("color","red");
			//重新聚焦
			$("#title").focus();
			submitTitle=false;
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
			submitContent=true;
			//返回true
			return true;
		}else{//输入错误
			$("#resultContent").html("内容不能为空，不能全是空格,可以换行");
			$("#resultContent").css("color","red");
			//重新聚焦
			$("#content").focus();
			submitContent=false;
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
			submitCrtime=true;
			//返回true
			return true;
		}else{//输入错误
			$("#resultCrtime").html("日期不能为空");
			$("#resultCrtime").css("color","red");
			//重新聚焦
			$("#crtime").focus();
			submitCrtime=false;
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
			submitTitle=true;
			//返回true
			return true;
		}else{//输入错误
			spanEle.innerHTML="标题不能为空，不能全是空格";
			spanEle.style.color="red";
			//重新聚焦
			titleEle.focus();
			submitTitle=false;
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
			submitContent=true;
			//返回true
			return true;
		}else{//输入错误
			spanEle.innerHTML="内容不能为空，不能全是空格";
			spanEle.style.color="red";
			//重新聚焦
			conEle.focus();
			submitContent=false;
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
			submitCrtime=true;
			//返回true
			return true;
		}else{//输入错误
			spanEle.innerHTML="日期不能为空";
			spanEle.style.color="red";
			//重新聚焦
			crtimeEle.focus();
			submitCrtime=false;
			//返回false
			return false;
		}
	} */
	
	//判断是否能提交
	function chkAll(){
		return submitTitle&&submitContent&&submitCrtime;
	}
	
</script>

</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 广告管理 - 修改</div>
	<form class="ropt">									<!-- 根据历史记录返回    -->
		<input type="submit" onclick="this.form.action='javascript:window.history.back()';" value="返回列表" class="return-button"/>
								<!--  "this.form.action='http://localhost:8080/ZSCMS/advertlist.do'"  -->
	</form>
	<div class="clear"></div>
</div>

<div class="body-box" style="float:right">
	<form id="jvForm" action="update.do?id=${advert.id }" method="post" onsubmit="return chkAll()" >
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody id="tab_1">
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						广告标题:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="title" id="title" onblur="chkTitle()" maxlength="100" size="100" value="${advert.title }"/>
					<span id="resultTitle"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						
						广告内容:</td><td width="80%" class="pn-fcontent">
						<textarea name="content" id="content" onblur="chkContent()" rows="30" cols="100"  >${advert.content }</textarea>
					<span id="resultContent"></span>
					</td>
				</tr>
				<%-- <tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						公告时间:</td><td width="80%" class="pn-fcontent">
						<input type="text"  name="crtime" id="crtime" onblur="chkCrtime()" maxlength="80"   class="Wdate" onclick="WdatePicker()" readonly="readonly" value="${advert.crtime }"/>
					<span id="resultCrtime"></span>
					</td>
				</tr> --%>
				<!-- 
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						
						公告人:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="crman" maxlength="100" size="30"/>
					</td>
				</tr>
				 -->
				
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
						<input type="submit" class="submit" onclick="if(!confirm('您确定修改吗？')) {return false;}" value="提交"/> &nbsp; <input type="reset" class="reset" value="重置"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>