<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test2.jsp</h1>
	<h2>JAVA/JSP 사용해서 정보 출력</h2>
	
	<%
		String[] arr = {"JAVA", "JSP", "JS", "WEB", "DB"};
		
		for(int i = 0; i < arr.length; i++){
			System.out.printf(" %s",arr[i]);
		}
		
		for(int i = 0; i < arr.length; i++){
			out.print(arr[i] + " ");
		}
		
		for(int i = 0; i < arr.length; i++){
	%>
			<h1>안녕 <%=arr[i] %> <%out.print(arr[i] + " ");%></h1>
	<%
		}
	%>
	
	<hr>
	<table border = "1">
		<tr>
			<td>1</td>
			<td>JAVA</td>
		</tr>
		<tr>
			<td>2</td>
			<td>JSP</td>
		</tr>
		<tr>
			<td>3</td>
			<td>JS</td>
		</tr>
		<tr>
			<td>4</td>
			<td>WEB</td>
		</tr>
		<tr>
			<td>5</td>
			<td>DB</td>
		</tr>
	</table>
	
	<hr>
	
	<%
		String tag = "";
		tag += "<table border = '1'>";
		for(int i = 0; i < arr.length; i++){
			tag += "<tr>";
			tag += "<td>";
			tag += i + 1;
			tag += "</td>";
			tag += "<td>";
			tag += arr[i];
			tag += "</td>";
			tag += "</tr>";			
		}
		tag += "</table>";
		out.print(tag);
	%>
	
	<hr>
	<table border = '1'>
	<%
	for(int i = 0; i < arr.length; i++){
	%>
		<tr>
			<td>
				<%=i+1 %>
			</td>
			<td>
				<%=arr[i] %>
			</td>
		</tr>
	<%
	}
	%>
	</table>
</body>
</html>