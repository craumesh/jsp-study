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
	<h1> beanPro1.jsp </h1>
	
	<%	
		request.setCharacterEncoding("UTF-8");
		//String id = request.getParameter("id");
		
		// 객체(자바빈)
		//JavaBean1 jb1 = new JavaBean1();
		//jb1.setId(request.getParameter("id"));
	%>
	
	<%-- 아이디 : <%=jb1.getId()%><br> --%>
	
	<h2> 자바빈(액션 태그) </h2>
	
	<jsp:useBean id="jb1" class="com.itwillbs.javabean.JavaBean1"/>
	
	<jsp:setProperty property="id" name="jb1" param="id"/>
	
	아이디(자바빈) : <jsp:getProperty property="id" name="jb1"/>
	
</body>
</html>