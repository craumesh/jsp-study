<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	
	// 속성 정보 확인은 해당 요소 중 첫번재 요소만 조회
	var tmp = $('img').attr('src');
	alert(tmp);
	
	$('img').attr({
		width : function(index){
			return 100;
		},
		src : function(index){
			if(index == 0)
				return "3.jpg";
		},
		border : function(index){
			return (index+1)*2;
				
		},
	});
	
});
</script>
</head>
<body>
	<h1>test4.jsp</h1>
	
	<img alt="ww" src="1.jpg">
	<img alt="ww" src="2.jpg">
	<img alt="ww" src="3.jpg">
</body>
</html>