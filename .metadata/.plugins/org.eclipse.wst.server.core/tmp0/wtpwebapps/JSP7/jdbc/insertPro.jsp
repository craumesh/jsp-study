<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>insertPro.jsp</h1>
	
		<%
		request.setCharacterEncoding("UTF-8");	
	
		String userName = request.getParameter("name");
		String userGender = request.getParameter("gd");
		int userAge = Integer.parseInt(request.getParameter("age"));
		String userJumin1 = request.getParameter("jm1");
		String userJumin2 = request.getParameter("jm2");
		String userJumin = userJumin1 + "-" + userJumin2;
		
		%>	
	
		이름 : <%=userName %> <br>
		성별 : <%=userGender %> <br>
		나이 : <%=userAge %> <br>
		주민번호 : <%=userJumin%> <br>
	
		<%
		// DB 연결 정보
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		// 1. 드라이버 로드
		Class.forName(DRIVER);
		System.out.println("드라이버 로드 성공!");
		
		// 2. DB 연결
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("DB 연결 성공!");
		
		// 3. SQL 구문 작성 & stmt 객체 생성
		// Statement - SQL 구문을 실행하게 하는 객체
		// 기본 Statement 구문보다 PreparedStatement 구문의 처리속도가 유의미하게 빠름
		// 또한 PreparedStatement 구문의 보안성이 상대적으로 뛰어남
				
		//String sql = "insert into itwill_member(idx,name,gender,age,jumin) values(null, '" + userName + "', '" + userGender + "', " + userAge + ", '" + userJumin +"')";
		// 변수명을 ?문자로 대체
		String sql = "insert into itwill_member(idx,name,gender,age,jumin) values(null, ?, ?, ?, ?)";
		
		//Statement stmt = con.createStatement();
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// pstmt.set~(n, a) - n번째 ?문자를 a값으로 치환
		pstmt.setString(1, userName);
		pstmt.setString(2, userGender);	
		pstmt.setInt(3, userAge);	
		pstmt.setString(4, userJumin);			
		
		// 4. SQL 전송 실행
		
		// 실행의 결과가 테이블에 변화를 주는 경우 executeUpdate() 사용
		//stmt.executeUpdate(sql);
		pstmt.executeUpdate();
		
		System.out.println("SQL 전송 성공!");
		 %>
	
</body>
</html>