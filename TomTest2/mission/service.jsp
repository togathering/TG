<%@ page contentType="text/html; charset=euc-kr" %>
<html>
 <head><title>������ ������</title>
   <style type="text/css">
		<!--
		.normal {  font-family: "����", "����"; font-size: x-small; font-style: normal; font-weight: normal; text-decoration: none}
		.normalbold {  font-family: "����", "����"; font-size: x-small; font-style: normal; font-weight: bold; text-decoration: none}
		-->
   </style>
 </head>
 <body>
 	<%
 		response.setHeader("Pragma","No-cache");  //HTTP1.0
 	  	response.setHeader("Cache-Control","no-cache");//HTTP1.1
 	  	response.addHeader("Cache-Control","no-store");//��IE������
 	  	response.setDateHeader("Expires",1L);
 		//String login = (String)session.getAttribute("login");
 		Object login = session.getAttribute("login");
 		
 		if(login == null ||!login.equals("success")){
 			response.sendRedirect("userconfirm.jsp");
 		}
 	%>
     <center>
     <p>                
	    <img src="/TomTest2/image/poro.jpg" width="300" height="400">
     </p>
     <p class="normalbold">�� �������� ����� ������ �޾ƾ� �� �� ����!</p>    
     <p class="normal">�����մϴ�....</p>
     <p class="normal"><a href="userconfirm.jsp">�α׾ƿ�</a></p>     
     </center>
 </body>
</html>









