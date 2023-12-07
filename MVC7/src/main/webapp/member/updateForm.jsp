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
	<h1>updateForm.jsp</h1>
	<c:if test="${ empty id }">
		<c:redirect url="./MemberLogin.me"/>
	</c:if>
	
	<fieldset>
	<legend>ITWILL 회원정보수정</legend><br>
		<form action="./MemberUpdateProAction.me" name="fr" method="post">
			<h3> 아이디 : <input type="text" name="name" value="${dto.getId() }" readonly="readonly"></h3>
			<h3> 비밀번호 : <input type="password" name="pw" ></h3>
			<h3> 이름 : <input type="text" name="name" value="${dto.getName() }"></h3>
			<h3> 성별 : <input type="text" name="name" value="${dto.getGender() }" readonly="readonly"></h3>
			<h3> 나이 : <input type="text" name="name" value="${dto.getAge() }" readonly="readonly"></h3>
			<h3> 이메일 : <input type="email" name="email" value=${dto.getEmail() }></h3><hr>
			<input type="submit" value="수정완료"><br>
		</form>
	</fieldset>
</body>
</html>