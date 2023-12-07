<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate();
		System.out.println("세션값 초기화");
	%>
	
	<script type="text/javascript">
		alert("세션 정보 초기화중...");
		location.href="sessionTest.jsp";
	</script>
</body>
</html>