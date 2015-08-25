<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>서블릿변환 테스트</title>
</head>
<%-- test.jsp --%>
<body>
	<%!
		//멤버
		int su;//멤버변수
		//su = 13;(X)
		int su2=23;
		//System.out.println("su2"+su2); 메소드호출(X)
		public String getMsg(){
			return "안녕";
		}
	%>
	<% 
		//(service)메소드
		int su3;//지역변수
		System.out.println("su="+su);
		//System.out.println("su3="+su3); (X) 지역변수는 초기화해서 사용
		su3=33;
		System.out.println("su3="+su3); //(O)
		
		boolean flag = true;
		if(flag){
			out.println("플래그는 참");
		}
	%>
	
	<%= "안녕, JSP" %><br>
	<%= su2 %><br>
	<%= getMsg() %><br>
	<%= 2+3 %><br>
	<%-- <%= getMsg(); --%>

</body>
</html>