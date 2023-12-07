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
	<h1>insert.jsp (SQL구문 실행)</h1>
	
	<%
		// 0. 드라이버(라이브러리) 설치 (프로젝트 당 1번)
		// WEB-INF/lib/mysql-connector-j-8.1.0.jar 파일 추가
		
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
		System.out.println("DB 연결 성공!\ncon : " + con);
		
		// 3. SQL 구문 작성 & stmt 객체 생성
		// Statement - SQL 구문을 실행하게 하는 객체 
		Statement stmt = con.createStatement();
		System.out.println("객체 생성 성공!\nstmt : " + stmt);
		
		// SQL 구문에는 ; 제거해야함
		String sql = "insert into itwill_member(idx,name,gender,age,jumin) values(null, '아이티윌', 'M', 22, '000000-1234567')";
		
		// 4. SQL 실행
		stmt.executeUpdate(sql);
		
		sql = "insert into itwill_member(idx,name,gender,age,jumin) values(null, '홍길동', 'M', 101, '159753-1234567')";
		stmt.executeUpdate(sql);
		sql = "insert into itwill_member(idx,name,gender,age,jumin) values(null, '홍진호', 'M', 22, '222222-2222222')";
		stmt.executeUpdate(sql);
		System.out.println("정상 실행 완료!");
		
		
		
	%>
	
	
	
</body>
</html>