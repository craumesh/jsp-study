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
		$('h2').click(function(){
			alert('집에갈래');
			$(this).append('+');
		});
		
		// 체이닝 기법 : [.연산자]를 사용하여 한번에 다양한 이벤트 처리
		$('img').mouseover(function(){
			$(this).attr('src', '../jq1/2.jpg');
		}).mouseout(function(){
			$(this).attr('src', '../jq1/1.jpg');	
		});
		
		$('img').hover(function(){
			$(this).attr('src', '../jq1/2.jpg');
		}, function(){
			$(this).attr('src', '../jq1/1.jpg');	
		});
		
		$('textarea').keydown(function(){
			var content = $(this).val().length;
		    
		    $('h3').html(100 - content);
		    
		    // 글자수 제한
		    if (content > 100) {
		        $(this).val($(this).val().substring(0, 100));
		        $(this).css('color', 'red');
		    } else {
		    	$(this).css('color', 'black');
		    }
		});
	});
</script>
</head>
<body>
	<h1>test1.jsp</h1>
	
	<input type="button" value="이 버튼을 누를때마다">
	
	<hr>
	
	<h2> head - 0 </h2>
	<h2> head - 1 </h2>
	<h2> head - 2 </h2>
	
	<hr>
	
	<h2> 이미지에 마우스를 올렸을때, 이미지 변경
		이미지에 마우스를 내렸을때, 원래 이미지로 변경</h2>
	<img src="../jq1/1.jpg">
	
	<hr>
	
	<h3></h3>
	<textarea rows="5" cols="25"></textarea>
	
</body>
</html>