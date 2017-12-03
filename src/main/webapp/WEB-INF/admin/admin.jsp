<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>管理页</title>
<link href="<%=request.getContextPath() %>/zui/css/zui.min.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js"></script>
<script src="<%=request.getContextPath() %>/zui/js/zui.min.js"></script>
<script type="text/javascript">
window.onload=function (){
	go();
	
};
	
function go(){
	var name=document.getElementById("ms").innerText;
    new $.zui.Messager('欢迎回来。'+name, {
       
		type:'success'
    }).show();"src/main/webapp/WEB-INF/admin/admin.jsp"
};
	
</script>
</head>

<body>
	<div style="width=600px; height=400px">
    	<ul class="nav nav-tabs nav-justified">
       	  	<li><a href="#">欢迎管理员&nbsp;&nbsp;&nbsp;<strong id="ms">${user.username}</strong></a></li>
        	<li><a href="<%=request.getContextPath() %>/admin/addbike.do" target="showPage">添加车辆信息</a></li>
            <li><a href="<%=request.getContextPath() %>/admin/alluser.do" target="showPage">所有用户</a></li>
            <li><a href="<%=request.getContextPath() %>/admin/find.do" target="showPage">会员搜索</a></li>
            <li><a href="<%=request.getContextPath() %>/admin/service.do" target="showPage">服务器信息</a></li>
            <li><a href="<%=request.getContextPath() %>/ofo/loginout.do" >退出</a></li>
        </ul>
        <iframe id="showPage" noresize="noresize" name="showPage" width=1370px height=400px
			frameborder=0 scrolling=no src="<%=request.getContextPath() %>/admin/alluser.do"></iframe>
    </div>

</body>
</html>
