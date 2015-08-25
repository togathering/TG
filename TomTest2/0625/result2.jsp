<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>결과페이지</title>
</head>
<body>
	<h3>결과페이지</h3>
	<hr>
	<%
		String savePath = application.getRealPath("/upload");
		int maxSize=1*1024*1024; // byte단위 -> 1mb 제한
		MultipartRequest mr = new MultipartRequest(request, savePath,maxSize,"euc-kr", new DefaultFileRenamePolicy());
		out.print("파일업로드 성공~!!<br>");
		
		out.print(mr.getParameter("name")+"<br>");
		
		out.print(mr.getOriginalFileName("myfile")+"<br>");
		out.print(mr.getFilesystemName("myfile")+"<br>");
	%>
</body>
</html>