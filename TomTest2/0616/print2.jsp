<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	//폼안의 name 얻어오기
	request.setCharacterEncoding("euc-kr");
	Enumeration<String> names = request.getParameterNames();
	while(names.hasMoreElements()){
		String name = names.nextElement();
		out.print("name: "+name+",value: "+request.getParameter(name)+"<br>");		
	}
	
	
	String[] subjects = request.getParameterValues("subject");
	out.print("<hr>선택된과목<br>");
	for(int i=0; i<subjects.length;i++){
		out.print(subjects[i]+"<br>");
	}
	
	out.print(request.getMethod()+"<br>");
	out.print(request.getLocalAddr()+"<br>");
	Map<String, String[]> map = request.getParameterMap();
	String [] maps = map.get("subject");
	for(int i=0;i<maps.length;i++){
		out.print(maps[i]+"<br>");
	}
%>
</body>
</html>