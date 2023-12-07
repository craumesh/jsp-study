<%@page import="com.itwillbs.javabean.JavaBean2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> beanPro2_1.jsp </h1>
	
	<%	
		request.setCharacterEncoding("UTF-8");
	
		JavaBean2 jb2 = new JavaBean2();
		
		jb2.setId(request.getParameter("id"));
		jb2.setPw(request.getParameter("pw"));
		jb2.setAge(Integer.valueOf(request.getParameter("age")));		
	%>
	
	아이디 : <%=jb2.getId() %><br>
	비밀번호 : <%=jb2.getPw() %><br>
	나이 : <%=jb2.getAge() %><br>
</body>
</html>