<%@page import="com.itwillbs.member.db.MemberDTO"%>
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
	<c:if test="${ empty id }">
		<c:redirect url="./MemberLogin.me"/>
	</c:if>
	
	<h1>member/info.jsp(MVC)</h1>	
	<h2> 내 정보 보기 </h2>
	<h3> 아이디 : ${dto.getId() } </h3>
	<h3> 비밀번호 : ${dto.getPw() }</h3>
	<h3> 이름 : ${dto.getName() }</h3>
	<h3> 나이 : ${dto.getAge() }</h3>
	<h3> 성별 : ${dto.getGender() }</h3>
	<h3> 이메일 : ${dto.getEmail() }</h3>
	<h3> 회원가입일 : ${dto.getRegdate() }</h3>
	
	<input type="button" value="메인" onclick="location.href='./Main.me'">
	<input type="button" value="정보수정" onclick="location.href='./MemberUpdate.me'">	
	<input type="button" value="회원탈퇴" onclick="location.href='./MemberDelete.me'">	
</body>
</html>