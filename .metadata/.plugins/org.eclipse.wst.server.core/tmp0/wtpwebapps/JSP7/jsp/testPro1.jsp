<%@page import="java.awt.print.PrinterGraphics"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testPro1.jsp</h1>
	파라메터 : 이전페이지(form)에서 전달해준 정보<br>	
	request.getParameter("input 태그 name");<br><br>
	
	전달된 정보<br>
<%-- 	ID : <%=request.getParameter("id") %><br>
	AGE : <%=request.getParameter("age") %><br> --%>
	
	<%
		String id = request.getParameter("id");
		// 폼태그로 전달된 데이터 파라메터는 항상 문자열 타입
		int age = Integer.parseInt(request.getParameter("age"));
		
	%>
	아이디 : <%=id %><br>
	나이 : <%=age %>
	
</body>
</html>