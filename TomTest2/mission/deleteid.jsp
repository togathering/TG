<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean class="mission.dao.UserDAO" id="dao"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
  <center>
  	<% if(dao.delete((String)session.getAttribute("id"))){
  			session.invalidate();%>
             <table width="280" border="0" cellpadding="5">
    	          <tr bgcolor="#3399cc">
    	            <td><b>��������</b></td>
    	          </tr>
    	          <tr>
    	            <td>
    	               ������ �ߵǾ����ϴ�.<br>
    	               �̿��� �ּż� �����մϴ�.
    	               <br><br>
    	               <a href="service.jsp">����������</a>
    	            </td>
    	          </tr>
    	       </table> 
    	    <%}else{ %>
    	      <table width="280" border="0" cellpadding="5">
    	          <tr bgcolor="#3399cc">
    	            <td><b>��������</b></td>
    	          </tr>
    	          <tr>
    	            <td>
    	               ������ �����ʾҽ��ϴ�.<br>
    	               ��� �� �ٽ� �õ��� ���ñ� �ٶ��ϴ�.<br><br>
    	               <a href="javascript:history.go(-1)">����ȭ��</a>
    	            </td>
    	          </tr>
    	       </table> 	    
    	    <%} %>    	   
   </center>
</body>
</html>










