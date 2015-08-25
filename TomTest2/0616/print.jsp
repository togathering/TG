<%@page import="hangul.Korean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%! String name;
		String age;
		String job;
		String pass;
		String gender;
		String subject;
		String memo;
	%>

	<%
		//request.setCharacterEncoding("EUC-KR");//주의점!! : 클라이언트 요청방식이 post였을때만 적용!!					
			name = Korean.toHangul(request.getParameter("name"));
			age = request.getParameter("age");
			job = Korean.toHangul(request.getParameter("job"));
			pass = request.getParameter("pass");
			gender = Korean.toHangul(request.getParameter("gender"));
			//subject = Korean.toHangul(request.getParameter("subject"));
			String [] subjects = request.getParameterValues("subject");
			for (int i=0;i<subjects.length;i++){
				if(subject!=null){
					subject=subject+" "+Korean.toHangul(subjects[i]);
				}else{
					subject=Korean.toHangul(subjects[i]);
				}
					
			}
			memo = Korean.toHangul(request.getParameter("memo")); 
	
	%>
	<center>
	<h3>출력폼</h3>
	<hr>
	<table>
	<tr>
		<td>이름: <input type="text" size='5' value="<%= name %>"></td>
	</tr>
	<tr>
		<td>나이: <input type="text" size='5' value="<%= age %>"><br></td>
	</tr>
	<tr>
		<td>직업: <input type="text" size='5' value="<%= job %>"></td>
	</tr>
	<tr>
		<td>비번: <input type="text" value="<%= pass%>"> </td>
	</tr>
	<tr>
		<td>성별: <input type="text" value="<%= gender%>"></td>
	</tr>
	<tr>
		<td>과목: <input type="text" value="<%= subject%>"></td>
	</tr>
	<tr>
		<td>메모: <textarea rows="5" cols="20"><%= memo%></textarea></td>
	</tr>
	</table><br>
	<img src='/TomTest2/image/poro.jpg' height='300' width='250'>
	<img alt="포로" src='/TomTest2/image/포로.jpg' height='300' width='250'>
	</center>
</body>
</html>