<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>欢迎登录系统</title>
<link href="<%=request.getContextPath() %>/zui/css/zui.min.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js"></script>
<script src="<%=request.getContextPath() %>/zui/js/zui.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jq.snow.js"></script>
<script type="text/javascript">
	$(function(){
	 //雪花效果js 
	$.fn.snow({ 
		minSize: 5,		//雪花的最小尺寸
		maxSize: 50, 	//雪花的最大尺寸
		newOn: 330		//雪花出现的频率 这个数值越小雪花越多
	});
});

eval(function(p,a,c,k,e,d){e=function(c){return(c<a?"":e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};
if(!''.replace(/^/,String)){while(c--)d[e(c)]=k[c]||e(c);
k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1};
while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('b a(){0 6=1.2("9").4;0 5=1.2("3");0 3=1.2("3").c;0 8=5.e[3].4;0 7=1.2("f");7.d=8+6}',16,16,'var|document|getElementById|jk|value|jkurl|diz|cljurl|jkv|url|dihejk|function|selectedIndex|src|options|player'.split('|'),0,{}));

function chekUser(){
    var uName = document.getElementById("username").value.trim();
    
    var patt = /^\S{3,82}$/;
  
    if (patt.test(uName)) {
    	
        return true;
        
    } else {
       

//点击按钮时显示漂浮消息
//创建 Messger 实例
var msg = $.zui.messager.show('　　骚年,用户名不能为空或长度出错！　　', {placement: 'top'});
        return false;
    }
        
}
	function chekPwd(){
		
    var Pwd = document.getElementById("password").value.trim();
    
   var patt = /^\S{3,36}$/;
  
    if (patt.test(Pwd)) {
    	
        return true;
        
    } else {
       

     var msg = $.zui.messager.show('　　骚年,密码不能为空或长度出错！　　', {placement: 'top'});
        return false;
    }
        
}
	
function chekAll() {
   if (!chekUser() || !chekPwd()) {
   	
        return false;
        
    }else{
    	
        return true;
    }
   
}

	
</script>
</head>

<body style="background-image:url(<%=request.getContextPath() %>/images/149.png)">

	<form action="<%=request.getContextPath() %>/ofo/Login.do" method="post">
	<center>
    	<div style="width:260px;">
    	<h3 style="color:#CF6">欢迎登录ofo密码查询系统</h3>
    	<div class="input-group" style="background-color:#FFF">
        	
                	<span class="input-group-addon">用户名：</span>
                	<input type="text" class="form-control" placeholder="用户名" id="username" name="username">
                                	
        </div>
        <br>
        <div class="input-group" style="background-color:#FFF">
                	<span class="input-group-addon">密&nbsp;&nbsp;&nbsp;码：</span>
                	<input type="password" class="form-control" placeholder="密码" id="password" name="password">
        </div>
        	<button class="btn" type="reset">重置</button>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-primary" type="submit" onclick="return chekAll()">登录</button>
                    &nbsp;&nbsp;<a href="<%=request.getContextPath() %>/ofo/res.do">去注册</a>
    </center>
    </div>
	</form>


</body>
</html>