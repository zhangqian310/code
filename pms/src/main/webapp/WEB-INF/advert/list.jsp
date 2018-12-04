<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<link href="../res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<!-- <script src="/thirdparty/ckeditor/ckeditor.js" type="text/javascript"></script> -->
<!-- <script src="/thirdparty/My97DatePicker/WdatePicker.js" type="text/javascript"></script> -->
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
<title>广告列表</title>
<meta charset="UTF-8">

<script type="text/javascript">
	//文档加载
	$(function(){
		//当选中表头一行的复选框时 下面的全部选中
		$("#ids").click(function(){
			//if($("#ids").is(":checked")){
				//具有 true 和 false 两个属性的属性，如 checked, selected 或者 disabled 使用prop()，其他的使用 attr()
				$(":checkbox").prop("checked",this.checked);
			//}else{
				//$(":checkbox").attr("checked",false);
			//}	
		});
		
		
	});
	
	//获得选中的复选框的value  
	function getValues(){
		var values="";
		//获取全部选中的并且有value属性的			遍历
		$(":checkbox:checked[value]").each(function(){
									//获得每个复选框的值
			values=values+","+$(this).val();
		});
		values=values.substring(1);
		//	,1,2,3
		return values;
	}
	
</script>

</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 广告管理 - 列表</div>
	<form class="ropt">
		<input class="add" type="button" value="添加" onclick="javascript:window.location.href='toadd.do'"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box">
 
<form action="list.do" method="post" style="padding-top:5px;">
<input type="hidden" value="1" name="pageNo"/>
广告标题: <input type="text" onkeyup="changePageNo()" value="${mohutitle }" name="mohutitle"/>
	
	
	<select onchange="changePageNo()" name="creator">
		<option value="0">请选择公告人</option>
			<c:forEach items="${users }" var="user">
				<c:if test="${creator==user.id }">
					<option value="${user.id }" selected="selected" >${user.relname }</option>
				</c:if>
				<c:if test="${creator!=user.id }">
					<option value="${user.id }"  >${user.relname }</option>
				</c:if>
			</c:forEach>
			
		
	</select>
	 
	 
	<input type="submit" class="query" value="查询"/>
</form>

<form method="post" id="tableForm" action="deletes.do">

<table cellspacing="1" cellpadding="0" width="100%" border="0" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="20"><input type="checkbox" id="ids" /></th>
			<th>广告ID</th>
			<th>标题</th>
			<th>内容</th>
			<th >公告时间</th>
			<th >公告人</th>
			<th >操作选项</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody">
		
		<c:forEach items="${adverts }" var="advert">
			<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
				<td><input type="checkbox" name="ids" value="${advert.id }"/></td>
				<td align="center">${advert.id }</td>
				<td align="center">${advert.title }</td>
				<td align="center">${advert.content }</td>
				<td align="center">${advert.creatimeTxt }</td>
				<td align="center">${advert.user.relname }</td>
				<td align="center">
				<!-- <a href="file:///e:/Bochy/Resource/webfront/paixiewang/paixiewang/detail.html" class="pn-opt">查看</a> |  -->
				<a href="get.do?id=${advert.id }" class="pn-opt">修改</a> | <a href="delete.do?id=${advert.id }" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a> 
				</td>
			</tr>
		</c:forEach>
		
		
		<!-- 
		<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
			<td><input type="checkbox" name="id" value="2"/></td>
			<td></td>
			<td align="center"></td>
			<td align="center"></td>
			<td align="center"></td>
			<td align="center"></td>
			<td align="center">
			<a href="file:///e:/Bochy/Resource/webfront/paixiewang/paixiewang/detail.html" class="pn-opt">查看</a> | <a href="update.jsp" class="pn-opt">修改</a> | <a href="/admin/productDelete.do?ids=297&name=&brandId=&isShow=" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a> 
			</td>
		</tr>
		<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
			<td><input type="checkbox" name="id" value="3"/></td>
			<td></td>
			<td align="center"></td>
			<td align="center"></td>
			<td align="center"></td>
			<td align="center"></td>
			<td align="center">
			<a href="file:///e:/Bochy/Resource/webfront/paixiewang/paixiewang/detail.html" class="pn-opt">查看</a> | <a href="update.jsp" class="pn-opt">修改</a> | <a href="/admin/productDelete.do?ids=297&name=&brandId=&isShow=" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a> 
			</td>
		</tr>
		<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
			<td><input type="checkbox" name="id" value="4"/></td>
			<td></td>
			<td align="center"></td>
			<td align="center"></td>
			<td align="center"></td>
			<td align="center"></td>
			<td align="center">
			<a href="file:///e:/Bochy/Resource/webfront/paixiewang/paixiewang/detail.html" class="pn-opt">查看</a> | <a href="update.jsp" class="pn-opt">修改</a> | <a href="/admin/productDelete.do?ids=297&name=&brandId=&isShow=" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a> 
			</td>
		</tr>
		
		 -->
	
		
		
	</tbody>
</table>
<div class="page pb15">
	<input class="del-button" type="submit" value="删除" onclick="if(!confirm('您确定删除吗？')) {return false;}" />
	
<!-- 	<input class="del-button" type="button" value="删除" onclick="if(!confirm('您确定删除吗？')) {return false;}else{javascript:window.location.href='advertdelete.do?ids='+getValues();}" />
 -->
	<span class="r inb_a page_b">
		
			<a href="list.do?currentPage=1&mohutitle=${mohutitle }&creator=${creator }"><font size=2>首页</font></a>
			
			<c:if test="${requestScope.currentPage>1 }">
				<a href="list.do?currentPage=${requestScope.currentPage-1 }&mohutitle=${mohutitle }&creator=${creator }"><font size=2>上一页</font></a>
			</c:if>
			<c:if test="${requestScope.currentPage<requestScope.pageCount }">
				<a href="list.do?currentPage=${requestScope.currentPage+1 }&mohutitle=${mohutitle }&creator=${creator }"><font size=2>下一页</font></a>
			</c:if>
			
			<a href="list.do?currentPage=${requestScope.pageCount }&mohutitle=${mohutitle }&creator=${creator }"><font size=2>尾页</font></a>
		
			当前<var>${requestScope.currentPage }</var>页共<var>${requestScope.pageCount }</var>页 到第<input type='text' id='PAGENO'  size='3' />页 <input type='button' id='skip' class='hand btn60x20' value='确定' onclick="javascript:window.location.href = 'list.do?&currentPage=' + $('#PAGENO').val() +'&mohutitle=${mohutitle }&creator=${creator }'"/>
			
		
		
	
	</span>
</div>

</form>
</div>
</body>
</html>