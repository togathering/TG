<%-- <?xml version="1.0" encoding="euc-kr"?> --%>
<%@page import="java.util.Calendar"%>
<%@page import="t0608.DAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html; charset=euc-kr"
		 pageEncoding='euc-kr'%>
<%-- <%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.ArrayList,java.sql.*" %> --%>
<html>
<head>
<title>��ȸ�����</title>
</head>
<body>
	<%! int count; //=0;%>
	<% 
		/*
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn;
		conn = DriverManager
				.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott","tiger");
		out.print("DB���Ἲ��!!<br>");
		*/
		DAO dao = new DAO(application.getRealPath("/"));
		count = dao.select();
		
		ResultSet rs;
		ArrayList list;
		if(session.isNew()){//ó������������
			count++;
			dao.update(count);
		}
		String addr = request.getRemoteAddr();
		System.out.println("����Ŭ���̾�Ʈ: "+ addr);
		Calendar cal = Calendar.getInstance();
		int h = cal.get(Calendar.HOUR);
		int m = cal.get(Calendar.MINUTE);
		int s = cal.get(Calendar.SECOND);
		
	%>
	<!-- ����� ip�ּҴ� [<%= addr %>] 
	������ �ð�: <% out.print(h+"�� "+m+"�� "+s+"��");%>-->
	�湮�ڼ�: <%= count %>ȸ
	<br> �ҽ������ϼ���~!!
</body>
</html>