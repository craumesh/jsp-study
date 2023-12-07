<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>member/main.jsp</h1>
	<%
		String id = (String)session.getAttribute("id");

		if(id == null){
			response.sendRedirect("loginForm.jsp");
	%>
	<%} else { %>
		<h2><%=id %>님, 안녕하세요! </h2>
	<%} %>	
	<input type="button" value="로그아웃" onclick="location.href='logoutPro.jsp'">
	
	<hr>
	
	<h2><a href="info.jsp">회원정보 조회 (내 정보 보기)</a></h2>
	<h2><a href="updateForm.jsp">회원정보 수정</a></h2>
	<h2><a href="deleteForm.jsp">회원정보 삭제</a></h2>
	<%	if(id != null && id.equals("admin")){ %>
	<hr>
	<h2>[ 관리자 전용메뉴 ]</h2>
	<h2><a href="list.jsp">회원정보 목록보기</a></h2>
	<% } %>
</body>
</html>