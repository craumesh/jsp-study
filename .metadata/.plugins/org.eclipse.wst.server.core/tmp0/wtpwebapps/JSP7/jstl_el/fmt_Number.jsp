<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>fmt_Number.jsp</h1>
	html : 10000000000<br>
	<!--  fmt:formatNumber 기본값으로 숫자를 3자리마다 ,로 구분한다 -->
	fmt(Grouping = true) : <fmt:formatNumber value="10000000000" groupingUsed="true"></fmt:formatNumber><br>
	fmt(Grouping = false) : <fmt:formatNumber value="10000000000" groupingUsed="false"></fmt:formatNumber><hr>
	
	[3.123478964] 숫자를 사용해서 소수점 2자리까지 표현 <br>
	<fmt:formatNumber value="3.123478964"/><br>
	<!-- pattern의 #문자를 사용해서 자리수 표시(반올림) -->
	<fmt:formatNumber value="3.125478964" pattern="#.##"/><hr>
	
	[10.5] 숫자를 소수점 2자리까지 표시 <br>
	<fmt:formatNumber value="10.5" minFractionDigits="2"/><br>
	<fmt:formatNumber value="10.5" pattern="#.00"/><hr>
	
	퍼센트 계산하기<br>
	<fmt:formatNumber value="${33/77 }" type="percent"/><br>
	
	<fmt:setLocale value="en_us"/>
	<fmt:formatNumber value="10000" type="currency"/><br>
	<fmt:formatNumber value="10000" type="currency" currencySymbol="@"/><br>
	
	
</body>
</html>