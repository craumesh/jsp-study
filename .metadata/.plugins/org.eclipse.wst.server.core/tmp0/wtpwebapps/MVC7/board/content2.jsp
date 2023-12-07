<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> board/content.jsp </h1>
	<table border="1" width="700">	
		<tr>
			<th>글번호</th>
			<td>${dto.getBno() }</td>
			<th>조회수</th>
			<td>${dto.getReadcount() }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.getName() }</td>
			<th>작성일</th>
			<td>${dto.getDate() }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">${dto.getSubject() }</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td colspan="3">
				
			</td>
		</tr>
		<tr>
			<td colspan="4"><pre>${dto.getContent()}</pre></td>
		</tr>
		<tr>
			<td colspan="4">
				<input type="button" value="수정" onclick="location.href='updateForm.jsp?bno=${dto.getBno()}&pageNum=${pageNum}'">
				<input type="button" value="삭제" onclick="location.href='deleteForm.jsp?bno=${dto.getBno()}&pageNum=${pageNum}'">
				<input type="button" value="답글"
				 onclick="location.href='reWriteForm.jsp?bno=${dto.getBno()}&pageNum=${pageNum}&re_ref=${dto.getRe_ref()}&re_lev=${dto.getRe_lev()}&re_seq=${dto.getRe_seq()}'">
				<input type="button" onclick="location.href='./BoardList.bo?pageNum=${pageNum}'" value="목록">
			</td>
		</tr>
	</table>
</body>
</html>