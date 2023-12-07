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
	<h1>updatePro.jsp</h1>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="bb" class="com.itwillbs.board.BoardBean"/>
	<jsp:setProperty property="*" name="bb"/>
	<%
		int pageNum = Integer.valueOf(request.getParameter("pageNum"));
	
		BoardDAO bdao = new BoardDAO();
		int result = bdao.updateBoard(bb);
		
		switch(result){
		case 1: %>
		<script type="text/javascript">
			alert("수정완료!");
			location.href='boardContent.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>';
		</script>
		<% break;
		case 0: %>
		<script type="text/javascript">
			alert("수정 실패! - 비밀번호 오류!");
			history.back();
		</script>	
		<% break;
		case -1: %>
		<script type="text/javascript">
			alert("수정 실패! - 게시판 글 없음!");
			history.back();
		</script>	
		<% break;
		default:
		}
	%>
	
</body>
</html>