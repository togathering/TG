<%@page import="java.io.FileOutputStream"%>
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
	<%request.setCharacterEncoding("euc-kr"); %>
	<% 
		InputStream is = request.getInputStream(); 
		BufferedReader br = new BufferedReader(new InputStreamReader(is));
		String str;
		String path = application.getRealPath("/");
		//String delimiter = br.readLine();
		FileOutputStream fo = null;
		while((str=br.readLine()) != null){
			if(str.contains("name=\"myfile\"")){
				
				int start = str.lastIndexOf("\"",str.length()-2);
				fo = new FileOutputStream(path+"upload2/"+str.substring(start+1,str.length()-1));
				br.readLine();
				br.readLine();
				break;
			}
		}
		fo.write(br.readLine().getBytes());
		fo.write(br.readLine().getBytes());
		
		fo.write(br.readLine().getBytes());
		fo.write(br.readLine().getBytes());
	%>
	<%-- 이름: <%= request.getParameter("name") %><br>--%>
	<%-- 파일: <%= request.getParameter("myfile") %><br>--%>
</body>
</html>