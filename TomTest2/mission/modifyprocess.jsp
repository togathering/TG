<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean class="mission.dao.UserDAO" id="dao"></jsp:useBean>
<jsp:useBean class="mission.beans.UserInfo" id="info"></jsp:useBean>
<jsp:setProperty property="*" name="info"/>
<%
	info.setZip((String)request.getParameter("zip1")+"-"+(String)request.getParameter("zip2"));
	info.setId((String)session.getAttribute("id"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
  <center>
  	<%
  	try{
  	if(dao.update(info)){ %>
     <table width="280" border="0" cellpadding="5">
          <tr bgcolor="#3399cc">
            <td><b>��������</b></td>
          </tr>
          <tr>
            <td>
               ������ �ߵǾ����ϴ�<br><br>
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
               ���������� �����ʾҽ��ϴ�.<br>
               �Է³����� �ٽ�Ȯ���Ͻð� �ٽü����Ͻñ� �ٶ��ϴ�.<br><br>
               <a href="javascript:history.go(-1)">����ȭ��</a>
            </td>
          </tr>
       </table> 
       
	<%}
  	}catch(Exception e){ %>
       <table width="280" border="0" cellpadding="5">
         <tr bgcolor="#3399cc">
           <td><b>��������</b></td>
         </tr>
         <tr>
           <td>
              ���������� �����ʾҽ��ϴ�.<br>
              �Է³����� �ٽ�Ȯ���Ͻð� �ٽü����Ͻñ� �ٶ��ϴ�.<br>
              �Է��� ��Ȯ�� ��쿡�� ������ ���� �ʴ� ���
              �����ڿ��� �����Ͽ� �ֽʽÿ�.
              <br><br>
              <a href="javascript:history.back(0)">����ȭ��</a>
           </td>
         </tr>
      </table> 
     <%
     } %>
    </center>
</body>
</html>







