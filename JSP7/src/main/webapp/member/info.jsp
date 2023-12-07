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
	<h1>member/info.jsp</h1>
	<%
	String id = (String)session.getAttribute("id");
	
	if(id == null){
		response.sendRedirect("loginForm.jsp");
	}	
	
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";

	Class.forName(DRIVER);
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	String sql = "select * from itwill_member where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs =  pstmt.executeQuery();
	
	if(rs.next()){
		if(rs.getString("id").equals(id)){
			%>
			<h3>아이디 : <%=rs.getString("id") %></h3> <br>
			<h3>이름 : <%=rs.getString("name") %></h3> <br>
			<h3>성별 : <%=rs.getString("gender") %></h3> <br>
			<h3>나이 : <%=rs.getInt("age") %></h3> <br>
			<h3>이메일 : <%=rs.getString("email")%></h3> <br>
			<h3>회원가입일 : <%=rs.getTimestamp("regdate") %></h3> <br>
			<%
		}
	}
	%>
	
	<h2><a href="main.jsp">메인 페이지로</a></h2>
	
</body>
</html>