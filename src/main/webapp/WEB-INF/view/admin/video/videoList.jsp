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
</head>
<script type="text/javascript">
/* 
  function checkOne(ele){
	  
  } */














  $(function(){
	$("#name1").click(function() {
		var $check = $(":checkbox");
		$check.each(function(i,d){
			d.checked=$check[0].checked;
		})
	 	var $a = $("input:checked");
		b = $a.length-1;
		if($check[0].checked){
			$("#number").text(b);
		}else{
			$("#number").text("0");
		}
	})
	$(":checkbox").click(function(){
		var $check = $(":checkbox");
		var $a = $("input:checked");
		if($a.length>10){
			$("#number").text("10");
		}else{
			$("#number").text($a.length);
		}
	})
	$("#deleteVideo").click(function(){
		var arr = new Array;
	 	var $a = $("input:checked");
	    $a.each(function(i){
			arr[i] = $a[i].id;
			//alert(i+"----"+d.checked+"------"+$check[0].checked);
		})
		b = $a.length;
		if(b!=0){
			if(confirm("确定要删除" + b + "条数据")){
				$("#deleteVideo").attr({
					href:"${pageContext.request.contextPath }/video/delteteVideoByNumber.action?arr="+arr
				});
			}
		}
	})
	$(".newClass").click(function(){
		return confirm("确定要删除这条记录吗");
	})
})  
    	
/* 	function checkAll(x) {
		var check = document.getElementsByName("check");
		var num = document.getElementById("number");
		for (var i = 0; i < check.length; i++) {
			check[i].checked = x.checked;
		}
		if (x.checked) {
			num.innerHTML = check.length;
		} else {
			num.innerHTML = 0;
		}

	} */
/* 	function deleteAll() {
		var check = document.getElementsByName("check");
		var j = 0;
		var co = new Array;
		for (var i = 0; i < check.length; i++) {
			if (check[i].checked) {
				j++;
				co[i] = check[i].id;
			}
		}
		var num = document.getElementById("number");
		num.innerHTML = j;
	} */

/* 	function deleteVideo() {
		var check = document.getElementsByName("check");
		var co = new Array;
		var j = 0;
		for (var i = 0; i < check.length; i++) {
			if (check[i].checked) {
				j++;
				co[i] = check[i].id;
			}
		}
		if (j != 0) {
			var b = confirm("确定要删除" + j + "条数据");
			if (b) {
				document.location = "delteteVideoByNumber.action?arr=" + co;
			}
		}
	} */
</script>
<body>
	<div class="container">
		<div class="jumbotron">
			<h2>视频列表-视频管理</h2>
		</div>
		<a href="${pageContext.request.contextPath }/video/addvideo.action"
			class="btn btn-primary">添加用户</a> <a class="btn btn-primary"
			id="deleteVideo">批量删除 <span class="badge" id="number">0</span></a>
		<form class="form-inline" style="float: right;"
			action="${pageContext.request.contextPath }/video/videoList.action">
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
		<table class="table table-hover" style="width: 100%; height: 100%;">
			<thead>
				<tr>
					<th><label class="checkbox-inline"> <input
							type="checkbox" id="checkAll" value="全选" onclick="checkAll(this)"/>序号
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
								type="checkbox" id="${list.id }" name="checkid"
								onclick="checkOne()">${status.count+(page.page-1)*10}
						</label></th>
						<td>${list.videoTitle }</td>
						<td width="60%">${list.videoDescr }</td>
						<td width="5%">${list.speakerName }</td>
						<td>${list.courseName }</td>
						<td>${list.videoLength}</td>
						<td width="5%">${list.videoPlayTimes }</td>
						<td><a class="glyphicon glyphicon-edit"
							href="${pageContext.request.contextPath }/video/updatevideo.action?id=${list.id}"></a></td>
						<td><a class="glyphicon glyphicon-trash newClass"
							href="${pageContext.request.contextPath }/video/deletevideo.action?id=${list.id}"></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<pg:page
			url="${pageContext.request.contextPath }/video/videoList.action"></pg:page>
	</div>
</body>
</html>