<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>注销成功</title>
<link href="<%=request.getContextPath() %>/zui/css/zui.min.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js"></script>
<script src="<%=request.getContextPath() %>/zui/js/zui.min.js"></script>
<script type="text/javascript">
	     var secs = 5; //倒计时的秒数 
		 var URL ;
	function Load(url){
		URL = url;
	for(var i=secs;i>=0;i--) 
	{ 
  	 window.setTimeout('doUpdate(' + i + ')', (secs-i) * 1000); 
		} 
	}
	function doUpdate(num) 
	{ 
		document.getElementById('second').innerHTML = '将在'+num+'秒后自动跳转到主页' ;
	if(num == 0) { window.location = URL; }
	}
</script>
</head>

<body onload="Load('<%=request.getContextPath() %>/ofo/wel.do')">
	<strong>注销成功!</strong><span id="second"></span><strong>秒后为您跳转到登录页面！</strong>
   
</body>
</html>
