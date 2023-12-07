<%@page import="java.util.ArrayList"%>
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
	<h2>게시판 목록</h2>
	<input type="button" value="글쓰기" onclick="location.href='fileWriteForm.jsp'">	
	
	<%
		BoardDAO dao = new BoardDAO();
		int result = dao.getBoardCount();
	
		/******************** 페이징 처리 1번 *********************/
		// 한페이지에 출력할 글의 개수 설정
		int pageSize = 5;
	
		// 현 페이지가 몇 페이지 인지 확인
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		
		// 시작 행 번호 계산하기 - 1 11 21 31 41
		int currentPage = Integer.valueOf(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		
		// 끝 행 번호 계산하기 - 10 20 30 40 50
		int endRow = currentPage * pageSize;
		
		
		/******************** 페이징 처리 1번 *********************/
		ArrayList boardList = dao.getBoardList(startRow, pageSize);
		
		if(boardList.size() == 0){
			response.sendRedirect("boardList.jsp?pageNum=" + (currentPage - 1));
		}
	%>
	<h3>글 개수 : <%=result %> 개</h3>
		
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>ip</th>
		</tr>	
		<%for(int i = 0; i < boardList.size(); i++){
			BoardBean bb = (BoardBean)boardList.get(i);%>
			<tr>
				<td width="50" align="center"><%=bb.getBno() %></td>
				<!-- 페이징 처리 3 : 페이지 처리 후 다시 리스트로 돌아올 때 기존의 페이지를 유지 하도록 처리 -->
				<td width="500px">
				<%if(bb.getRe_lev() > 0){%><img src="level.gif" width="<%=bb.getRe_lev()*10 %>" height="10"><img src="re.gif"><%}%>
				<a href="boardContent.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>"><%=bb.getSubject() %></a>
				<%if(bb.getFile() != null){%><img src="save.png" height="12"><%}%></td>
				<td width="100px" align="center"><%=bb.getName() %>
				</td>
				<td><%=bb.getDate() %></td>
				<td width="60px" align="center"><%=bb.getReadcount() %></td>
				<td><%=bb.getIp() %></td>
			</tr>		
		<%}%>
	</table>	
	<!-- 페이징 처리 2 -->
	<%if(result != 0){
		int pageCount = result / pageSize + (result % pageSize == 0 ? 0 : 1) + 1;
		
		// 한 화면에 보여줄 페이지 블럭 개수
		int pageBlock = 2;
		
		// 페이지 블럭의 시작 번호 계산
		// 1페이지 => 1		, 11페이지 => 11
		// 5페이지 => 1		, 25페이지 => 21
		%> <h1>current = <%=currentPage %></h1> <%
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		%> <h1>start = <%=startPage %></h1> <%
		
		// 페이지 블럭의 마지막 번호 계산
		// 1페이지 => 10
		// 13페이지 => 20
		int endPage = startPage + pageBlock;
		// 페이지의 글이 없는 경우
		if(endPage > pageCount){
			endPage = pageCount;
		}
	/* 페이징 처리 2 */	
		if(startPage != 1){%>
			<a href="boardList.jsp?pageNum=<%=1 %>"> [처음] </a>
		<%}%>
		
		<%if(startPage > pageBlock){%>
			<a href="boardList.jsp?pageNum=<%=startPage - pageBlock %>"> [이전] </a>
		<%}%>		
		<%for(int i = startPage; i < endPage; i++) { %>	
			<%if(i == Integer.valueOf(pageNum)) {%>
				[<%=i%>]
			<%continue;}%>
			[<a href="boardList.jsp?pageNum=<%=i%>"><%=i%></a>]
		<%}%>
		
		<%if(endPage < pageCount){%>
			<a href="boardList.jsp?pageNum=<%=startPage + pageBlock %>"> [다음] </a>
		<%}%>
		
		<%if(!(endPage >= pageCount)){%>
			<a href="boardList.jsp?pageNum=<%=result / pageBlock + result % pageBlock %>"> [마지막] </a>
		<%}%>
		
	<%}%>
</body>
</html>