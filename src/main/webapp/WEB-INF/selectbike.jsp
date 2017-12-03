<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查询车辆信息</title>
<link href="<%=request.getContextPath() %>/zui/css/zui.min.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/zui/lib/datatable/zui.datatable.min.css"></head>
<script src="<%=request.getContextPath() %>/js/jquery-3.1.1.min.js"></script>
<script src="<%=request.getContextPath() %>/zui/lib/datatable/zui.datatable.min.js"></script>
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

 //获取车辆信息
 function getBike(){
	 var cityid=$("#city").val();
	 $.ajax({
		 type: 'post',
		 url:'${pageContext.request.contextPath}/ofo/getBike.do',
		 data:{"cityid":cityid},
		 success:function(data){
			 $("#bike").empty();
			 for(var i=0;i<data.length;i++){
			 
			 $('#bike').append("<tr>"+"<td value='" + data[i].id + "' id='no'>" + data[i].bikeno + "</td>"+"<td value='" + data[i].id + "' id='no'>" + data[i].password + "</td>"+"</tr>");  
			 } 
		 },
		 error:function(){
			alert("查询数据失败！");
		 }
	 });
 };

</script>
</head>
<body>
		<div>
  <button class="btn btn-primary" type="button"  onclick="getBike();">查询</button></div>  
  <div class="input-group" style="position:absolute;left:80px;top:0px;">
 
      <select class="form-control" id="Province" name="Province" onchange="getCity();" >
        <option>省份</option>
      </select> 
  </div>
    
   <div class="input-group" style="position:absolute;left:250px;top:0px;">
      <select class="form-control" name="city" id="city" onchange="getBike();">
        <option>市/县</option>
      </select> 
   </div> 
   
    <div style="width:450px;">
    <table class="table datatable">
      <thead>
        <tr>
          <th class="flex-col">车牌号</th> 
          <th class="flex-col">密码</th>
        </tr>
      </thead>
      <tbody id="bike" >
       	
      </tbody>
	</table>
	</div>
	
	</div>
		
	
</body>
</html>