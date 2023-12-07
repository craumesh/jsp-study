<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var c = $('h2').css('color');
		
		alert(" 결과 : " + c);
		
		$('h2').css('color', 'pink');
		c = $('h2').css('color');
		
		alert(" 결과 : " + c);
		
//		$('#f').css('color', 'red');
//		$('#c').css('color', 'orange');
//		$('#k').css('color', 'yellow');
		var colorArr = [ 'red', 'orange', 'yellow' ];
		
/* 		$('h2').css('color', function(index, value){
			return colorArr[index];
		});
		
		$('h2').css('background', 'black'); */
		
		// 하나의 요소에 여러개의 속성 적용
		$('h2').css({
			color : function(index, value){
				return colorArr[index];
			},
			background : 'black'
		});
		
	});
</script>
</head>
<body>
	<h1>test3.jsp</h1>
	
	<h2 id='f'> head-0 </h2>
	<h2 id='c'> head-1 </h2>
	<h2 id='k'> head-2 </h2>
	<h2 id='u'> head-3 </h2>
</body>
</html>