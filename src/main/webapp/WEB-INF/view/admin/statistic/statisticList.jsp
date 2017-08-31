<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</head>
<script
	src="${pageContext.request.contextPath }/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/messages_zh.min.js"></script>
<script src="${pageContext.request.contextPath }/js/echarts.js"></script>
<script type="text/javascript"></script>
<body>
	<div class="container">
		<div class="jumbotron">
			<h2>统计-统计分析</h2>
		</div>
		<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
		<div id="main" style="width: 1300px; height: 600px;"></div>
		<script type="text/javascript">
			/* 	$(function(){
			 // 异步加载数据
			 $.get('${pageContext.request.contextPath }/statistic/statistic.action').done(function (data) {
			 // 填入数据
			 myChart.setOption({
			 xAxis: {
			 data: "毛衣"
			 },
			 series: [{
			 // 根据名字对应到相应的系列
			 name: '销量',
			 data: 12
			 }]
			 });
			 });
			 }) */
			var myChart = echarts.init(document.getElementById('main'));
			// 显示标题，图例和空的坐标轴
			myChart.setOption({
				color: ['#3398DB'],
				title : {
					text : '课程平均播放次数',
					left : 'center',
					textStyle : {
						fontSize : 16,
						fontWeight : 'normal'
					},
				    subtext: '数据来源:zhiyou100.com',
				    sublink:'http://www.zhiyou100.com',
				    subtextStyle:{
				        fontSize: 12
				    }
				},
				/* title.subtextStyle:{
					subtext: '数据来源:zhiyou100.com',
					subtarget:'blank',
				    sublink:'https://www.baidu.com',
					fontSize: 12,
				}, */
				tooltip : {},
				legend : {
					data : [ '播放次数' ],
					top : 'bottom'
				},
				xAxis : {
					data : []
				},
				yAxis : {},
				series : [ {
					name : '播放次数',
					type : 'bar',
					data : [],
				} ]
			});
			var names = []; //类别数组（实际用来盛放X轴坐标值）
			var nums = []; //销量数组（实际用来盛放Y坐标值）
			var a;

			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath }/statistic/statistic.action", //请求发送到TestServlet处
						data : {},
						dataType : "json", //返回数据形式为json
						success : function(result) {
							//请求成功时执行该函数内容，result即为服务器返回的json对象
							if (result) {
								for (var i = 0; i < result.length; i++) {
									if(result[i].courseName==null){
										a = result[i].average
									}else{
									names.push(result[i].courseName);
									}
									//挨个取出类别并填入类别数组
								}
								;
								for (var i = 0; i < result.length; i++) {
									if(result[i].average==a){
										
									}else{
									nums.push(result[i].average); //挨个取出销量并填入销量数组
									}
								}
								;
								myChart.setOption({ //加载数据图表
									xAxis : {
										data : names
									},
									series : [ {
										// 根据名字对应到相应的系列
										name : '播放次数',
										data : nums
									} ]
								});
							}
							;
						}
					})

			/* 	// 异步加载数据
			$.get("${pageContext.request.contextPath }/statistic/statistic.action",
					function(list) {
						// 填入数据
						alert(list);
						$.each(list, function(i, dom) {
							alert(dom.courseName + "-----" + dom.average);
							myChart.setOption({
							     xAxis: {
							         data: dom.courseName
							     },
							     series: [{
							         // 根据名字对应到相应的系列
							         name: '销量',
							         data: dom.average
							     }]
							 });
						});
						alert(2);
					});  */
		</script>
	</div>
</body>
</html>