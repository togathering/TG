<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<html>
	<head>
		<title>����� ����</title>
		<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
		<style type="text/css">
		<!--
		.normal {  font-family: "����", "����"; font-size: x-small; font-style: normal; font-weight: normal; text-decoration: none}
		.normalbold {  font-family: "����", "����"; font-size: x-small; font-style: normal; font-weight: bold; text-decoration: none}
		-->
		</style>
	</head>

  <body>
  	<%
		//���̵�� �н����忡 ���� ���� �۾�
		String id = request.getParameter("id");
  		String pass = request.getParameter("pass");
  		
  		//���̵�� �н����忡 ���� ���� �۾�(DB�� ��)
  		//DB��ü ----> Map(Ű�� ���� ������ ǥ��)
  		//List<String> list = new ArrayList<String>();
  		Map<String, String> map = new HashMap<String, String>();
  			map.put("gildong", "1234");
  			map.put("lime", "2222");
  			map.put("juwon", "3333");
  			
  				
  			String dpass = map.get(id);
  			if(dpass == null || !dpass.equals(pass)){//�α��ν���
  				
  				response.sendRedirect("sessionT1.jsp");
  			}else{
  				session.setAttribute("login", "success");
  			}
  				
 	 %>
   <center>
   <p class="normalbold">����� ���� �Ϸ�</p>
   <p class="normal"><a href="sessionT3.jsp">����������</a></p>
   </center>
  
  </body>
</html>





