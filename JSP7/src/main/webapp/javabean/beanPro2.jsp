<%@page import="com.itwillbs.javabean.JavaBean1"%>
<%@page import="java.beans.JavaBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> beanPro2.jsp </h1>
	
	<%	
		request.setCharacterEncoding("UTF-8");
	%>
	
	<h2> 자바빈(액션 태그) </h2>
	
	<jsp:useBean id="jb2" class="com.itwillbs.javabean.JavaBean2"/>
	
	<%-- <jsp:setProperty property="id" name="jb2" param="id"/>
	<jsp:setProperty property="pw" name="jb2" param="pw"/> --%>
	<%-- <jsp:setProperty property="age" name="jb2" param="age"/> --%>
	<!-- 파라메터명과 프로퍼티명이 같을 경우 파라미터명 생략 가능 -->
	<jsp:setProperty property="*" name="jb2"/>
	
	아이디(자바빈) : <jsp:getProperty property="id" name="jb2"/><br>
	비밀번호(자바빈) : <jsp:getProperty property="pw" name="jb2"/><br>
	나이(자바빈) : <jsp:getProperty property="age" name="jb2"/><br>
	
</body>
</html>