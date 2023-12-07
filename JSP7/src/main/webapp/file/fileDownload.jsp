<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>./file/fileDownload.jsp</h1>
	
	<%
		String fileName = request.getParameter("fileName");
	
		// 서버에 업로드되는 폴더
		String savePath = "upload";
		
		// 서버 내에 들어있는 업로드 폴더 위치(realPath)
		// 프로젝트 정보를 가져오기
		ServletContext CTX = getServletContext();
		// 업로드 폴더의 실제 위치 정보 가져오기
		String downloadPath = CTX.getRealPath(savePath);	
		System.out.println("downloadPath : " + downloadPath);
		
		// 최종적으로 다운로드할 파일의 위치 가져오기
		String dFilePath = downloadPath + "\\" + fileName;
		System.out.println("dFilePath : " + dFilePath);
		
		// 데이터 전송 배열(버퍼)
		byte[] b = new byte[4096]; // 4KB
		
		// 파일을 열어서 읽을 수 있는 객체
		FileInputStream fis = new FileInputStream(dFilePath);
		
		// MIME 타입 설정
		String mimeType = getServletContext().getMimeType(dFilePath);
		if(mimeType == null){
			mimeType = "application/octet-stream";
		}
		System.out.println("mimeType : " + mimeType);
		
		// 응답할 페이지의 타입을 마임타입으로 설정(각 타입별 준비)
		response.setContentType(mimeType);
		
		// 인코딩
		String agent = request.getHeader("User-Agent");
		
		// 익스플로러 브라우저를 사용하는 경우를 체크
		boolean ieBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1);
		
		if(ieBrowser){
			// true 일때
			fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+","%20");
		} else {
			// false 일때
			fileName = new String(fileName.getBytes("UTF-8"),"iso-8859-1");
		}
		
		// 모든 파일의 다운로드시 일반적인 다운로드 형태로 적용
		response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
		
		// 기본 아웃풋 스트림 초기화
		out.clear();
		out = pageContext.pushBody();
		
		// 파일을 다운로드(= 파일을 출력)
		ServletOutputStream out2 = response.getOutputStream();
		
		// 출력
		int data = 0;
		while((data = fis.read(b,0,b.length)) != -1){ // 파일의 종료(-1)까지 진행
			out2.write(b,0,data);
		}
		
		out2.flush();
		
		// 자원 해제
		out2.close();
		fis.close();
	%>
	
	
</body>
</html>