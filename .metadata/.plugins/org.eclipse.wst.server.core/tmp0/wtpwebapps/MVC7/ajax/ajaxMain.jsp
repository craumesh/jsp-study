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
	  
	  $('#btn1').click(function(){
		  alert("야옹!");
		  $.ajax({
			  url:"./AjaxAction.bo",
			  success:function(data){
				  alert(data);
				  //$('body').append(data+"<br>");
				  console.log(data);
				  // JSON 객체
				  $('body').append("3. json객체 결과 : " + (data[0].bno+100) + "<br>");
			  }
		  })
	  })
	  
	});
</script>
</head>
<body>
	<h1>Ajax.bo</h1>
	
	<input type="button" value="1.ajax 테스트" id="btn1">
</body>
</html>