<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����ڵ��</title>
<script type="text/javascript">
	function movePage(){
		var id = document.frm.id.value;
		if(id==""){alert("���̵� �Է�!!"); return;}
		newWin = window.open("confirmid.jsp?id="+id,'confirm','toolbar=no,scrollbars=no,top=200,left=300,width=300,height=200')		
	}
	
	function check(){
		id = document.frm.id.value;
		name = document.frm.name.value;
		pass = document.frm.pass.value;
		pass2 = document.frm.pass2.value;
		jumin1 = document.frm.jumin1.value;
		jumin2 = document.frm.jumin2.value;
		year = document.frm.year.value;
		month = document.frm.month.value;
		day = document.frm.day.value;
		zip1 = document.frm.zip1.value;
		zip2 = document.frm.zip2.value;
		addr = document.frm.addr.value;
		email = document.frm.email.value;
		job = document.frm.job.value;
		
		var email_Exp = new RegExp('^[a-zA-Z0-9]{6,15}@[a-zA-Z]+[.][a-zA-Z]+$','g');
		
		if(id==""){
			alert("���̵� �Է��ϼ���");
			return false;
		}else if(name==""){
			alert("�̸��� �Է��ϼ���");
			return false;
		}else if(pass=="" || pass2==""){
			alert("����Է�!!");
			return false;
		}else if(pass!=pass2){
			alert("��й�ȣ�� ���� �ٸ��ϴ�");
			return false;
		}else if(jumin1=="" || jumin2==""){
			alert("�ֹι�ȣ�Է�!");
			return false;
		}else if(email==""){
			alert("�̸��� �Է�!!");
			return false;
		}else if(isNaN(jumin1) || isNaN(jumin2)){
			alert("�ֹι�ȣ�� Ȯ��!!");
			return false;
		}else if(jumin1.length != 6 || jumin2.length != 7){
			alert("�ֹι�ȣ�ڸ��� Ȯ��!!");
			return false;
		}else if(!email_Exp.test(email)){
			alert("�̸��� ���� Ȯ��!!");
			return false;
		}
	}
	
</script>    
</head>
<body>
  <center>
  <form name="frm" action="userprocess.jsp" method="post" onsubmit="return check()">
  <table width="600" border="0" cellpadding="5" >
      <tr bgcolor="#3399cc">
         <td><font size="4" color="white">����������Է�</font>
      </tr>
      <tr>
         <td>�ȳ��ϼ���. �� �������� �����Ӱ� �̿��Ϸ���
               ���� ȸ�������� �ϼž� �մϴ�.<br>
               �Ʒ��� ���׵��� �������� ����� �ּ���.
         </td>
      </tr>
  </table>
  <table border="1" cellpadding="5" width="600">
      <tr>
         <td width="100" bgcolor="#ffcccc">�����ID</td>
         <td colspan="3"><input type="text" name="id"> 
         <input type="button" value="�ߺ�Ȯ��"  onclick="movePage()"> </td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">��й�ȣ</td>
         <td><input type="password" name="pass"> </td>
         <td width="100" bgcolor="#ffcccc">���Ȯ��</td>
         <td><input type="password" name="pass2"> </td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">������̸�</td>
         <td colspan="3"><input type="text" name="name"> </td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">�ֹι�ȣ</td>
         <td colspan="3">
              <input type="text" name="jumin1" size="6" maxlength="6"
                      style="height:23px" >
              -
              <input type="password" name="jumin2" size="7" maxlength="7"
                      style="height:23px" ></td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc" >�������</td>
         <td colspan="3">
         <input type="text" name="year" size="4" maxlength="4">��
         <select name="month">
         <option>--</option>
         <%for(int i=1;i<13;i++){ 
         	if(i<10){%>
         	<option>0<%=i %></option>
         	<%}else{ %>
         	<option><%=i %></option>
         <%}
         } %>          
         </select>��          
         <select name="day" >
         <option>--</option>
         <%for(int i=1;i<32;i++){ %>            
			<option><%=i %></option>
         <%} %>
         </select>��          
          </td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">�����ȣ</td>
         <td colspan="3">
            <input type="text" name="zip1" size="3" maxlength="3"> 
            - 
            <input type="text" name="zip2" size="3" maxlength="3"></td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">�ּ�</td>
         <td colspan="3"><input type="text" name="addr" size="50"></td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">E-Mail</td>
         <td colspan="3"><input type="text" name="email" size="30"></td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">����</td>
         <td colspan="3">
               <select name="job" >
                     <option>�л�</option>
                     <option>������</option>
                     <option>���/����</option>
                     <option>����/����</option>
                     <option>�Ϲݻ繫��</option>
                     <option>������</option>
                     <option>���/������</option>
                     <option>����/�Ƿ�</option>
                     <option>�ڿ���</option>
                     <option>�ֺ�</option>
                     <option>��Ÿ</option>
                  </select>
         </td>
      </tr>
      <tr align="center">
         <td colspan="4">
           <input type="submit" value="���" >
           <input type="reset" value="���">
         </td>
      </tr>
  </table>
  </form>
  </center>
</body>
</html>