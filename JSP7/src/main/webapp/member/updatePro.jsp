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
	<h1>member/updatePro.jsp</h1>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	
		<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"/>
		<jsp:setProperty property="*" name="mb"/>
		
	<%	
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
	
		Class.forName(DRIVER);
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		String sql = "select pw from itwill_member where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mb.getId());
		ResultSet rs =  pstmt.executeQuery();
		if(rs.next()){
			if(mb.getPw().equals(rs.getString("pw"))){
				sql = "update itwill_member set name=?, gender=? where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mb.getName());
				pstmt.setString(2, mb.getGender());
				pstmt.setString(3, mb.getId());
				pstmt.executeUpdate();%>
				<script type="text/javascript">
					alert("정보가 수정되었습니다!");
					location.href="main.jsp";
				</script>				
				<%
			} else{%>
			<script type="text/javascript">
				alert("비밀번호 오류!");
				history.back();
			</script>			
			<%				
			}
		} else{%>
		<script type="text/javascript">
		alert("회원 정보 없음!");
		history.back();
		</script>			
		<%	
			
		}
	%>
</body>
</html>