<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="com.itwillbs.member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>member/insertPro.jsp</h1>
	
	<%	
		request.setCharacterEncoding("UTF-8");	
	%>
	
	<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"/>
	<jsp:setProperty property="*" name="mb"/>
		
	<%
		int bYear = Integer.valueOf(request.getParameter("bYear"));
		Date today = new Date();
		mb.setAge(today.getYear() + 1900 - bYear);
		mb.setRegdate(new Timestamp(System.currentTimeMillis()));
	%>	
	
	아이디(자바빈) : <jsp:getProperty property="id" name="mb"/><br>
	비밀번호(자바빈) : <jsp:getProperty property="pw" name="mb"/><br>
	이름(자바빈) : <jsp:getProperty property="name" name="mb"/><br>
	성별(자바빈) : <jsp:getProperty property="gender" name="mb"/><br>
	나이(자바빈) : <jsp:getProperty property="age" name="mb"/><br>
	이메일(자바빈) : <jsp:getProperty property="email" name="mb"/><br>
	
	<%		
		System.out.println(mb.toString());
	
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
	
		Class.forName(DRIVER);
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		String sql = "insert into itwill_member(id,pw,name,gender,age,email,regdate) values(?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mb.getId());
		pstmt.setString(2, mb.getPw());
		pstmt.setString(3, mb.getName());
		pstmt.setString(4, mb.getGender());
		pstmt.setInt(5, mb.getAge());
		pstmt.setString(6, mb.getEmail());
		pstmt.setTimestamp(7, mb.getRegdate());
		pstmt.executeUpdate();		
		System.out.println("회원가입 성공!");
	%>
		<script type="text/javascript">
			alert("가입을 환영합니다!");
			location.href="loginForm.jsp";
		</script>	
	
</body>
</html>