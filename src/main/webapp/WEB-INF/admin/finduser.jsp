<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>搜索用户</title>

<link href="../zui/css/zui.min.css" rel="stylesheet" type="text/css">
<link href="../zui/lib/datatable/zui.datatable.min.css" rel="stylesheet" type="text/css">
<script src="../zui/lib/datatable/zui.datatable.min.js"></script>
<script src="../zui/lib/jquery/jquery.js"></script>
<script src="../zui/js/zui.min.js"></script>
<script type="text/javascript">
	function find(){
		var name=document.getElementById("name").value;
		alert(name);
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/admin/finduser.do',
			data:{"name":name},
			success:function(data){
				for(var i=0;i<data.length;i++){
					$("#findusers").append("<tr>"+"<td>"+data[i].id+"</td>"+"<td>"+data[i].username+"</td>"+"<td>"+data[i].password+"</td>"+"</tr>");
				}
			},
			error:function(){
				
			}
		})
	}

</script>
</head>
	
<body>
	
	<div class="input-group" style="width:230px;">
  		<span class="input-group-addon">用户名</span>
  		<input type="text" class="form-control" placeholder="请输入要查找的用户名" id="name"  name="name">
		</div>
        <button class="btn btn-primary" type="button" onclick="find();" >开始查找</button>
        
        <table class="table datatable">
    		<tbody>
        		<tr>
            		<th>用户ID</th>
                	<th>用户昵称</th>
                	<th>用户密码</th>
            	</tr>
       		</tbody>
       		<tbody id="findusers">
       		
       		</tbody>
    </table>
	

</body>
</html>
