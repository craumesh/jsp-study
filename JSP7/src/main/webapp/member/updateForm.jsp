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
	<script>
		function check(){
			var pw = document.fr.pw.value;
			if(pw == ""){
				alert('비밀번호를 입력하세요!');
				document.fr.pw.focus();
				return false;
			}
		}
	</script>
</head>
<body>
	<h1>member/updateForm.jsp</h1>
	
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
	%>	
	<fieldset>
	<legend>ITWILL 회원정보수정</legend><br>
		<form action="updatePro.jsp" name="fr" onsubmit="return check();" method="post">
			ID : <input type="text" name="id" value=<%=rs.getString("id") %> readonly><br>
			PW : <input type="password" name="pw"><br>
			NM : <input type="text" name="name" value=<%=rs.getString("name") %> required><br>
			GD : <input type="radio" name="gender" value="M"
			<%if(rs.getString("gender").equals("M")){%>checked<%}%>> 남
			  <input type="radio" name="gender" value="F"
			<%if(rs.getString("gender").equals("F")){%>checked<%}%>> 여<br>
			EM : <input type="text" name="email" value=<%=rs.getString("email") %> readonly><br><hr>
			<input type="submit" value="회원정보수정"><br>
		</form>
	</fieldset>
	<%}%>
</body>
</html>