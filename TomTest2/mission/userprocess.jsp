<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean class="mission.beans.UserInfo" id="info"/>
<jsp:useBean class="mission.dao.UserDAO" id="dao"/>
<jsp:setProperty property="*" name="info"/>
<%
	info.setJumin((String)request.getParameter("jumin1")+"-"+(String)request.getParameter("jumin2"));
	info.setBirth((String)request.getParameter("year")+"-"+(String)request.getParameter("month")+"-"+(String)request.getParameter("day"));
	info.setZip((String)request.getParameter("zip1")+"-"+(String)request.getParameter("zip2"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����ó�����</title>
</head>
<body>
  <center>      
	<% if(dao.insert(info)){%>
      <table width="330" border="0" cellpadding="5" >
         <tr bgcolor="#3399cc">
           <td><b>${info.name }�� ������ �����մϴ�.</b></td>
         </tr>
         <tr>
           <td>
              �Է��Ͻ� ������ ������ �Ϸ�Ǿ����ϴ�.<br>
              ${info.name }�Բ��� ��û�Ͻ� ���̵�� �н������Դϴ�.
              <p align="center">���̵�:${info.id }<br>
                                    �н�����:${info.pass }<br><br>
                 <a href="userconfirm.jsp">�α��� ȭ��</a>                   
              </p>
           </td>
         </tr>
      </table>
      <%}else{ %>
      
     <table width="330" border="0" cellpadding="5">
        <tr bgcolor="#3399cc">
          <td><b>������ �����ʾҽ��ϴ�.<br>
                    �Է³����� �ٽ� �ѹ� Ȯ���� �ּ���.</b></td>
        </tr>
        <tr>
          <td>            
             <p align="center">�Է��� ��Ȯ�� ��쿡�� ������ ���� �ʴ� ���
              �����ڿ��� �����Ͽ� �ֽʽÿ�.                   
             </p>
          </td>
        </tr>
     </table>  
     <%} %>     
  </center>
</body>
</html>