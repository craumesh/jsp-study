<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionMain.jsp</h1>
		
	<%
	String sId = (String)session.getAttribute("id");
	
	if(sId == null){
		response.sendRedirect("sessionLoginForm.jsp"); 		
	}
	%>
	<h2><%=sId%>님, 안녕하세요!</h2>
	
	<input type="button" value="로그아웃" onclick="location.href='sessionLogout.jsp'">
	
</body>
</html>