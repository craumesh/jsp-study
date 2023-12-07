<%@page import="com.itwillbs.board.BoardBean"%>
<%@page import="com.itwillbs.board.BoardDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>fileWritePro.jsp</h1>
	
	<%
		// 첨부파일 업로드
		
		// upload 폴더 생성 - 완료
		String realPath = request.getRealPath("/upload");
		System.out.println("realPath : " + realPath);
		
		// 파일 크기 제한
		int maxSize = 5 * 1024 * 1024;
		
		// MultipartRequest 객체 생성
		MultipartRequest multi = new MultipartRequest(
				request, 
				realPath,
				maxSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
		
		System.out.println("첨부파일 업로드 완료!");
		
		// 전달받은 정보(파라메터) 처리
		// => DB에 저장 (액션 태그 사용 불가)
		
		BoardBean bb = new BoardBean();
		bb.setName(multi.getParameter("name"));
		bb.setPass(multi.getParameter("pass"));
		bb.setSubject(multi.getParameter("subject"));
		bb.setFile(multi.getFilesystemName("file"));
		bb.setContent(multi.getParameter("content"));
		bb.setIp(request.getRemoteAddr());
		
		BoardDAO bdao = new BoardDAO();
		bdao.insertBoard(bb);		
		
		// 페이지 이동(boardList.jsp)
		response.sendRedirect("boardList.jsp");
	
	%>
</body>
</html>