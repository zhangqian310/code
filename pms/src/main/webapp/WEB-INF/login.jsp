<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户登录</title>
</head>

<body>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #1D3647;
}
-->
</style>
<script type="text/javascript">
	//刷新验证码
	function getCode(){
		//获取验证码元素
		var imgObj=document.getElementById("kaptchaImg");
		imgObj.src="kaptcha.jsp?t="+Math.random()*1000;
	}
</script>

<link href="images/skin.css" rel="stylesheet" type="text/css">
<body>

<form action="login.do"  method="post"  onSubmit="return chkSubmit()" name="fm">
<table width="100%" height="166" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="42" valign="top"><table width="100%" height="42" border="0" cellpadding="0" cellspacing="0" class="login_top_bg">
      <tr>
        <td width="1%" height="21">&nbsp;</td>
        <td height="42">&nbsp;</td>
        <td width="17%">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg">
      <tr>
        <td width="49%" align="right"><table width="91%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg2">
            <tr>
              <td height="138" valign="top"><table width="89%" height="427" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="149">&nbsp;</td>
                </tr>
                <tr >
                  <td  height="80" align="center" valign="top" >
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <img src="images/logo4.png" ></td>
                </tr>
                <tr>
                  <td height="198" align="right" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="35%">&nbsp;</td>
                      <td height="25" colspan="2" class="left_txt"><p>1- 地区商家信息网门户站建立的首选方案...</p></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td height="25" colspan="2" class="left_txt"><p>2- 一站通式的整合方式，方便用户使用...</p></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td height="25" colspan="2" class="left_txt"><p>3- 强大的后台系统，管理内容易如反掌...</p></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td width="30%" height="40"><img src="images/icon-demo.gif" width="16" height="16"><a href="http://www.865171.cn" target="_blank" class="left_txt3"> 使用说明</a> </td>
                      <td width="35%"><img src="images/icon-login-seaver.gif" width="16" height="16"><a href="http://www.865171.cn" class="left_txt3"> 在线客服</a></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
            </tr>
            
        </table></td>
        <td width="1%" >&nbsp;</td>
        <td width="50%" valign="bottom"><table width="100%" height="59" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="4%">&nbsp;</td>
              <td width="96%" height="38"><span class="login_txt_bt">登录中仕学社后台管理系统</span></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td height="21"><table cellSpacing="0" cellPadding="0" width="100%" border="0" id="table211" height="328">
                  <tr>
                    <td height="164" colspan="2" align="middle"><form name="myform" action="main.html" method="get">
                        <table cellSpacing="0" cellPadding="0" width="100%" border="0" height="143" id="table212">
                       	  <tr>
                            <td width="13%" height="38" class="top_hui_text"></td>
                            <td height="38" colspan="2" class="top_hui_text"><span class="login_txt" style="color: red">${msg }</span></td>
                          </tr>
                          <tr>
                           
                            <td width="13%" height="38" class="top_hui_text"><span class="login_txt">用户名：&nbsp;&nbsp; </span></td>
                            <td height="38" colspan="2" class="top_hui_text"><input name="loginname" class="editbox4"  size="20" value="${cookie.loginname.value }">                            </td>
                          </tr>
                          <tr>
                            <td width="13%" height="35" class="top_hui_text"><span class="login_txt"> 密 码： &nbsp;&nbsp; </span></td>
                            <td height="35" colspan="2" class="top_hui_text"><input class="editbox4" type="password" size="20" name="password"  value="${cookie.password.value }"/>
                              <img src="images/luck.gif" width="19" height="18"> </td>
                          </tr>
                            <tr>
                            <td width="13%" height="35" class="top_hui_text"><span class="login_txt"> 验证码： &nbsp;&nbsp; </span></td>
                            <td height="35" colspan="2" class="top_hui_text"><input class="editbox4"   type="text" size="20" name="chkcode">
                            <img id="kaptchaImg" src="kaptcha.jsp" onclick="getCode()" /><span id="resuImg"></span></td>
                          </tr>
                         
                         
                          <tr>
                            <td height="35" >&nbsp;</td>
                            <td width="20%" height="35" ><input name="Submit" type="submit" class="button" id="Submit" value="登 录"> </td>
                            <td width="67%" class="top_hui_text"><input name="cs" type="button" class="button" id="cs" value="取 消"></td>
                          </tr>
                           <tr>
                            
                            	<td  colspan="3" height="35" class="top_hui_text"><span class="login_txt"><input type="checkbox" name="rem" value="1" />记住用户名和密码</span></td>
                            
                           
                          	
                          </tr>
                          
                          
                        </table>
                        <br>
                    </form></td>
                  </tr>
                  <tr>
                    <td width="433" height="164" align="right" valign="bottom"><img src="images/login-wel.gif" width="242" height="138"></td>
                    <td width="57" align="right" valign="bottom">&nbsp;</td>
                  </tr>
              </table></td>
            </tr>
          </table>
          </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="20"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="login-buttom-bg">
      <tr>
        <td align="center"><span class="login-buttom-txt">Copyright &copy; 2016 www.lechenggu.com</span></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>