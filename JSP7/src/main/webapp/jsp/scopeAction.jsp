<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>scopeAciton.jsp</h1>
	
	아이디(어플리케이션) : <%=application.getAttribute("t1") %><br>
	아이디(리퀘스트) : <%=request.getAttribute("t2") %><br>
	아이디(세션) : <%=session.getAttribute("t3") %><br>
	
	아이디(파라미터) : <%=request.getParameter("id") %><br>
	
	비밀번호(파라미터) : <%=request.getParameter("pw") %>
	
	<hr>
	
	페이지 영역 값 = <%=pageContext.getAttribute("p") %><br>
	리퀘스트 영역 값 = <%=request.getAttribute("r") %><br>
	세션 영역 값 = <%=session.getAttribute("s") %><br>
	어플리케이션 영역 값 = <%=application.getAttribute("a") %>

</body>
</html>