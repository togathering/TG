<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP�⺻�±��׽�Ʈ</title>
</head>
<!-- hello.jsp(HTML�ּ�) -->
<%-- hello.jsp(JSP�ּ�) --%>
<%!
	//���� ��ȯ�� ������(�����������[�� �ʱ�ȭ], �޼ҵ�����(�����))
	int su1=13;
	//su1=23;//�ʱ�ȭX
%>
<body>
	<table border='1'>
	<%
		//Scriptlet ���� ��ȯ�� service()�޼ҵ峻�� �� ����
		//������������, �����ʱ�ȭ, �޼ҵ� ȣ��, if, for
		for(int i=0;i<5;i++){		
	%>
			<tr><td>JSP�ȳ�~!!</td></tr>
	<% 	} %>
<%-- 	
	<%
		for(int i=0;i<5;i++){
			out.print("<tr><td>�浿�ȳ�~!!</td></tr>");
		}
	%>
 --%>	
	</table>
	<hr>
<!-- <%
		out.write(97);
		out.print(97);	
	%>
	<%= "Hello~!!" %>
 -->	
</body>
</html>