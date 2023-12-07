<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>elOperatorTestPro.jsp</h1>
	num1 = ${param.num1 }, num2 = ${param.num2 }
	<hr>
	<h3> 기본적인 형변환 제공, 하나의 EL표현식 내부에서 연산 수행 </h3>
	num1 + num2 : ${param.num1+param.num2 } <br>
	num1 - num2 : ${param.num1-param.num2 } <br>
	num1 * num2 : ${param.num1*param.num2 } <br>
	num1 / num2 : ${param.num1/param.num2 } <br>
	num1 % num2 : ${param.num1%param.num2 } <br>
	<hr>
	Q. num1, num2 값이 모두 양수인가?<br>
	A. ${param.num1 > 0 && param.num2 > 0 ? true : false } <br>
	<hr>
	Q. num1, num2 값이 같은가?<br>
	A. ${param.num1 == param.num2 ? "같다" : "다르다" } <br>
	<hr>
	Q. 사용자의 아이디가 있는 경우 "OOO님 안녕하세요!", 없는 경우 "Guest님 안녕하세요!"<br>
	A. ${param.id == "" ? "Guest" : param.id }님 안녕하세요! <br>
	A. ${empty param.id ? "Guest" : param.id }님 안녕하세요! <br>
	
</body>
</html>