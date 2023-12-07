<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// append() 뒤에 추가 / prepend() 앞에 추가
		$('body').append("<h2>집에가고 싶어요<h2>");
		$('body').prepend("<h3>흑흑");
		
		$('#c1').append("- 1");	
		$('#c2').append("- 2");	
		$('#c3').append("- 3");	
		
		$('#c').append(function(idx,data){
			return "- "+ idx;
		});
		
		var tableData = [
			{
			no : 1,
			name : "이진수",
			gender : "M"
			},
			{
			no : 2,
			name : "박상수",
			gender : "M"
			},
			{
			no : 3,
			name : "김허수",
			gender : "M"
			},
			{
			no : 4,
			name : "강분수",
			gender : "M"
			},
			{
			no : 5,
			name : "오실수",
			gender : "M"
			}
			
		];
		
/* 		for(var i = 0; i < tableData.length; i++){
			$('table').append(function(){
				return "<tr><td>"
				+ tableData[i].no +
				"</td><td>"
				+ tableData[i].name +
				"</td><td>"
				+ tableData[i].gender +
				"</td></tr>";
			});
		} */
		
		$.each(tableData,function(idx,item){ // = $(tableData).each(function(){});
			$('table').append(function(){
				return "<tr><td>"
				+ item.no +
				"</td><td>"
				+ item.name +
				"</td><td>"
				+ item.gender +
				"</td></tr>";
			});
		});
		
		setInterval(function(){
			$('#imgDiv').append($('img').first());
		},100);
		
	});
</script>
</head>
<body>
	<h1>test6.jsp</h1>
	<div id="c1"> 내용 </div>
	<div id="c2"> 내용 </div>
	<div id="c3"> 내용 </div>
	<div id="c"> 내용 </div>
	
	<hr><hr>
	
	<table border="1">
		<tr>
			<th>no</th>
			<th>name</th>
			<th>gender</th>
		</tr>
	</table>
	
	<hr><hr>
	
	<div id="imgDiv">
		<img src="1.jpg">
		<img src="2.jpg">
		<img src="3.jpg">
	</div>
</body>
</html>