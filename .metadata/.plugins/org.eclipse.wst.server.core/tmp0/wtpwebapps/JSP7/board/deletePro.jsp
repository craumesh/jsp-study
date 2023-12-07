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
	<h1>deletePro.jsp</h1>
	
	<jsp:useBean id="bb" class="com.itwillbs.board.BoardBean"/>
	<jsp:setProperty property="*" name="bb"/>
	
	<%
		request.setCharacterEncoding("UTF-8");
		String pageNum = request.getParameter("pageNum");
		
		BoardDAO bdao = new BoardDAO();			
		int result = bdao.deleteBoard(bb);
		
		switch(result){
		case 1: %>
		<script type="text/javascript">
			alert("삭제완료!");
			location.href='boardList.jsp?pageNum=<%=pageNum%>';
		</script>
		<% break;
		case 0: %>
		<script type="text/javascript">
			alert("삭제 실패! - 비밀번호 오류!");
			history.back();
		</script>	
		<% break;
		case -1: %>
		<script type="text/javascript">
			alert("삭제 실패! - 게시판 글 없음!");
			history.back();
		</script>	
		<% break;
		default:
		}
	%>
</body>
</html>