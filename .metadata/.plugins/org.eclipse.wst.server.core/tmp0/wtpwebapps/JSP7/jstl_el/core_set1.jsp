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
	<h1>./jstl_el/core_set1.jsp</h1>
	
	<%
		/* JSP(JAVA)코드 사용 변수 사용 => 해당 페이지에서만 사용가능 */
		int num1 = 100;
		int num2 = 200;
		int sum = num1 + num2;
	%>
	
	결과값(num1+num2) : <%=sum %><hr>
	<!-- 속성(Attribute-영역에서 공유될 수 있는 데이터)을 정의 -->
	<!-- <c:set var="변수명" value="값"/> -->
	<c:set var="num3" value="100" />
	<c:set var="num4" value="300" />
	<c:set var="sum2" value="${num3+num4 }" />
	결과값(num3+num4) : <c:out value="${sum2 }"/><hr>
	
	<h2> 속성의 정보를 선언 후 다른 페이지에서도 사용 </h2>
	<c:set var="model" value="a0001" scope="request" />
	<c:set var="price" value="200,000" scope="session" />
	<c:set var="color" value="red" scope="session" />
	<c:set var="color" value="black" scope="request" />
	
	<!-- 다음 페이지로 이동 -->
	<h2> request 영역의 데이터를 가지고 이동 </h2>
	<jsp:forward page="core_set2.jsp"/>
	
</body>
</html>