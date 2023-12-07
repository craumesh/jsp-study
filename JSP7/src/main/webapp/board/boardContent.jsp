<%@page import="com.itwillbs.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
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
	<%
		BoardDAO bdao = new BoardDAO();
		int bno = Integer.valueOf(request.getParameter("bno"));
		int pageNum = Integer.valueOf(request.getParameter("pageNum"));
		System.out.println("read bno : " + bno);
		bdao.updateReadCount(bno);
		BoardBean bb = bdao.getBoard(bno);
	%>	
	<table border="1" width="700">	
		<tr>
			<th>글번호</th>
			<td><%=bb.getBno() %></td>
			<th>조회수</th>
			<td><%=bb.getReadcount() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=bb.getName() %></td>
			<th>작성일</th>
			<td><%=bb.getDate() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3"><%=bb.getSubject() %></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td colspan="3">
			<%if(bb.getFile() != null) {%>
			<a href="../file/fileDownload.jsp?fileName=<%=bb.getFile()%>"><%=bb.getFile() %></a>
			<%} %>
			</td>
		</tr>
		<tr>
			<td colspan="4"><pre><%=bb.getContent() %></pre></td>
		</tr>
		<tr>
			<td colspan="4">
				<input type="button" value="수정" onclick="location.href='updateForm.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="삭제" onclick="location.href='deleteForm.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="답글"
				 onclick="location.href='reWriteForm.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>&re_ref=<%=bb.getRe_ref()%>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>'">
				<input type="button" onclick="location.href='boardList.jsp?pageNum=<%=pageNum%>'" value="목록">
			</td>
		</tr>
	</table>
</body>
</html>