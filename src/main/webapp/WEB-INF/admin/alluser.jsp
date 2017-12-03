<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>所有用户</title>
<link href="<%=request.getContextPath() %>/zui/css/zui.min.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/zui/lib/datatable/zui.datatable.min.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js"></script>
<script src="<%=request.getContextPath() %>/zui/lib/datatable/zui.datatable.min.js"></script>
<script src="<%=request.getContextPath() %>/zui/js/zui.min.js"></script>
<script type="text/javascript">
	
	function addmsg(obj){
		var td=$(obj).parent();
		var td2=td.prev().html().trim();//密码
		var td3=td.prev().prev().html().trim();//用户名
		var td4=td.prev().prev().prev().html().trim();//id
		//alert(td2+"\n"+td3);
		document.getElementById("upname").value=td3;
		document.getElementById("uppassword").value=td2;
		document.getElementById("cheid").value=td4;
		};
		
		function deluser(objs){
			var td=$(objs).parent();
			var id=td.prev().prev().prev().html().trim();//id
			document.getElementById("delid").value=id;
		}
		
		function deleteuser(){
			var id=document.getElementById("delid").value;
			alert(id);
			$.ajax({
				type:'post',
				url:'${pageContext.request.contextPath}/admin/deleteuser.do',
				data:{"id":id},
				success:function(datas){
					alert("删除成功!");
					window.location.reload();
				},
				error:function(){
					alert("删除失败!");
				}
			})
		}
		
		function updateuser(){
			var id=document.getElementById("cheid").value;
			var newname=document.getElementById("upname").value;
			var newpassword=document.getElementById("uppassword").value;
			//alert(id+"\t"+newname+"\t"+newpassword);
			$.ajax({
				type:'post',
				url:'${pageContext.request.contextPath}/admin/updateuser.do',
				data:{"id":id,"newname":newname,"newpassword":newpassword},
				success:function(data){
					alert("修改成功!");
					window.location.reload();
				},
				error:function(){
					alert("修改失败!");
				}
			});
		}
</script>
</head>

<body>
	
	<table class="table datatable">
    	
        	<tr>
        		<th>用户ID</th>
                <th>用户昵称</th>
                <th>用户密码</th>
                <th>操作</th>
            </tr>
    	<c:if test=""><h2>暂时没有信息</h2></c:if>
        	<c:forEach var="msg" items="${users}" varStatus="sta">
        	<tr>
        		<td>${msg.id}</td>
            	<td>${msg.username}</td>
                <td>${msg.password}</td>
                <td><a  data-toggle="modal" data-target="#myModal" onclick="addmsg(this);">更新</a>&nbsp;&nbsp;<a data-toggle="modal" data-target="#del"  onclick="deluser(this);">删除</a></td>
            </tr>
            </c:forEach>
    </table>
    
    <div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
    	<div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal" >
            	<span aria-hidden="true"> x </span>
                <span class="sr-only"></span>
            </button>
            <h4 class="modal-title">修改用户信息:</h4>
        </div>
        <div style="display: none;"><span id="cheid"></span></div>
      <div class="input-group">
 				 <span class="input-group-addon">&nbsp;&nbsp;&nbsp;用户名：&nbsp;&nbsp;&nbsp;</span>
  				<input type="text" class="form-control" placeholder="用户名"  id="upname" name="upname">
			</div>
			<br>
           <div class="input-group">
 				 <span class="input-group-addon">&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;码：					&nbsp;&nbsp;&nbsp;</span>
  				<input type="text" class="form-control" placeholder="密码" id="uppassword" name="uppassword">
 				
			</div>
    </div>
    <div class="modal-footer">
    	<button class="btn btn-default" type="button" data-dismiss="modal">取消</button>
        <button class="btn btn-primary" onclick="updateuser();" type="button" data-dismiss="modal" >确定</button>
    </div>
  </div>
</div>
    
    <div class="modal fade" id="del">
  <div class="modal-dialog">
    <div class="modal-content">
    	<div style="display: none;"><span id="delid"></span></div>
    	<h3>您确定要删除么？</h3>
      	 <div class="modal-footer">
    	<button class="btn btn-default" type="button" data-dismiss="modal">取消</button>
        <button class="btn btn-primary" onclick="deleteuser();" type="button" data-dismiss="modal" >确定</button>
    </div>
    </div>
  </div>
</div>
</body>
</html>