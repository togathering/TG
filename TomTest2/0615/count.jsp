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
<title>조회수출력</title>
</head>
<body>
	<%! int count; //=0;%>
	<% 
		/*
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn;
		conn = DriverManager
				.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott","tiger");
		out.print("DB연결성공!!<br>");
		*/
		DAO dao = new DAO(application.getRealPath("/"));
		count = dao.select();
		
		ResultSet rs;
		ArrayList list;
		if(session.isNew()){//처음접속했을때
			count++;
			dao.update(count);
		}
		String addr = request.getRemoteAddr();
		System.out.println("접속클라이언트: "+ addr);
		Calendar cal = Calendar.getInstance();
		int h = cal.get(Calendar.HOUR);
		int m = cal.get(Calendar.MINUTE);
		int s = cal.get(Calendar.SECOND);
		
	%>
	<!-- 당신의 ip주소는 [<%= addr %>] 
	접속한 시간: <% out.print(h+"시 "+m+"분 "+s+"초");%>-->
	방문자수: <%= count %>회
	<br> 소스보기하세요~!!
</body>
</html>