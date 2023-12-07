<%@page import="com.itwillbs.board.BoardBean"%>
<%@page import="com.itwillbs.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>updateForm.jsp</h1>
	<%
		BoardDAO bdao = new BoardDAO();
		int bno = Integer.valueOf(request.getParameter("bno"));
		int pageNum = Integer.valueOf(request.getParameter("pageNum"));
		BoardBean bb = bdao.getBoard(bno);
	%>
	
	<fieldset>
		<legend>ITWILL 게시판 글수정</legend>
		<form action="updatePro.jsp?pageNum=<%=pageNum%>" method="post">
			글쓴이 : <input type="text" name="name" size="15" value="<%=bb.getName()%>" readonly="readonly"> 비밀번호 : <input type="password" name="pass" size="20" placeholder="비밀번호를 입력하세요!"><br>
			제목 : <input type="text" name="subject" size="80" value="<%=bb.getSubject()%>"><br>
			내용 : <textarea rows="20" cols="100" name="content"><%=bb.getContent()%></textarea><hr>
			<input type="hidden" name="bno" value="<%=bno%>">
			<input type="submit" value="완료" >
			<input type="button" value="취소" onclick="location.href='boardContent.jsp?bno=<%=bno%>&pageNum=<%=pageNum%>'">
		
		</form>
	
	</fieldset>
	
	
</body>
</html>