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
	<h1>deleteForm.jsp(MVC)</h1>
	<c:if test="${ empty id }">
		<c:redirect url="./MemberLogin.me"/>
	</c:if>
	
	<fieldset>
	<legend>ITWILL 회원탈퇴</legend><br>
		<form action="./MemberDeleteAction.me" name="fr" method="post">
			<h3> 아이디 : <input type="text" name="name" value="${id }" readonly="readonly"></h3>
			<h3> 비밀번호 확인 : <input type="password" name="pw" ></h3>
			<input type="submit" value="탈퇴확인"><br>
		</form>
	</fieldset>
</body>
</html>