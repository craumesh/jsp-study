<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionLoginPro.jsp</h1>
	<%!	
	String ownId = "admin";
	String ownPw = "1234";	
	%>
	
	<%
	// 한글처리
	
	request.setCharacterEncoding("UTF-8");
	
	String sId = request.getParameter("id");
	String sPw = request.getParameter("pw");
	System.out.printf("id: %s\npw: %s\n",sId,sPw);
	
	if(sId.equals(ownId)){
		if(sPw.equals(ownPw)){
			System.out.printf("로그인 성공!\n");
			session.setAttribute("id", sId);
			session.setMaxInactiveInterval(60);
			response.sendRedirect("sessionMain.jsp");
		}else{
			System.out.printf("비밀번호 틀림!\n");
		}
	}else{
		System.out.printf("비국민!\n");
	}
	%>
</body>
</html>