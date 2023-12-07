<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 반드시 JSTL 실행전 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> ./jstl_el/core_out.jsp </h1>
	
	jstl : <c:out value="HelloWorld"/>
	<hr>
	html : HelloWorld
	<hr>
	el : ${"HelloWorld" }
	<hr>
	jsp : <%="HelloWorld" %>
	<hr>
	
	<c:out value="100+200"/><br>
	JSTL+el 같이 사용하면 연산 수행가능<br>
	<c:out value="${100+200 }"/><hr>
	
	<c:out value="${person.name }" default="null값 대신 출력되는 기본값"/><hr>
	
	<c:out value="<abc>태그는 abc 태그의 정보를 출력합니다!"/><br>
	&lt;abc>태그는 abc 태그의 정보를 출력합니다!<br>
	
	<![CDATA[<abc>태그는 abc 태그의 정보를 출력합니다<br>]]> 
</body>
</html>