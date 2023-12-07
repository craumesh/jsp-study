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
	<h1>updatePro.jsp</h1>
	<%
	request.setCharacterEncoding("UTF-8");
	
	int idx = Integer.valueOf(request.getParameter("idx"));
	String name = request.getParameter("name");
	
	
	%>
	
	<h2> 수정 정보 </h2>
	번호 : <%=idx %> <br>
	이름 : <%=name %> <br>
	
	<%
		//DB 테이블의 수정
		
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		Class.forName(DRIVER);
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		String sql = "update itwill_member set name = ? where idx = ?";	
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, idx);
		pstmt.executeUpdate();			
		System.out.println("실행 완료!");
	%>
	
	<a href="select.jsp">결과 확인하기</a>
	
	
</body>
</html>