<%@ page contentType="text/html; charset=euc-kr" %>
<html>
 <head><title>Session로그아웃 페이지</title>
   <style type="text/css">
		<!--
		.normal {  font-family: "굴림", "돋움"; font-size: x-small; font-style: normal; font-weight: normal; text-decoration: none}
		.normalbold {  font-family: "굴림", "돋움"; font-size: x-small; font-style: normal; font-weight: bold; text-decoration: none}
		-->
   </style>
 </head>
 <body>
 <%
 	session.invalidate();
 %>
 <p class=normalbold>세션이 종료되었습니다.</p>
 <p class=normal><a href="sessionT3.jsp">서비스 페이지로 이동 해 보죠.</a></p>

</body>
</html>