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
	.newClass{}
	</style>
<script
	src="${pageContext.request.contextPath }/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function(){
    	$(".newClass").click(function(){
    		return confirm("确定要删除这条记录吗");
    	})
    })
</script>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h2>主讲人列表-主讲人管理</h2>
		</div>
		<a
			href="${pageContext.request.contextPath }/speaker/addSpeaker.action"
			class="btn btn-primary">添加用户</a>
		<form class="form-inline" style="float: right;"
			action="${pageContext.request.contextPath }/speaker/speakerList.action"
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
						<td><a class="glyphicon glyphicon-edit" href="${pageContext.request.contextPath }/speaker/updateSpeaker.action?id=${speak.id}"></a></td>
						<td><a class="glyphicon glyphicon-trash newClass" href="${pageContext.request.contextPath }/speaker/deleteSpeaker.action?id=${speak.id}"></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<pg:page
			url="${pageContext.request.contextPath }/speaker/speakerList.action"></pg:page>
	</div>
</body>
</html>