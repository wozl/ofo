<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>欢迎使用：</title>
<link href="<%=request.getContextPath() %>/zui/css/zui.min.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/zui/lib/datatable/zui.datatable.min.css"></head>
<script src="<%=request.getContextPath() %>/js/jquery-3.1.1.min.js"></script>
<script src="<%=request.getContextPath() %>/zui/lib/datatable/zui.datatable.min.js"></script>
<script src="<%=request.getContextPath() %>/zui/js/zui.min.js"></script>
<script type="text/javascript">
window.onload=function (){
	go();
	
};

function go(){
	var name=document.getElementById("ms").innerText;
    new $.zui.Messager('欢迎回来。'+name, {
       
		type:'success'
    }).show();
   
};

 
</script>
</head>

<body>
	<p><strong>欢迎您：<span id="ms">${user.username}</span></strong>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath() %>/ofo/loginout.do">退出</a></p>
    <br>
    <br>
    <ul class="nav nav-tabs nav-justified">
        	<li><a href="<%=request.getContextPath() %>/ofo/sel.do" target="showPage">车辆信息查询</a></li>
            <li><a href="<%=request.getContextPath() %>/ofo/addbike.do" target="showPage">添加车辆信息</a></li>
        </ul>
        
        <iframe id="showPage" noresize="noresize" name="showPage" width=1370px height=400px
			frameborder=0 scrolling=no src="<%=request.getContextPath() %>/ofo/sel.do"></iframe>
</body>

</html>
