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
<title>user-update</title>
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
	//用户名 必须包含字母  不能全是数字  6-16位
	var CHKLOGINNAME="^(?![0-9]+$)[a-zA-Z0-9]{6,16}$";
	//密码  必须包含字母和数字  不能全是数字 不能全是字母  6-16位
	var CHKPASSWORD="^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,}$";
	//出生日期
	var CHKBIRTHDAY="^[0-9]{4}-(0?[1-9]|1[0-2])-(0?[1-9]|[1-2][0-9]|3[0-1])$";
	//邮箱
	var CKHEMAIL="^[a-zA-Z0-9_]+@[a-z0-9]{2,5}(\\.[a-z]{2,3}){1,2}$";
	//真实姓名 2个以上汉子
	var CHKRELNAME="^[\u4e00-\u9fa5]{2,}$";
	
	
	//jquery
	//验证用户名
	function chkLoginname(){
		//获取用户名的value值
		var loginname=$("#loginname").val();
		//定义匹配用户名的正则表达式
		var reg=new RegExp(CHKLOGINNAME);
		if(reg.test(loginname)){//输入正确
			$("#resultName").html("✔");
			$("#resultName").css("color","green");
			//返回true
			return true;
		}else{//输入错误
			$("#resultName").html("用户名必须包含字母和数字，且不能低于6位");
			$("#resultName").css("color","red");
			//清空文本框
			$("#loginname").val("");
			//重新聚焦
			$("#loginname").focus();
			//返回false
			return false;
		}
	}
	
	//验证密码
	function chkPassword(){
		//获取密码
		var password=$("#password").val();
		//定义匹配密码的正则表达式
		var reg=new RegExp(CHKPASSWORD);
		if(reg.test(password)){//输入正确
			$("#resultPassword").html("✔");
			$("#resultPassword").css("color","green");
			//返回true
			return true;
		}else{//输入错误
			$("#resultPassword").html("密码必须包含字母和数字，且不能低于6位");
			$("#resultPassword").css("color","red");
			//清空文本框
			$("#password").val("");
			//重新聚焦
			$("#password").focus();
			//返回false
			return false;
		}
	}
	
	//验证两次密码是否一致
	function chkRePwd(){
		//获取密码
		var password=$("#password").val();
		//获取确认密码
		var repw=$("#pw").val();
		if(repw==password){
			$("#resultPw").html("✔");
			$("#resultPw").css("color","green");
			return true;
		}else{
			$("#resultPw").html("两次密码不一致");
			$("#resultPw").css("color","red");
			return false;
		}
		
	}

	//验证邮箱
	function chkEmail(){
		//获取邮箱
		var email=$("#email").val();
		//定义匹配邮箱的正则表达式
		var reg=new RegExp(CKHEMAIL);
		if(reg.test(email)){//输入正确
			$("#resultEmail").html("✔");
			$("#resultEmail").css("color","green");
			//返回true
			return true;
		}else{//输入错误
			$("#resultEmail").html("邮箱不符合规则:xxx@xxx.com(.cn)");
			$("#resultEmail").css("color","red");
			//清空文本框
			$("#email").val("");
			//重新聚焦
			$("#email").focus();
			//返回false
			return false;
		}
	}
	
	//验证真实姓名
	function chkRelname(){
		//获取真实姓名
		var relname=$("#relname").val();
		//定义匹配真实姓名的正则表达式
		var reg=new RegExp(CHKRELNAME);
		if(reg.test(relname)){//输入正确
			$("#resultRelname").html("✔");
			$("#resultRelname").css("color","green");
			//返回true
			return true;
		}else{//输入错误
			$("#resultRelname").html("姓名只能输入2个或2个以上汉字");
			$("#resultRelname").css("color","red");
			//清空文本框
			$("#relname").val("");
			//重新聚焦
			$("#relname").focus();
			//返回false
			return false;
		}
	}
	
	//验证出生日期
	function chkBirthday(){
		//获取出生日期
		var birthday=$("#birthday").val();
		//定义匹配出生日期的正则表达式
		var reg=new RegExp(CHKBIRTHDAY);
		if(reg.test(birthday)){//输入正确
			$("#resultBirthday").html("✔");
			$("#resultBirthday").css("color","green");
			//返回true
			return true;
		}else{//输入错误
			$("#resultBirthday").html("出生日期不能为空");
			$("#resultBirthday").css("color","red");
			//清空文本框
			$("#birthday").val("");
			//重新聚焦
			$("#birthday").focus();
			//返回false
			return false;
		}
	}
	
	/* 
	//验证用户名
	function chkLoginname(){
		//获取用户名
		var lgEle=document.getElementById("loginname");
		var loginname=lgEle.value;
		//定义匹配用户名的正则表达式
		var reg=new RegExp(CHKLOGINNAME);
		//获取显示用户名是否输入正确的元素对象
		var spanEle=document.getElementById("resultName");
		if(reg.test(loginname)){//输入正确
			spanEle.innerHTML="✔";
			spanEle.style.color="green";
			//返回true
			return true;
		}else{//输入错误
			spanEle.innerHTML="用户名必须包含字母和数字，且不能低于6位";
			spanEle.style.color="red";
			//清空文本框
			lgEle.value="";
			//重新聚焦
			lgEle.focus();
			//返回false
			return false;
		}
	}
	
	 //验证密码
	function chkPassword(){
		//获取密码
		var pwEle=document.getElementById("password");
		var password=pwEle.value;
		//定义匹配密码的正则表达式
		var reg=new RegExp(CHKPASSWORD);
		//获取显示密码是否输入正确的元素对象
		var spanEle=document.getElementById("resultPassword");
		if(reg.test(password)){//输入正确
			spanEle.innerHTML="✔";
			spanEle.style.color="green";
			//返回true
			return true;
		}else{//输入错误
			spanEle.innerHTML="密码必须包含字母和数字，且不能低于6位";
			spanEle.style.color="red";
			//清空文本框
			pwEle.value="";
			//重新聚焦
			pwEle.focus();
			//返回false
			return false;
		}
	}
	
	//验证两次密码是否一致
	function chkRePwd(){
		//获取密码
		var pwEle=document.getElementById("password");
		var password=pwEle.value;
		var repw=document.getElementById("pw").value;
		//获取2次密码是否输入成功的元素对象
		var spanEle=document.getElementById("resultPw");
		if(repw==password){
			spanEle.innerHTML="✔";
			spanEle.style.color="green";
			return true;
		}else{
			spanEle.innerHTML="两次密码不一致";
			spanEle.style.color="red";
			return false;
		}
		
	} 
	
	//验证邮箱
	function chkEmail(){
		//获取邮箱
		var emEle=document.getElementById("email");
		var email=emEle.value;
		//定义匹配邮箱的正则表达式
		var reg=new RegExp(CKHEMAIL);
		//获取显示邮箱是否输入正确的元素对象
		var spanEle=document.getElementById("resultEmail");
		if(reg.test(email)){//输入正确
			spanEle.innerHTML="✔";
			spanEle.style.color="green";
			//返回true
			return true;
		}else{//输入错误
			spanEle.innerHTML="邮箱不符合规则:xxx@xxx.com(.cn)";
			spanEle.style.color="red";
			//清空文本框
			emEle.value="";
			//重新聚焦
			emEle.focus();
			//返回false
			return false;
		}
	}
	
	//验证真实姓名
	function chkRelname(){
		//获取真实姓名
		var relEle=document.getElementById("relname");
		var relname=relEle.value;
		//定义匹配真实姓名的正则表达式
		var reg=new RegExp(CHKRELNAME);
		//获取显示真实姓名是否输入正确的元素对象
		var spanEle=document.getElementById("resultRelname");
		if(reg.test(relname)){//输入正确
			spanEle.innerHTML="✔";
			spanEle.style.color="green";
			//返回true
			return true;
		}else{//输入错误
			spanEle.innerHTML="姓名只能输入2个或2个以上汉字";
			spanEle.style.color="red";
			//清空文本框
			relEle.value="";
			//重新聚焦
			relEle.focus();
			//返回false
			return false;
		}
	} */
	
	/* //验证出生日期
	function chkBirthday(){
		//获取出生日期
		var bdEle=document.getElementById("birthday");
		var birthday=bdEle.value;
		//定义匹配出生日期的正则表达式
		var reg=new RegExp(CHKBIRTHDAY);
		//获取显示出生日期是否输入正确的元素对象
		var spanEle=document.getElementById("resultBirthday");
		if(reg.test(birthday)){//输入正确
			spanEle.innerHTML="✔";
			spanEle.style.color="green";
			//返回true
			return true;
		}else{//输入错误
			spanEle.innerHTML="出生日期不能为空";
			spanEle.style.color="red";
			//清空文本框
			bdEle.value="";
			//重新聚焦
			bdEle.focus();
			//返回false
			return false;
		}
	} */
	
	//验证所有
	/* function chkAll(){
		return chkLoginname()&&chkEmail()&&chkRelname()&&chkBirthday();
	} */
	
	

	//ajax二级联动部门
	$(function(){
		$("#dept1").change(function(){
			
			 $.post('getdept.do',{"pid":$("#dept1").val()},function(depts){
				 $("#dept2").html("");/* 清空标签里的内容.empty() */
				$.each(depts,function(index,dept){
					/* 添加标签 */
					$("#dept2").append("<option value='"+dept.id+"'>"+dept.name+"</option>");
				});
				
			},'json'
					
			); 
			
		});
	});
	
	
</script>



</head>
<body>
	
	<img src="../images/logo4.png"width="176" height="54" >
<div class="box-positon">
	<div class="rpos">当前位置: 用户管理 - 修改</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='javascript:window.history.back()';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>

<div class="body-box" style="float:right">
	<form id="jvForm" action="update.do" method="post" onsubmit="return chkAll()" >
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody id="tab_1">
			
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
					</td>
					<td width="80%" class="pn-frequired">
						${msg }
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						登录名:</td><td width="80%" class="pn-fcontent">
							<input type="text" class="required" name="loginname" id="loginname" onblur="chkLoginname()" maxlength="100" size="30" value="${user.loginname }"/>
						<span id="resultName"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						密码:</td><td width="80%" class="pn-fcontent">
						<input type="password" value="${user.password }" class="required" name="password" id="password" onblur="chkPassword()" maxlength="100" size="30"/>
						<span id="resultPassword"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						确认密码:</td><td width="80%" class="pn-fcontent">
						<input type="password" value="${user.password }" class="required" name="pw" id="pw" onblur="chkRePwd()" maxlength="100" size="30"/><span style="color: red">${pwmsg }</span>
						<span id="resultPw"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						真实姓名:</td><td width="80%" class="pn-fcontent">
						<input type="text"  class="required" name="relname" id="relname" onblur="chkRelname()" maxlength="100" size="30" value="${user.relname }"/>
					<span id="resultRelname"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						性别:</td><td width="80%" class="pn-fcontent">
						<c:if test="${user.sex=='男' }">
							<input type="radio" name="sex" value="男" checked="checked"/>男
							<input type="radio" name="sex" value="女"/>女
						</c:if>
						<c:if test="${user.sex!='男' }">
							<input type="radio" name="sex" value="男"/>男
							<input type="radio" name="sex" value="女" checked="checked"/>女
						</c:if>
						
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						出生日期:</td><td width="80%" class="pn-fcontent">
						<input type="text"  name="birthday" id="birthday" onblur="chkBirthday()" maxlength="100" size="30"   class="Wdate" onclick="WdatePicker()" readonly="readonly" value="${user.birthdayTxt }"/>
					<span id="resultBirthday"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						email:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="email" id="email" onblur="chkEmail()" maxlength="100" size="30" value="${user.email }"/>
					<span id="resultEmail"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						部门:</td><td width="80%" class="pn-fcontent">
						<select name="dept1" id="dept1">
							<c:forEach items="${DLIST }" var="dept1">
								<!-- 该用户所在 部门的上级部门id=一级部门id 默认选择 -->
								<c:if test="${user.dept.pid==dept1.id }">
									<option value="${dept1.id }" selected="selected" >${dept1.name }</option>
								</c:if>
								<c:if test="${user.dept.pid!=dept1.id }">
									<option value="${dept1.id }"  >${dept1.name }</option>
								</c:if>
							</c:forEach>
						</select>
						<select name="dept.id" id="dept2">
							<c:forEach items="${DLIST2 }" var="dept2">
								<c:if test="${user.dept.id==dept2.id }">
									<option value="${dept2.id }" selected="selected" name="id">${dept2.name }</option>
								</c:if>
								<c:if test="${user.dept.id!=dept2.id }">
									<option value="${dept2.id }" name="id">${dept2.name }</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<input type="hidden" name="isenabled" value="${user.isenabled }" />
				<input type="hidden" name="id" value="${user.id }" />
				
			<%-- 	<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						是否可用:</td><td width="80%" class="pn-fcontent">
						<c:if test="${user.isenabled==1 }">
							<input type="radio" name="isenabled" value="1" checked="checked"/>可用
							<input type="radio" name="isenabled" value="-1"/>不可用
						</c:if>
						<c:if test="${user.isenabled!=1 }">
							<input type="radio" name="isenabled" value="1"/>可用
							<input type="radio" name="isenabled" value="-1" checked="checked"/>不可用
						</c:if>
					</td>
				</tr> --%>
				 
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