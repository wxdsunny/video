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
	
<script
	src="${pageContext.request.contextPath }/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/jquery-confirm.css">


</head>
<body>
<jsp:include page="/admin.jsp">
     <jsp:param value="speaker" name="fromJsp"/>
   </jsp:include>
	<div class="container">
		<div class="jumbotron">
			<h2>主讲人列表-主讲人管理</h2>
		</div>
		<a
			href="${pageContext.request.contextPath }/admin/speaker/addSpeaker.action"
			class="btn btn-primary">添加用户</a>
		<form class="form-inline" style="float: right;"
			action="${pageContext.request.contextPath }/admin/speaker/speakerList.action"
			method="post">
			<div class="form-group">
				<label for="exampleInputName1">名称</label> <input type="text"
					class="form-control" id="exampleInputName1" placeholder="名称 "
					name="speakerKey" value="${speakerKey }">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail2">职位</label> <input type="text"
					class="form-control" id="exampleInputEmail2" placeholder="职位"
					name="speakerSearch" value="${speakerSearch }">
			</div>
			<button type="submit" class="btn btn-primary">查询</button>
		</form>

		<table class="table table-hover" style="width: 100%; height: 100%;">
			<thead>
				<tr>
					<th>序号</th>
					<th>名称</th>
					<th>职位</th>
					<th>简介</th>
					<th>编辑</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.rows }" var="speak" varStatus="status">
					<tr>
						<th scope="row">${status.count+(page.page-1)*10 }</th>
						<td>${speak.speakerName }</td>
						<td>${speak.speakerJob }</td>
						<td width="70%">${speak.speakerDescr }</td>
						<td><a class="glyphicon glyphicon-edit" href="${pageContext.request.contextPath }/admin/speaker/updateSpeaker.action?id=${speak.id}"></a></td>
						<td><a class="glyphicon glyphicon-trash newClass" onclick="deleteOne(this)" id="${speak.id}"></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<pg:page
			url="${pageContext.request.contextPath }/admin/speaker/speakerList.action"></pg:page>
	</div>
</body>

<script type="text/javascript">
function deleteOne(ele){
	    $.confirm({
	      title: '提醒!',
	      content: '确定要删除吗',
	      buttons: {
	                  确定删除: function () {
	             $.get(
	            		"${pageContext.request.contextPath }/admin/speaker/deleteSpeaker.action",
	            	    {"id":ele.id},
	                    function(data){
	                       $.alert('删除成功');
	            	    	setTimeout(function() {
								location.reload();
							}, 2000);
	                            }
	            	   );  
	          },
	                   取消: {
	              btnClass: 'btn-blue'	
	           }
	      }
	  });   
	/*   $.alert({
		    title: 'Alert!',
		    content: 'Simple alert!',
		}); */
};
</script>
 <script src="${pageContext.request.contextPath }/js/jquery-confirm.js"></script>
</html>