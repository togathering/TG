<%@page import="t0609.Calculater"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����</title>
</head>
<%! 
	int su1,su2,result;
	String oper;
%>
<body>
<form method="get">
	<input type="text" name="su1">
	<select name="oper">
		<option>+</option>
		<option>-</option>
		<option>*</option>
		<option>/</option>
	</select> 
	<input type="text" name="su2"> 
	<input type="submit" value="���">
</form>
	<%
		//if(request.getMethod().equals("POST")){//post�� �����͸� ���� �Ŀ� �ڵ带 �����Ͽ� null������
			
			String s1 = request.getParameter("su1");
			String s2 = request.getParameter("su2");
			oper = request.getParameter("oper");
			
			if(s1!=null && s2!=null){ //get���� �����͸� ������� ���� null��üũ�� ���� ��������
			if(s1.trim().equals("") || s2.trim().equals("")){
				out.print("<font color='red'>�����͸� �Է�!!</font>");
			}else if(!s1.matches("^[0-9]*$") || !s2.matches("^[0-9]*$")){
				out.print("<font color='red'>���ڸ� �Է�!!</font>");
			}else if(s2.equals("0") && oper.equals("/")){
				out.print("<font color='red'>0���� �����������ϴ�!!</font>");
			}else{
				su1 = Integer.parseInt(s1);
				su2 = Integer.parseInt(s2);			
				
				Calculater cal = new Calculater(su1, su2, oper);
				
				out.print("<hr>");
				out.print("<font color='blue'>�����: "+ cal.getResultStr()+"</font>");
			}
			}
		//}
	%>

</body>
</html>