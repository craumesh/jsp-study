<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.7.1.min.js"></script>

<script type="text/javascript">
	
	// 제이쿼리 사용 준비 완료
	$(document).ready(function(){
		alert("JQUERY1 실행!");
	});
	
	$(function(){
		alert("JQUERY2 실행!");
	});
	
	// $ 마크 = jQuery
	jQuery(document).ready(function(){
		alert("JQUERY1 실행!");
	});
	
	jQuery(function(){
		alert("JQUERY2 실행!");
	});
	
</script>
</head>
<body>

</body>
</html>