<%@page import="java.sql.ResultSet"%>
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
	<h1>member/list.jsp</h1>
	<%
	
	request.setCharacterEncoding("UTF-8");
	
	String id = (String)session.getAttribute("id");
	
	if(id == null || !id.equals("admin")){
		response.sendRedirect("loginForm.jsp");
	}	
	
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";

	Class.forName(DRIVER);
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	String sql = "select * from itwill_member where id != ?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	%>
	<h2>ITWILL 회원정보 리스트</h2>
	<hr>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>PW</th>
			<th>NAME</th>
			<th>GENDER</th>
			<th>AGE</th>
			<th>EMAIL</th>
			<th>REGDATE</th>
		<tr>
	<%while(rs.next()){ %>
		<tr>
			<td><%=rs.getString("id") %></td>
			<td><%=rs.getString("pw") %></td>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getString("gender") %></td>
			<td><%=rs.getInt("age") %></td>
			<td><%=rs.getString("email") %></td>
			<td><%=rs.getTimestamp("regdate") %></td>
		<tr>
	<%} %>
	</table>
	<hr>
	<input type="button" value="돌아가기" onclick="location.href='main.jsp'">
	
</body>
</html>