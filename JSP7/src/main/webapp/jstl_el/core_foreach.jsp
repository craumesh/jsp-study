<%@page import="java.util.ArrayList"%>
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
	<h1>core_foreach.jsp</h1>
	
	<%	for(int i = 0; i < 3; i++){%>
			안녕못하세요<br>
	<%	}%>
	
	<h1> JSTL을 사용한 반복문 foreach(step에 감소식 사용 불가) </h1>
	<c:forEach begin="1" end="3" step="1">
		반복문의 조건이 참일때 실행<br>
	</c:forEach>
	<hr>
	<h2> 1~10까지의 숫자를 화면에 가로로 출력 </h2>
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:out value="${i }"/>
	</c:forEach>
	<hr>
	<h2> 1~20까지의 숫자중에 홀수만 화면에 가로 출력 </h2>
	<c:forEach var="i" begin="1" end="20" step="1">
		<c:if test="${i%2 != 0 }">
			<c:out value="${i }"/>		
		</c:if>
	</c:forEach>
	<hr>
	
	<%
		ArrayList arr = new ArrayList();
		for(int i = 0; i < 10; i++){
			arr.add(i*10);
		}
		pageContext.setAttribute("arr", arr);
	%>
	
	<h2> 배열에 들어있는 요소를 출력 </h2>
	<c:forEach var="i" begin="0" end="${arr.size() }" step="1">
		<c:out value="${arr[i] }"/>
	</c:forEach>
	<hr>
	<c:forEach items="${arr }" var="num">
		<c:out value="${num }"/>
	</c:forEach>
	<hr>
	<c:forEach var="pv" items="${personVector }"><br>
		<c:out value="이름 : ${pv.name }"/><br>
		<c:out value="나이 : ${pv.age }"/><br>
		<c:out value="기종 : ${pv.phone.model }"/><br>
		<c:out value="번호 : ${pv.phone.tel }"/><br>
	</c:forEach>
	<hr>
	<c:forTokens var="tmp" items="a,b,c,d,e,f,g" delims=",">
		<c:out value="${tmp }"/>
	</c:forTokens>
	
</body>
</html>