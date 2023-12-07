<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>deleteForm.jsp</h1>
	<h2> 게시판 글 삭제 </h2>
	
	<%
		request.setCharacterEncoding("UTF-8");
		int bno = Integer.valueOf(request.getParameter("bno"));
		String pageNum = request.getParameter("pageNum");
	%>
	
	<fieldset>
		<legend> 글 삭제하기 </legend>
		<form action="deletePro.jsp?pageNum=<%=pageNum %>" method="post">
			<input type="hidden" name="bno" value="<%=bno %>">
			글 비밀번호 : <input type="password" name="pass">
			<input type="submit" value="삭제">
		</form>
	</fieldset>
</body>
</html>