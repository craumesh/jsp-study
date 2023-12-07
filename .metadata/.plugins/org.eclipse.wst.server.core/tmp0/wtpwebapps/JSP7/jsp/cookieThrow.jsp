<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieThrow.jsp</h1>
	<%
	String referer = (String)request.getHeader("REFERER");
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null){
		for(int i = 0; i < cookies.length; i++){
			if(cookies[i].getName().equals("sc")){
				cookies[i].setMaxAge(0);				
				response.addCookie(cookies[i]);
				response.sendRedirect("cookieSet.jsp");
			}
			if(cookies[i].getName().equals("lang")){
				cookies[i].setMaxAge(0);				
				response.addCookie(cookies[i]);
				response.sendRedirect("cookieForm.jsp");
			}
		}	
	} 
	%>
</body>
</html>