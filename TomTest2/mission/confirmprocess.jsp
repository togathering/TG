<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean class="mission.dao.UserDAO" id="dao"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α��� ó��</title>  
  <script type="text/javascript">
     function movePage(){
        location.href="modifyuser.jsp"; 
     }
     
     function movePage2(){
    	 if(confirm("����Ż���Ͻðڽ��ϱ�?")){
    	 	location.href="deleteid.jsp";
    	 }
     }
  </script>
</head>
<%-- confirmprocess.jsp --%>
<body>
  <center>
  	<%
  		String id = request.getParameter("id");
  		if(dao.selectLogin(id).equals(request.getParameter("passwd"))){
  			session.setAttribute("login", "success");
  			session.setAttribute("id", id);
  		
  	%>
    		  <table width="280" border="0" cellpadding="5">
              <tr bgcolor="#3399cc">
                <td><b>�α��� ����</b></td>
              </tr>
              <tr>
                <td>
                   �Է��Ͻ� ���̵�� �н����带<br> Ȯ���߽��ϴ�.
                   <br><br>
                    <input type="button" value="ȸ����������"  
                              onclick="movePage()" >
                    <input type="button" value="ȸ��Ż��"  
                    		  onclick="movePage2()">
                   <br><br>
                   <a href="service.jsp">����ȭ��</a>
                </td>
              </tr>
           </table>  
    	  <%}else if(!dao.selectLogin(id).equals("")){ %>
           <table width="280" border="0" cellpadding="5">
              <tr bgcolor="#3399cc">
                <td><b>�α��� ����</b></td>
              </tr>
              <tr>
                <td>
                   �н����尡 Ʋ���ϴ�.<br>
                   �н����带 �ٽ��ѹ� Ȯ���� �ֽñ� �ٶ��ϴ�.<br><br>
                   <a href="userconfirm.jsp">�α���ȭ��</a>
                </td>
              </tr>
           </table>  
    	 <%}else{ %>
    	  <table width="280" border="0" cellpadding="5">
          <tr bgcolor="#3399cc">
            <td><b>�α��� ����</b></td>
          </tr>
          <tr>
            <td>
               �ٽ� ���̵� Ȯ���ϼ���.<br>
               ���� �������� ������ ��� �ű԰����� �Ͻñ� �ٶ��ϴ�.<br><br>
               <a href="userinput.jsp">�ű԰���</a>
            </td>
          </tr>
          </table>     
          <%} %>  	 
  </center>
</body>
</html>








