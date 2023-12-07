<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>arrays.jsp</h1>
	
	<h3> el표현식 전달데이터 출력 </h3>
	${requestScope.foods }<hr>
	${requestScope.fruits }<hr>
	
	<h2> EL표현식 반복문 사용불가를 JSTL 반복문을 사용해 해결</h2>
</body>
</html>