<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<h1>core_if.jsp</h1>
 	<c:set var="name" value="ITWILL"/>
<%--<c:if test="조건문">
 	조건문이 참일때 실행하는 문장
 	</c:if> --%>
 	<c:if test="${name == 'ITWILL'}">
 		아이티윌!<hr>
 	</c:if>
 	
 	<fieldset>
 		<form>
 			숫자1 : <input type="text" name="num1"><br>
 			숫자2 : <input type="text" name="num2"><br>
 			<input type="submit" value="계산하기">
 		</form>
 	</fieldset>
 	<hr>
 	<h2> 숫자1, 숫자2 중에서 더 큰 값을 출력 </h2>
 	<h3> 문자 비교 </h3>
  	<c:if test="${param.num1 != null && param.num2 != null}">
 		<c:out value="숫자1 : ${param.num1 }"/><br>
 		<c:out value="숫자2 : ${param.num2 }"/><br>
  		<c:out value="결과 : ${param.num1 gt param.num2 ? param.num1 : param.num2 }"/>
 	</c:if>
 	<hr> 	
 	<h3> 정수 비교 </h3>
 	<c:if test="${param.num1 != null && param.num2 != null}">
 		<c:out value="숫자1 : ${param.num1 }"/><br>
 		<c:out value="숫자2 : ${param.num2 }"/><br>
 		<c:set var="num1" value="${Integer.valueOf(param.num1) }"/>
 		<c:set var="num2" value="${Integer.valueOf(param.num2) }"/>
  		<c:out value="결과 : ${Math.max(num1,num2) }"/>
 	</c:if>
 	<hr>
 	
 	<h2> 두 속성의 값이 동일한지 체크 </h2>
 	<c:if test="${param.num1 eq param.num2 && param.num1 != null && param.num2 != null}">
 		<h3>두 값은 동일합니다!</h3>
 	</c:if>
 	<hr>
 	
 	<h2> 조건비교 구문(switch-case와 유사함) </h2>
<%--<c:choose>
		<c:when test="조건1"></c:when>
		<c:when test="조건2"></c:when>
		<c:when test="조건3"></c:when>
		<c:otherwise>
			그외 나머지(else)
		</c:otherwise>
	</c:choose>  --%>
	
	<c:if test="${!empty param.num1 && !empty param.num2}">
		<c:out value="숫자1 : ${num1 }"/><br>
 		<c:out value="숫자2 : ${num2 }"/><br>		
	
		<c:choose>
			<c:when test="${num1 > num2 }">
				<h3><c:out value="${num1 }"/></h3>
			</c:when>
			<c:when test="${num1 < num2 }">
				<h3><c:out value="${num2 }"/></h3>
			</c:when>
			<c:otherwise>
				<h3>두 값은 동일합니다!</h3>
			</c:otherwise>
		</c:choose>
	</c:if>
 	
</body>
</html>