<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>reWriteForm.jsp</h1>
	
	<%
		String pageNum = request.getParameter("pageNum");
		int bno = Integer.valueOf(request.getParameter("bno"));
		int re_ref = Integer.valueOf(request.getParameter("re_ref"));
		int re_lev = Integer.valueOf(request.getParameter("re_lev"));
		int re_seq = Integer.valueOf(request.getParameter("re_seq"));
		
	%>
	
	<fieldset>
		<legend>ITWILL 게시판 답글쓰기</legend>
		<form action="reWritePro.jsp?pageNum=<%=pageNum%>" method="post">
			글쓴이 : <input type="text" name="name" size="15"> 비밀번호 : <input type="password" name="pass" size="20"><br>
			제목 : <input type="text" name="subject" size="80" value="[답글]"><br>
			내용 : <textarea rows="20" cols="100" name="content"></textarea><hr>
			<input type="hidden" name="bno" value="<%=bno%>">
			<input type="hidden" name="re_ref" value="<%=re_ref%>">
			<input type="hidden" name="re_lev" value="<%=re_lev%>">
			<input type="hidden" name="re_seq" value="<%=re_seq%>">
			
			<input type="submit" value="작성">
			<input type="button" value="취소" onclick="location.href='boardList.jsp'">
		
		</form>
	
	</fieldset>
	
	
</body>
</html>