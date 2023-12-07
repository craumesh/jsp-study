<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="myColor.jsp" %>
<%!
//	String myColor = "orange";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="<%=myColor%>">
	<h1>itwillMain.jsp</h1>
	<table border="1" width="600px" height="600px">
		<tr>
			<td colspan="2" height="100px"><!-- <h2>ITWILL 부산</h2> -->
			<!-- JSP 액션 태그 -->
			<jsp:include page="../inc/top.jsp"/>
			top - 로고, 메인 메뉴, 로그인창, 검색창</td>
		</tr>
		<tr>
			<td width="100px">
			<jsp:include page="../inc/left.jsp"/>
			left - 서브 메뉴, 광고</td>
			<td>center - 메인페이지(본문)</td>
		</tr>
		<tr>
			<td colspan="2" height="100px">
			<jsp:include page="../inc/bottom.jsp"/>
			bottom - 회사소개, 정보안내</td>
		</tr>
	</table>
</body>
</html>