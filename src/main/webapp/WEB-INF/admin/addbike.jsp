<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>车辆信息</title>
<link href="<%=request.getContextPath() %>/zui/css/zui.min.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js"></script>
<script src="<%=request.getContextPath() %>/zui/js/zui.min.js"></script>
<script type="text/javascript">
window.onload=function (){
	getProvince();
	
};
/*加载省下拉*/	
function getProvince(){
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/ofo/getProvince.do',
			success: function(data){
				 for (var i = 0; i < data.length; i++) {  
	                    $('#Province').append("<option value='" + data[i].id + "' >" + data[i].name + "</option>");  
	                } 
			},
			error:function(){
				alert("拉取省份信息失败！");
			}
		});
	}
 

 /*加载市下拉选*/ 
 
 function getCity() {  
 	var id=$("#Province").val();
 	$("#city").empty();
 	$.ajax({
 		type:'post',
 		url:'${pageContext.request.contextPath}/ofo/getCity.do',
 		data: {"id":id},
 		success: function(data){
 			$('#city').append("<option value='' selected='selected' >" + '请选择' + "</option>"); 
 			 for (var i = 0; i < data.length; i++) {  
                 $('#city').append("<option value='" + data[i].id + "' >" + data[i].name + "</option>");  
             } 
 		},
 		error:function(){
 			alert("拉取市区信息失败！");
 		}
 	});
 	}
		
 	function add(){
 		var cityid=$("#city").val();
 		//alert(cityid);
 		var bikeno=document.getElementById("bikesno").value;
 		var password=document.getElementById("bikespassword").value;
 		var id=null;
 		if((!isNaN(bikeno)&&bikeno.length<=7)&&(!isNaN(password)&&bikeno.length<=4)){
 		$.ajax({
 			type:'post',
 			url:'${pageContext.request.contextPath}/admin/addbikes.do',
 			data:{"id":id,"bikeno":bikeno,"password":password,"cityid":cityid},
 			success:function(data){
 				alert("添加成功!");
 				window.location.assign("/ofo/admin/addbike.do");
 			},
 			error:function(){
 				alert("添加失败!");
 			}
 		});
 		}else{
 			alert("输入参数不合法！原因：\n输入的不是数字或者输入的数字超过了长度。\n车牌号为6位数字，密码为4位数字");
 		}
 	}
 
 
 	
 
</script>
</head>

<body>
	
	<div style="width:1100px;">
   	 <br>
    <br>
    <button class="btn btn-primary" type="button" >请选择：</button></div>  
  <div class="input-group" style="position:absolute;left:80px;top:40px;">
 
      <select class="form-control" id="Province" name="Province" onchange="getCity();" >
        <option>省份</option>
      </select> 
  </div>
    
   <div class="input-group" style="position:absolute;left:250px;top:40px;">
      <select class="form-control" name="city" id="city" >
        <option>市/县</option>
      </select> 
   </div>
    	
       		<div class="input-group">
 				 <span class="input-group-addon"><i class="icon icon-user"></i>&nbsp;&nbsp;&nbsp;车牌号：&nbsp;&nbsp;&nbsp;</span>
  				<input type="text" class="form-control" placeholder="车牌号"  id="bikesno" name="bikesno" >
 				
			</div>
          	<br>
            <br>
           <div class="input-group">
 				 <span class="input-group-addon"><i class="icon icon-key"></i>&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;码：&nbsp;&nbsp;&nbsp;</span>
  				<input type="password" class="form-control" placeholder="密码" id="bikespassword" name="bikespassword" >
 				
			</div>
            <br>
            <br>
            <button class="btn btn-block btn-primary" type="submit" onclick="add();">点击添加</button>
       
    </div>
	
</body>
</html>
