<%@page import="com.itwillbs.board.BoardDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>writePro.jsp</h1>
	<%
		request.setCharacterEncoding("UTF-8");	
	%>
	
	<jsp:useBean id="bb" class="com.itwillbs.board.BoardBean"/>
	<jsp:setProperty property="*" name="bb"/>
	
	<%
	// IP 주소 저장
	bb.setIp(request.getRemoteAddr());
	System.out.println(bb);
	
	// DB 글정보 저장
	BoardDAO dao = new BoardDAO();
	dao.insertBoard(bb);
	
	response.sendRedirect("boardList.jsp");
	%>
	
	
</body>
</html>