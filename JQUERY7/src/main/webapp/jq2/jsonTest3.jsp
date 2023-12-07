<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	  
	  $.ajax({
		  url:"json3.jsp",
		  success:function(data){
			  alert(data);
			  console.log(data);
			  $(data).each(function(idx,item){
				  var tmpTable = "<tr>";
				  tmpTable += "<td>"+item.bno+"</td>";
				  tmpTable += "<td>"+item.name+"</td>";
				  tmpTable += "<td>"+item.subject+"</td>";
				  tmpTable += "<td>"+item.date+"</td>";
				  tmpTable += "<td>"+item.readcount+"</td>";
				  tmpTable += "</tr>";
				  $('table').append(tmpTable);
			  })
		  }
	  });
	  
	});
</script>
</head>
<body>
	<h1>jsonTest3.jsp</h1>
	
	<table border="1">
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
	</table>
</body>
</html>