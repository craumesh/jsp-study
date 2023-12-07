<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>elParamTestPro.jsp</h1>
	<h2>elParamTest.jsp 페이지에서 전달된 정보 출력하기</h2>
	
	<%	
		request.setCharacterEncoding("UTF-8");	
	%>
	
	<h3>JSP 코드</h3>
	<p>
		아이디 : <%=request.getParameter("id") %><br>
		이름 : <%=request.getParameter("name") %><br>
		나이 : <%=Integer.valueOf(request.getParameter("age")) %><br>
		좋아하는 음식 : <%=Arrays.toString(request.getParameterValues("foods")) %><br>
		취미 : <%=Arrays.toString(request.getParameterValues("hobbys")) %><br>
	</p>
	
	<h3>EL 코드</h3>
	
	<p>
		아이디 : ${param.id }<br>
		이름 : ${param.name }<br>
		나이 : ${param.age+100 } (* EL 표현식은 자동으로 정수데이터를 형변환 한다)<br>
		좋아하는 음식 : ${Arrays.toString(paramValues.foods) }<br>
		취미 : ${Arrays.toString(paramValues.hobbys) }<br>
	</p>
	<hr>
</body>
</html>