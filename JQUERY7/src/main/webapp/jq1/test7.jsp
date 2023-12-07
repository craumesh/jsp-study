<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h2.high_0{background: red;}
	h2.high_1{background: orange;}
	h2.high_2{background: yellow;}
	h2.high_3{background: green;}
	h2.high_4{background: blue;}
</style>

<script src="../js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
/* 		$('h2').addClass(function(idx){
			return "high_"+idx;
		}); */
		
		$('h2').each(function(idx){
			$(this).addClass("high_"+idx);
			// this - 나 자신을 가리키는 레퍼런스
			//	=> 이벤트가 발생된 대상
		});
	});
</script>
</head>
<body>
	<h1>test7.jsp</h1>
	
<!-- 	<h2 class="high_0"> head - 0 </h2>
	<h2 class="high_1"> head - 1 </h2>
	<h2 class="high_2"> head - 2 </h2>
	<h2 class="high_3"> head - 3 </h2>
	<h2 class="high_4"> head - 4 </h2> -->
	
	<h2> head - 0 </h2>
	<h2> head - 1 </h2>
	<h2> head - 2 </h2>
	<h2> head - 3 </h2>
	<h2> head - 4 </h2>
</body>
</html>