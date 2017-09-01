<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://zhiyou100.com/common/"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
.newClass {
	
}
</style>
<script
	src="${pageContext.request.contextPath }/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/jquery-confirm.css">
</head>

<body>
   <jsp:include page="/admin.jsp">
     <jsp:param value="video" name="fromJsp"/>
   </jsp:include>
	<div class="container">
		<div class="jumbotron">
			<h2>视频列表-视频管理</h2>
		</div>
		<a href="${pageContext.request.contextPath }/admin/video/addvideo.action"
			class="btn btn-primary">添加用户</a> <a class="btn btn-primary"
			id="deleteVideo" onclick="deleteAll()">批量删除 <span class="badge"
			id="number">0</span></a>
		<form class="form-inline" style="float: right;"
			action="${pageContext.request.contextPath }/admin/video/videoList.action">
			<div class="form-group">
				<label for="exampleInputName1">视频标题</label> <input type="text"
					class="form-control" name="titleKey" id="exampleInputName1"
					placeholder="视频标题" value="${titleKey }">
			</div>
			<div class="form-group">
				<select class="form-control" name="speakerKey">
					<option value="0">请选择主讲人</option>
					<c:forEach items="${speaker }" var="sp">
						<option value="${sp.id }" ${sp.id == speakerKey ? "selected":""}>${sp.speakerName }</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<select class="form-control" name="courseKey">
					<option value="0">请选择课程</option>
					<c:forEach items="${course }" var="cou">
						<option value="${cou.id }" ${cou.id == courseKey ? "selected":""}>${cou.courseName }</option>
					</c:forEach>
				</select>
			</div>
			<input type="submit" class="btn btn-primary" value="查询">
		</form>
		<form id="formId">
			<table class="table table-hover" style="width: 100%; height: 100%;">
				<thead>
					<tr>
						<th><label class="checkbox-inline"> <input
								type="checkbox" id="checkAllId" value="全选"
								onclick="checkAll(this)" />序号
						</label></th>
						<th>名称</th>
						<th>介绍</th>
						<th>讲师</th>
						<th>课程</th>
						<th>时长</th>
						<th>播放次数</th>
						<th>编辑</th>
						<th>删除</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${page.rows }" var="list" varStatus="status">
						<tr>
							<th scope="row"><label class="checkbox-inline"> <input
									type="checkbox" value="${list.id }" name="checkid"
									onclick="checkOne(this)">${status.count+(page.page-1)*10}
							</label></th>
							<td>${list.videoTitle }</td>
							<td width="60%">${list.videoDescr }</td>
							<td width="5%">${list.speakerName }</td>
							<td>${list.courseName }</td>
							<td>${list.videoLength}</td>
							<td width="5%">${list.videoPlayTimes }</td>
							<td><a class="glyphicon glyphicon-edit"
								href="${pageContext.request.contextPath }/admin/video/updatevideo.action?id=${list.id}"></a></td>
							<td><a class="glyphicon glyphicon-trash newClass" onclick="deleteOne(this)"
							id="${list.id}"	<%-- href="${pageContext.request.contextPath }/video/deletevideo.action?id=${list.id}" --%>></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
		<pg:page
			url="${pageContext.request.contextPath }/admin/video/videoList.action"></pg:page>
	</div>
</body>
<script type="text/javascript">
 
 var num = 0;
 
  function checkAll(ele){
	  $("input[name=checkid]").prop("checked",ele.checked);
	  if(ele.checked){
		  $("#number").text($("input[name=checkid]").length);
	  }else{
		  $("#number").text(0);
	  }
  }
  function checkOne(ele){
	  if(ele.checked){
		  num++;
	  }else{
		  num--;
	  };
	  if($("input[name=checkid]").length==num){
		$("#checkAllId").prop("checked",true); 
	  }else{
		$("#checkAllId").prop("checked",false); 
	  }
	    $("#number").text(num);
  }
  function deleteAll(){
	  alert("批量删除");
	  if(num==0){
		  $.alert({
			    title: '警告!',
			    content: '没有选中要删除的信息',
			});
	  }else{
		  $.confirm({
		      title: '提醒!',
		      content: '确定要全删吗',
		      buttons: {
		                   确定删除: function () {
		              $.ajax({
		                    url:"${pageContext.request.contextPath }/admin/video/delteteVideoByNumber.action",
		                  	data:$("#formId").serialize(),
		                  	success:function(msg){
		                  	}      
		              });
		            $.alert('删除成功');
		            window.location.reload();
		          },
		                     取消: {
		              btnClass: 'btn-blue'	   
		           }
		      }
		  });
		/*   $.ajax({
			  url:"${pageContext.request.contextPath }/video/delteteVideoByNumber.action",
			  data:$("#formId").serialize(),
			  success:function(msg){
				  
			  }
		  }); */
	  }
  };
  function deleteOne(ele){
	  $.confirm({
	      title: '提醒!',
	      content: '确定要删除吗',
	      buttons: {
	                  确定删除: function () {
	            $.get(
	            		"${pageContext.request.contextPath }/admin/video/deletevideo.action",
	            	    {"id":ele.id},
	                    function(data){
	                       $.alert('删除成功');
	                       window.location.reload();
	                            }
	            	   );
	          },
	                   取消: {
	              btnClass: 'btn-blue'	   
	           }
	      }
	  }); 
  };

</script>
 <script src="${pageContext.request.contextPath }/js/jquery-confirm.js"></script>
</html>