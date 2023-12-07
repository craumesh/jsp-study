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
	request.setCharacterEncoding("UTF-8");

	Cookie cookie = new Cookie("lang", request.getParameter("language"));
	cookie.setMaxAge(60);
	response.addCookie(cookie);		
%>

<script type="text/javascript">
	alert("언어 설정 완료!");
	location.href="cookieForm.jsp";
</script>

</body>
</html>