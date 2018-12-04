<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt"  prefix="c"%>

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
<title>文章列表</title>
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
	<div class="rpos">当前位置: 文章管理 - 列表</div>
	<form class="ropt">
		<input class="add" type="button" value="添加" onclick="javascript:window.location.href='toadd.do'"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box">

<form action="list.do" method="post" style="padding-top:5px;">
<input type="hidden" value="1" name="pageNo"/>
文章标题: <input type="text" onkeyup="changePageNo()" value="${mohutitle }" name="mohutitle"/>
	 
	<select onchange="changePageNo()" name="channel">
		<option value="0">请选择所属栏目</option>
			<c:forEach items="${channels }" var="channels">
				<c:if test="${channel==channels.id }">
					<option value="${channels.id }" selected="selected" >${channels.cname }</option>
				</c:if>
				<c:if test="${channel!=channels.id }">
					<option value="${channels.id }" >${channels.cname }</option>
				</c:if>
			</c:forEach>
	</select>
	
	<!-- <select onchange="changePageNo()" name="author">
		<option value="">请选择作者</option>
			<option value="1" >1</option>
			<option value="2" >2</option>
			<option value="3" >3</option>
	</select> -->
	<select onchange="changePageNo()" name="isremod">
		<c:if test="${isremod==0 }">
			<option value="0" selected="selected">是否推荐</option>
			<option  value="1" >推荐</option>
			<option   value="-1">非推荐</option>
		</c:if>
		<c:if test="${isremod==1 }">
			<option value="0">是否推荐</option>
			<option  value="1" selected="selected">推荐</option>
			<option   value="-1">非推荐</option>
		</c:if>
		<c:if test="${isremod==-1 }">
			<option value="0">是否推荐</option>
			<option  value="1" >推荐</option>
			<option   value="-1" selected="selected">非推荐</option>
		</c:if>
	</select>
	<select onchange="changePageNo()" name="ishot">
		<c:if test="${ishot==0 }">
			<option value="0" selected="selected">是否热点</option>
			<option  value="1">热点</option>
			<option   value="-1">非热点</option>
		</c:if>
		<c:if test="${ishot==1 }">
			<option value="0">是否热点</option>
			<option  value="1" selected="selected">热点</option>
			<option   value="-1">非热点</option>
		</c:if>
		<c:if test="${ishot==-1 }">
			<option value="0">是否热点</option>
			<option  value="1">热点</option>
			<option   value="-1" selected="selected">非热点</option>
		</c:if>
		
	</select>
	
	<input type="submit" class="query" value="查询"/>
</form>


<form method="post" id="tableForm" action="deletes.do">

<table cellspacing="1" cellpadding="0" width="100%" border="0" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="20"><input type="checkbox" id="ids" /></th>
			<th>文章ID</th>
			<th>标题</th>
			<th>内容</th>
			<th >作者</th>
			<th >添加日期</th>
			<th >所属栏目</th>
			<th >是否推荐</th>
			<th >是否热点</th>
			<th >操作选项</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody">
		
		
		<c:forEach items="${articles }" var="artilce">
			<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
				<td><input type="checkbox" name="ids" value="${artilce.id }"/></td>
				<td align="center">${artilce.id }</td>
				<td align="center">${artilce.title }</td>
				<td align="center">${artilce.content }</td>
				<td align="center">${artilce.author }</td>
				<td align="center">${artilce.crtimeTxt }</td>
				<td align="center">${artilce.channel.cname }</td>
				<td align="center">${artilce.remod }</td>
				<td align="center">${artilce.hot }</td>
				<td align="center">
				<!-- <a href="file:///e:/Bochy/Resource/webfront/paixiewang/paixiewang/detail.html" class="pn-opt">查看</a> |  -->
				<a href="get.do?id=${artilce.id }" class="pn-opt">修改</a> | <a href="delete.do?id=${artilce.id }" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a> 
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

<!-- 	<input class="del-button" type="button" value="删除" onclick="if(!confirm('您确定删除吗？')) {return false;}else{javascript:window.location.href='articledelete.do?ids='+getValues();}" />
 -->

	<span class="r inb_a page_b">
		
			
			<a href="list.do?currentPage=1&mohutitle=${mohutitle }&channel=${channel }&isremod=${isremod}&ishot=${ishot}"><font size=2>首页</font></a>
			
			<c:if test="${requestScope.currentPage>1 }">
				<a href="list.do?currentPage=${requestScope.currentPage-1 }&mohutitle=${mohutitle }&channel=${channel }&isremod=${isremod}&ishot=${ishot}"><font size=2>上一页</font></a>
			</c:if>
			<c:if test="${requestScope.currentPage<requestScope.pageCount }">
				<a href="list.do?currentPage=${requestScope.currentPage+1 }&mohutitle=${mohutitle }&channel=${channel }&isremod=${isremod}&ishot=${ishot}"><font size=2>下一页</font></a>
			</c:if>
			
			<a href="list.do?currentPage=${requestScope.pageCount }&mohutitle=${mohutitle }&channel=${channel }&isremod=${isremod}&ishot=${ishot}"><font size=2>尾页</font></a>
		
			当前<var>${requestScope.currentPage }</var>页共<var>${requestScope.pageCount }</var>页 到第<input type='text' id='PAGENO'  size='3' />页 <input type='button' id='skip' class='hand btn60x20' value='确定' onclick="javascript:window.location.href = 'list.do?&currentPage=' + $('#PAGENO').val() +'&mohutitle=${mohutitle }&channel=${channel }&isremod=${isremod}&ishot=${ishot}'"/>
			
		
	
	</span>
</div>

</form>
</div>
</body>
</html>