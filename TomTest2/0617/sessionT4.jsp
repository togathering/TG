<%@ page contentType="text/html; charset=euc-kr" %>
<html>
 <head><title>Session�α׾ƿ� ������</title>
   <style type="text/css">
		<!--
		.normal {  font-family: "����", "����"; font-size: x-small; font-style: normal; font-weight: normal; text-decoration: none}
		.normalbold {  font-family: "����", "����"; font-size: x-small; font-style: normal; font-weight: bold; text-decoration: none}
		-->
   </style>
 </head>
 <body>
 <%
 	session.invalidate();
 %>
 <p class=normalbold>������ ����Ǿ����ϴ�.</p>
 <p class=normal><a href="sessionT3.jsp">���� �������� �̵� �� ����.</a></p>

</body>
</html>