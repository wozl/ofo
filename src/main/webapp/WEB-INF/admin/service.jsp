<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>服务器信息</title>
<link href="<%=request.getContextPath() %>/zui/css/zui.min.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js"></script>
<script src="<%=request.getContextPath() %>/zui/js/zui.min.js"></script>
<script type="text/javascript">
	
</script>
</head>

<body>
<div class="alert alert-success"><span class="label label-success">服务器地址</span><b>：<%=request.getLocalAddr() %></b><br></div>
<div class="alert alert-success"><span class="label label-success">服务器名字</span><b>：<%=request.getServerName() %></b><br></div>
<div class="alert alert-success"><span class="label label-success">服务器端口</span><b>：<%=request.getServerPort() %></b><br></div>
<div class="alert alert-success"><span class="label label-danger">管理员用户名</span><b>：${user.username}</b><br></div>
<div class="alert alert-success"><span class="label label-danger">系统总会员数</span><b>：${count}人</b><br></div>
<div class="alert alert-success"><span class="label label-success">客户端的UA</span><b>：<%=request.getHeader("User-agent") %></b><br></div>
<div class="alert alert-success"><span class="label label-success">客户端的地址</span><b>：<%=request.getRemoteHost() %></b><br></div>
<% %>

</body>
</html>