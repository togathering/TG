<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α�����</title>
       
</head>
<body>
<%	
	if(!session.isNew()){
		session.invalidate();	
	}%>
<center>
     <form name="frm"  method="post" action="confirmprocess.jsp">
     <table width=320 border="0" cellpadding="5">
      <tr bgcolor="$3399cc">
         <td height="40"><b><font color="#ffffff"  size="3">Log-In</font> </b></td> 
      </tr>
      <tr>
         <td>
           <a href="userinput.jsp">ȸ�� ����</a>
           <p>����� ���̵�� �н����带 �Է��ϼ���.</p>           
              <p>���̵� : 
                  <input type="text" name="id"></p>
               <p>�н����� : 
                  <input type="password" name="passwd"></p>
               <p>
                   <input type="submit" name="confirm" value="�α���">
                   <input type="reset" value="���">
               
               </p>           
         </td>
      </tr>     
     </table>
     </form>  
   </center>
</body>
</html>