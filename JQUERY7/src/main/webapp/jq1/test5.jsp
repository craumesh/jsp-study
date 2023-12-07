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
		var tmpHtml = $('div').html(); // html 코드로 변환하여 출력(html 태그 사용 가능)
		var tmpText = $('div').text(); // text 로만 출력
		
		$('div').text(function(index,currentcontent){
			var star = "";
			var arr = ['서울지점','부산지점','전국통합지점'];
			for(var i = 0; i <= index; i++){
				star += " *";
			}
			return currentcontent + arr[index] + star;
		});
		
		
	});
</script>
</head>
<body>
	<h1>test5.jsp</h1>
	
	<div> div-0 </div>
	<div> div-1 </div>
	<div> div-2 </div>
</body>
</html>