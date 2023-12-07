<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	<h1>member/list.jsp(MVC)</h1>
	
	<h2>ITWILL 회원정보 리스트</h2>
	<hr>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>PW</th>
			<th>NAME</th>
			<th>GENDER</th>
			<th>AGE</th>
			<th>EMAIL</th>
			<th>REGDATE</th>
		<tr>
		<c:forEach items="${memberList }" var="dto" >
		<tr>
			<td>${dto.getId() }</td>
			<td>${dto.getPw() }</td>
			<td>${dto.getName() }</td>
			<td>${dto.getGender() }</td>
			<td>${dto.getAge() }</td>
			<td>${dto.getEmail() }</td>
			<td>${dto.getRegdate() }</td>
		<tr>
		</c:forEach>
	</table>
	<hr>
	<input type="button" value="돌아가기" onclick="location.href='./Main.me'">
	
</body>
</html>