<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	  
	  $.ajax({
		  url : "json1.jsp",
		  dataType : "json",
		  success : function(data){
			  console.log(data);
			  $('body').append(data.name+"<br>");
			  $('body').append(data.age+"<br>");
			  $('body').append(data.regdate+"<br>");
			  alert(" json1.jsp 처리 완료!");
		  }
	  });
	  
	  // 비동기식방식으로 JSON데이터 처리가능
	  $.getJSON("json1.jsp", function(data){
		  console.log(data);
		  $('body').append(data.name+"<br>");
		  $('body').append(data.age+"<br>");
		  $('body').append(data.regdate+"<br>");
		  alert(" json1.jsp 처리 완료!");
	  });
	  
	});
</script>
</head>
<body>
	<h1>jsonTest1.jsp</h1>
</body>
</html>