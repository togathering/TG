<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean class="mission.dao.UserDAO" id="dao"/>
<%String id = request.getParameter("id"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	
	function check(){
		id = window.opener.frm.id.value;
		
	}
	
	
	function closeWin(){
		window.close();
	}

</script>
</head>
<body>
  <center>
  	<%
  	if(dao.selectId(id).equals("")) {%>
      <table width="280" border="0" cellpadding="5">
          <tr bgcolor="#3399cc">
            <td><b>��밡��</b></td>
          </tr>
          <tr>
            <td>
                ��밡���� ���̵��Դϴ�^^*
            </td>
          </tr>
       </table> 
           <a href="javascript:self.close()">â�ݱ�</a>
      <%}else{ %>
      <table width="280" border="0" cellpadding="5">
          <tr bgcolor="#3399cc">
            <td><b>���Ұ���</b></td>
          </tr>
          <tr>
            <td>
               �̹� ������� ���̵��Դϴ�.<br>
               �ٸ� ���̵� �����Ͻʽÿ�!!
            </td>
          </tr>
       </table> 
            <input type="button" value="�ݱ�" onclick="closeWin()">
       <%} %>
    
   </center>
</body>
</html>
