<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>scopePro.jsp</h1>
	<%
	String sId = request.getParameter("id");
	Object sPa = pageContext.getAttribute("p2");
	%>
	아이디 : <%=sId %> <hr>
	
	<h2> 영역객체 생성 </h2>
	<%
		// 해당 페이지에서만 사용 가능
		pageContext.setAttribute("p", "pageValue!");
		request.setAttribute("r", "requestValue!");
		session.setAttribute("s", "sessionValue!");
		application.setAttribute("a", "appllicationValue!");
		
		application.setAttribute("t1", request.getParameter("id"));
		request.setAttribute("t2", request.getParameter("id"));
		session.setAttribute("t3", request.getParameter("id"));
	%>
	
	<h2> 영역객체 사용 </h2>
	
	페이지 영역 값 = <%=pageContext.getAttribute("p") %><br>
	페이지 영역 값 = <%=sPa %><br>
	페이지 영역 값 = <%=pageContext.getAttribute("p2") %><br>
	리퀘스트 영역 값 = <%=request.getAttribute("r") %><br>
	세션 영역 값 = <%=session.getAttribute("s") %><br>
	어플리케이션 영역 값 = <%=application.getAttribute("a") %>
	
	<hr>
	
	<h2> 페이지 이동시 영역객체 사용 </h2>
	
	<h2> 1. HTML 코드 : a태그 </h2>
	<h3> 전달 가능 데이터 : 파라미터, 세션, 어플리케이션 영역 데이터</h3>
	<a href="scopeAction.jsp?id=<%=sId%>&pw=1234">scopeAction</a>
	
	<h2> 2. JAVASCRIPT : location.href </h2>
	<h3> 전달 가능 데이터 : 파라미터, 세션, 어플리케이션 영역 데이터</h3>
	<script type="text/javascript">
		alert("js코드 페이지이동!");
		location.href="scopeAction.jsp?id=<%=sId%>&pw=1234";
	</script>
	
	<h2> 3. JSP : response.sendRedirect </h2>
	<h3> 전달 가능 데이터 : 파라미터, 세션, 어플리케이션 영역 데이터</h3>
	<%
		// JSP 파일 실행순서
		// JSP(java) => HTML => JavaScript
		// * JSP 코드, JS 코드 페이지 이동 처리는 둘 중에 하나만 사용
		//response.sendRedirect("scopeAction.jsp?id=" + sId + "&pw=1234");
	%>
	
	<!--  포워딩(forward) :
		 1. request 영역 정보 전달가능
		 2. 주소 변경 X, 실행 화면만 변경
	-->
	<h2> 4. 액션 태그 : forward </h2>
	<h3> 전달 가능 데이터 : 파라미터, 리퀘스트, 세션, 어플리케이션 영역 데이터</h3>
	
	<jsp:forward page="scopeAction.jsp?id=<%=sId%>&pw=1234"></jsp:forward>
	
</body>
</html>