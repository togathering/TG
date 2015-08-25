<%@page import="t0609.Calculater"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>계산기</title>
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
	<input type="submit" value="계산">
</form>
	<%
		//if(request.getMethod().equals("POST")){//post로 데이터를 보낸 후에 코드를 실행하여 null값방지
			
			String s1 = request.getParameter("su1");
			String s2 = request.getParameter("su2");
			oper = request.getParameter("oper");
			
			if(s1!=null && s2!=null){ //get으로 데이터를 보낼경우 직접 null값체크를 통해 오류방지
			if(s1.trim().equals("") || s2.trim().equals("")){
				out.print("<font color='red'>데이터를 입력!!</font>");
			}else if(!s1.matches("^[0-9]*$") || !s2.matches("^[0-9]*$")){
				out.print("<font color='red'>숫자만 입력!!</font>");
			}else if(s2.equals("0") && oper.equals("/")){
				out.print("<font color='red'>0으로 나눌수없습니다!!</font>");
			}else{
				su1 = Integer.parseInt(s1);
				su2 = Integer.parseInt(s2);			
				
				Calculater cal = new Calculater(su1, su2, oper);
				
				out.print("<hr>");
				out.print("<font color='blue'>결과값: "+ cal.getResultStr()+"</font>");
			}
			}
		//}
	%>

</body>
</html>