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
	<h1> deletePro.jsp </h1>
	<%
		request.setCharacterEncoding("UTF-8");
		
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";

		int idx = Integer.valueOf(request.getParameter("idx"));
		String jumin = request.getParameter("jumin");
	
		Class.forName(DRIVER);
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		//String sql = "delete from itwill_member where idx = ? and jumin = ?"; // 보안상 즉시 삭제는 좋지 않음
		String sql = "select jumin from itwill_member where idx = ?"; // 셀렉트절로 해당 인덱스에 해당하는 주민번호를 받아옴
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs =  pstmt.executeQuery();
		pstmt.setInt(1, idx);
		
		if(rs.next()){
			if(jumin.equals(rs.getString("jumin"))){ // 셀렉트절로 받아온 주민번호와 입력받은 주민번호가 같은지 검증
				sql = "delete from itwill_member where idx = ? and jumin = ?";
				pstmt = con.prepareStatement(sql);
			}
		}
		
		pstmt.setInt(1, idx);
		pstmt.setString(2, jumin);
		pstmt.executeUpdate();
		
		response.sendRedirect("select.jsp");
	%>

</body>
</html>