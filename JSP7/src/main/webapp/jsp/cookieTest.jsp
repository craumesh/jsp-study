<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieTest.jsp</h1>
	<h2> 클라이언트 </h2>
	
	<%	 	
		Cookie[] cookies = request.getCookies();
	
		String name = "";
    	Object value = 0;
	 	
    	if(cookies != null){
		 	for(int i = 0; i < cookies.length; i++){
	            if(cookies[i].getName().equals("sc")){
	                name = cookies[i].getValue();
	                value = session.getAttribute("ovenTime");
	            }
	        }	
    	}    	
	%>
	
	쿠키 : <%=name%> <br>
	오븐 : <%=value%> <br>	
	
	<input type="button" value="쿠키 굽기" onclick=location.href="cookieSet.jsp">
	<input type="button" value="쿠키 버리기" onclick=location.href="cookieThrow.jsp">
</body>
</html>