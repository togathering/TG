<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ȯ �׽�Ʈ</title>
</head>
<%-- test.jsp --%>
<body>
	<%!
		//���
		int su;//�������
		//su = 13;(X)
		int su2=23;
		//System.out.println("su2"+su2); �޼ҵ�ȣ��(X)
		public String getMsg(){
			return "�ȳ�";
		}
	%>
	<% 
		//(service)�޼ҵ�
		int su3;//��������
		System.out.println("su="+su);
		//System.out.println("su3="+su3); (X) ���������� �ʱ�ȭ�ؼ� ���
		su3=33;
		System.out.println("su3="+su3); //(O)
		
		boolean flag = true;
		if(flag){
			out.println("�÷��״� ��");
		}
	%>
	
	<%= "�ȳ�, JSP" %><br>
	<%= su2 %><br>
	<%= getMsg() %><br>
	<%= 2+3 %><br>
	<%-- <%= getMsg(); --%>

</body>
</html>