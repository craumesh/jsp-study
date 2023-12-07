<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>member/logoutPro.jsp</h1>
	<%
		session.invalidate();
	%>
	
	<script type="text/javascript">
		alert("회원님의 정보는 로그아웃 후 개발자가 맛있게 먹었습니다!");
		location.href="main.jsp";
	</script>
</body>
</html>