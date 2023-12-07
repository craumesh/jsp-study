<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieSet.jsp</h1>
	<h2> 서버 </h2>
	
	<%
		// 쿠키 생성(API)
		Cookie cookie1 = new Cookie("sc", "sweetCookie");
	
		// 쿠키 설정
		cookie1.setMaxAge(60);
				
		session.setAttribute("ovenTime", cookie1.getMaxAge());
		
		// 쿠키 전송
		response.addCookie(cookie1);
	%>
	
	<script type="text/javascript">
		alert("쿠키잇!");
		location.href="cookieTest.jsp";
	</script>
</body>
</html>