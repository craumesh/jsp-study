<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>./jstl_el/core_Set2</h1>
	<h2> core_Set1.jsp에서 전달된 데이터 출력 </h2>
	<c:out value="모델명 : ${model }"/> <br>
	<c:out value="가격 : ${price }"/> <br>
	<c:out value="색상 : ${color }"/> <br>
	
	<!-- 속성을 제거 -->
	<c:remove var="color" scope="request"/> <hr>
	
	<c:out value="색상 : ${color }"/> <hr>
	
	<c:out value="이름 : ${personVector[0].name }"/><br>
	<c:out value="나이 : ${personVector[0].age }"/><br>
	<c:out value="기종 : ${personVector[0].phone.model }"/><br>
	<c:out value="번호 : ${personVector[0].phone.tel }"/><hr>
	<c:set var="ph1" value="${personVector[0].phone }" />
	<c:out value="기종 : ${ph1.model }"/><br>
	<c:out value="번호 : ${ph1.tel }"/><hr>
	
	<c:set var="p2" value="${personVector[1] }" />
	<c:out value="이름 : ${p2.name }"/><br>
	<c:out value="나이 : ${p2.age }"/><br>
	<c:set var="ph2" value="${p2.phone }" />
	<c:out value="기종 : ${ph2.model }"/><br>
	<c:out value="번호 : ${ph2.tel }"/><hr>
</body>
</html>