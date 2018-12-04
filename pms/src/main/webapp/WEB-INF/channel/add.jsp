<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

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
<title>channel-add</title>
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
	//栏目名不能为空  不能有空格
	var CHKCNAME="^\\S+$";

	//jquery
	//验证栏目名
	function chkCname(){
		//获得栏目名
		var cname=$("#cname").val();
		//设置正则
		var reg=new RegExp(CHKCNAME);
		if(reg.test(cname)){//输入正确
			if(chkExistCname(cname)){//不重复
				return true;
			}else{//重复
				return false;
			}
		}else{//输入错误
			$("#resultCname").html("栏目名不能为空不能有空格,提交后在判断");
			$("#resultCname").css("color","red");
			//重新聚焦
			$("#cname").focus();
			//返回false
			return false;
		}
	}
	
	//ajax判断栏目名是否存在
	function chkExistCname(cname){
		//默认存在
		var flag=false;
		$.ajax({
			//路径
			url:'chkchannel.do',
			//方式
			type:'post',
			//参数
			data:'cname='+cname,
			//是否异步
			async:false,
			//响应类型
			dataType:'text',
			//响应成功调用回调函数
			success:function(data){
				if(data=='true'){//没有重复
					$("#resultCname").html("✔");
					$("#resultCname").css("color","green");
					flag=true;
				}else{//重复
					$("#resultCname").html("此栏目已存在");
					$("#resultCname").css("color","red");
					flag=false;
				}
			},
			//响应失败调用回调函数
			error:function(){
				alert('请求数据失败。。。');
			}
		});
		return flag;
		
	}
	
	
	/* //验证栏目名
	function chkCname(){
		//获得栏目名
		var cnameEle=document.getElementById("cname");
		var cname=cnameEle.value;
		//设置正则
		var reg=new RegExp(CHKCNAME);
		//获取显示栏目名是否输入正确的元素对象
		var spanEle=document.getElementById("resultCname");
		if(reg.test(cname)){//输入正确
			spanEle.innerHTML="✔";
			spanEle.style.color="green";
			//返回true
			return true;
		}else{//输入错误
			spanEle.innerHTML="栏目名不能为空不能有空格,提交后在判断";
			spanEle.style.color="red";
			//重新聚焦
			cnameEle.focus();
			//返回false
			return false;
		}
	} */
	
</script>

</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 栏目管理 - 添加</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='javascript:window.history.back()';" value="返回列表" class="return-button"/>
	</form>										<!-- http://localhost:8080/ZSCMS/channellist.do -->
	<div class="clear"></div>
</div>

<div class="body-box" style="float:right">
	<form id="jvForm" action="add.do" method="get" onsubmit="return chkCname()">
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody id="tab_1">
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						栏目名称:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="cname" id="cname"  maxlength="100" size="30"/>
					<span id="resultCname"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						
						上级栏目:</td><td width="80%" class="pn-fcontent">
						
						<select name="pChannel.id">
							<option value="0"></option>	
							<c:forEach items="${channels }" var="channel">
								<option value="${channel.id }">${channel.cname }</option>	
							</c:forEach>
								
		
								
						</select>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						
						级别:</td><td width="80%" class="pn-fcontent">
						<select name="lev">
							
								
										<option value="1">1</option>	
								
										<option value="2">2</option>	
								
										<!-- <option value="3">3</option>	
								
										<option value="4">4</option>	
								
										<option value="5">5</option>	
								
										<option value="6">6</option>	
								
										<option value="7">7</option>	
								
										<option value="8">8</option>	 -->
								
						</select>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						是否叶子:</td><td width="80%" class="pn-fcontent">
						<input type="radio" name="isleaf" value="1" checked="checked"/>是
						<input type="radio" name="isleaf" value="-1"/>否
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						
						顺序:</td><td width="80%" class="pn-fcontent">
						<select name="sort">
							
								
										<option value="1">1</option>	
								
										<option value="2">2</option>	
								
										<option value="3">3</option>	
								
										<option value="4">4</option>	
								
										<option value="5">5</option>	
								
										<option value="6">6</option>	
								
										<option value="7">7</option>	
								
										<option value="8">8</option>	
								
						</select>
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