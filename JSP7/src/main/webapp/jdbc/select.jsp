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
	<h1>select.jsp</h1>
	<h2> 데이터베이스에 저장된 정보를 조회 </h2>
	<%
	
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	
	Class.forName(DRIVER); System.out.println("드라이버 로드 성공!");
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW); System.out.println("DB 연결 성공!");
	String sql = "select * from itwill_member";
	PreparedStatement pstmt = con.prepareStatement(sql);
	//pstmt.setInt(1, 1);
	ResultSet rs = pstmt.executeQuery(); System.out.println("SQL 실행 완료!");
	
/* 	while(rs.next()){			
		out.println("번호 : " + rs.getInt("idx") + "<br>");
		out.println("이름 : " + rs.getString("name") + "<br>");
		out.println("성별 : " + rs.getString("gender") + "<br>");
		out.println("나이 : " + rs.getInt("age") + "<br>");
		out.println("주민번호 : " + rs.getString("jumin") + "<br>");
		out.println("<br>");
	} */
	
	%>
	
<%-- 	<table border = "1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>성별</td>
			<td>나이</td>
			<td>주민번호</td>
		</tr>
		<%
		String tag = "";
		while(rs.next()){
			tag += "<tr>";
			tag += "<td>" + rs.getInt("idx") + "</td>";
			tag += "<td>" + rs.getString("name") + "</td>";
			tag += "<td>" + rs.getString("gender") + "</td>";
			tag += "<td>" + rs.getInt("age") + "</td>";
			tag += "<td>" + rs.getString("jumin") + "</td>";
			tag += "</tr>";
		}
		out.println(tag);
		%>
	</table> --%>
	
	<table border = "1">	
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>성별</td>
			<td>나이</td>
			<td>주민번호</td>
		</tr>
		<%while(rs.next()){ %>
			<tr>
				<td><%=rs.getInt("idx")%></td>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("gender")%></td>
				<td><%=rs.getInt("age")%></td>
				<td><%=rs.getString("jumin")%></td>
			</tr>
		<%}%>
	</table>
	
	
</body>
</html>