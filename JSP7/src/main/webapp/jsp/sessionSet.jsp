<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionSet.jsp</h1>
	<h2> 서버 </h2>
	
	<%
		//사용자 정보를 세션 영역에 저장
		session.setAttribute("userName", "ITWILL");
		session.setAttribute("userTel", "010-1234-7894");
		System.out.println("세션값 생성");
	%>
	
	<script type="text/javascript">
		alert("클라이언트 요청 처리중...");
		location.href="sessionTest.jsp";
	</script>
</body>
</html>