<%@ page contentType="text/html; charset=euc-kr" %>
<html>
 <head><title>인증자 페이지</title>
   <style type="text/css">
		<!--
		.normal {  font-family: "굴림", "돋움"; font-size: x-small; font-style: normal; font-weight: normal; text-decoration: none}
		.normalbold {  font-family: "굴림", "돋움"; font-size: x-small; font-style: normal; font-weight: bold; text-decoration: none}
		-->
   </style>
 </head>
 <body>
 	<%
 		response.setHeader("Pragma","No-cache");  //HTTP1.0
 	  	response.setHeader("Cache-Control","no-cache");//HTTP1.1
 	  	response.addHeader("Cache-Control","no-store");//비IE브라우저
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
     <p class="normalbold">이 페이지는 사용자 인증을 받아야 볼 수 있죠!</p>    
     <p class="normal">감사합니다....</p>
     <p class="normal"><a href="userconfirm.jsp">로그아웃</a></p>     
     </center>
 </body>
</html>









