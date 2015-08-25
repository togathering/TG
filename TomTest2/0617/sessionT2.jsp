<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<html>
	<head>
		<title>사용자 인증</title>
		<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
		<style type="text/css">
		<!--
		.normal {  font-family: "굴림", "돋움"; font-size: x-small; font-style: normal; font-weight: normal; text-decoration: none}
		.normalbold {  font-family: "굴림", "돋움"; font-size: x-small; font-style: normal; font-weight: bold; text-decoration: none}
		-->
		</style>
	</head>

  <body>
  	<%
		//아이디와 패스워드에 대한 인증 작업
		String id = request.getParameter("id");
  		String pass = request.getParameter("pass");
  		
  		//아이디와 패스워드에 대한 인증 작업(DB와 비교)
  		//DB대체 ----> Map(키와 값의 쌍으로 표현)
  		//List<String> list = new ArrayList<String>();
  		Map<String, String> map = new HashMap<String, String>();
  			map.put("gildong", "1234");
  			map.put("lime", "2222");
  			map.put("juwon", "3333");
  			
  				
  			String dpass = map.get(id);
  			if(dpass == null || !dpass.equals(pass)){//로그인실패
  				
  				response.sendRedirect("sessionT1.jsp");
  			}else{
  				session.setAttribute("login", "success");
  			}
  				
 	 %>
   <center>
   <p class="normalbold">사용자 인증 완료</p>
   <p class="normal"><a href="sessionT3.jsp">서비스페이지</a></p>
   </center>
  
  </body>
</html>





