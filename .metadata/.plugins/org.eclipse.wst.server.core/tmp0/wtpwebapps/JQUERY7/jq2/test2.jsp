<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.aniBox{
		width: 50px;
		height: 50px;
		background-color: orange;
	}
</style>

<script src="../js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('h1').click(function(){
//			$(this).hide();	<-> show();
			// slideUp/slideDown/slideToggle
			// fadeIn/fadeOut/fadeToggle
			$(this).next().toggle('slow',function(){
				// 콜백함수 : 지금 적용하는 효과/처리가 모두 완료된 후
				// 실행되는 함수
			});
			
		});
		
		$(".slider").bxSlider({
		    slideWidth: 600
		});
		
		$(".aniBox").click(function(){
			var width = parseInt($(this).css('width'));
			var height = parseInt($(this).css('height'));
			width += 50;
			height += 50;
			/* 
			$(this).css('width',width);
			$(this).css('height',height); */
			
			$(this).animate({
				width : width,
				height : height
			})
		})
	});
</script>
</head>
<body>
	<h1> 열기/닫기 1 </h1>
	<div>
		<h1>제목1</h1>
		<p>본문</p>
	</div>
	
	<h1> 열기/닫기 2 </h1>
	<div>
		<h1>제목2</h1>
		<p>본문</p>
	</div>
	
	<div class="slider">
      <div><img src="../jq1/1.jpg"></div>
      <div><img src="../jq1/2.jpg"></div>
      <div><img src="../jq1/3.jpg"></div>
    </div>
    
    <div class="aniBox"></div>

</body>
</html>