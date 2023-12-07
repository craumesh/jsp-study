<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieForm.jsp</h1>
		
	<!-- 액션 속성 값이 없을 겅우 자신의 페이지 호출 -->
		<%
		Cookie[] cookies = request.getCookies();
	
		String value = "kr";
	 	
		if(cookies != null){
		 	for(int i = 0; i < cookies.length; i++){
	            if(cookies[i].getName().equals("lang")){
	                value = cookies[i].getValue();
	            }
	        }	
		}   		
		
		%>		
	
	<form action="cookiePro.jsp" method="get">
		<input type="radio" name="language" value="kr"
		 <%if(value.equals("kr")){ %>
		 checked=""
		 <%} %>
		 > 한국어 <br>
		<input type="radio" name="language" value="en"
		 <%if(value.equals("en")){ %>
		 checked=""
		 <%} %>
		 > 영어 <br><br>
		<input type="submit" value="제출">
	</form>
		<input type="button" value="쿠키 제거" onclick="location.href='cookieThrow.jsp'">
		
	<!-- 설정된 언어값을 사용하여 메세지 출력 -->
	
		<%
		switch(value){
		case "en": %>
		<h1> Hello! This is Cookie Test! </h1>		
		<%
		break;
		case "kr": %>
		<h1> 안녕하세요! 쿠키테스트 입니다! </h1>
		<%
		break;			
		}
		%>

</body>
</html>