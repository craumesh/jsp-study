<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String name = request.getParameter("name");
	int age = Integer.valueOf(request.getParameter("age"));
	System.out.println(" 전달받은 데이터 : "+name+" "+age);
%>

<%= name + "@@" %><br>
<%= age + 100 %>

</body>
</html>