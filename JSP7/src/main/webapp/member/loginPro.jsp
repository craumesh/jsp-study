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
	<h1>member/loginPro.jsp</h1>
	<%
	// 한글처리
		request.setCharacterEncoding("UTF-8");
	%>
	
	<!-- 전달정보 (파라미터) 저장 --> 
		<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"/>
		
	<%
		//mb.setId(request.getParameter("id"));
		//mb.setPw(request.getParameter("pw"));		
	%>
		<jsp:setProperty property="*" name="mb"/>
		
	<%
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		if(!mb.getId().equals("")){			
			Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
			String sql = "select pw from itwill_member where id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			ResultSet rs =  pstmt.executeQuery();
			
			if(rs.next()){
				if(mb.getPw().equals(rs.getString("pw"))){
					System.out.printf("로그인 성공!\n");
					session.setAttribute("id", mb.getId());
					session.setAttribute("pw", mb.getPw());
					session.setMaxInactiveInterval(60);
					response.sendRedirect("main.jsp");
				} else{
					System.out.printf("비밀번호 틀림!\n");
					%>
						<script type="text/javascript">
							alert("비밀번호 오류!");
							history.back();
						</script>
					<%
				}
			} else{
				System.out.printf("비회원!\n");
				%>
					<script type="text/javascript">
						//alert("로그인 실패!");
						var joinResult = confirm("로그인 실패! 비회원 입니다, 회원가입 하시겠습니까?");
						if(joinResult){
							location.href="insertForm.jsp";
						}else{
							history.back(); 
						}
					</script>				
				<%
			}
		}
	%>
</body>
</html>