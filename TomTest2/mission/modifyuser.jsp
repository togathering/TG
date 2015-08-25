<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean class="mission.dao.UserDAO" id="dao"></jsp:useBean>
<jsp:useBean class="mission.beans.UserInfo" id="info"></jsp:useBean>
<%
	String id = (String)session.getAttribute("id");
	info = dao.select(id); 
	String [] jumin = info.getJumin().split("-");
	String [] birth = info.getBirth().split("-");
	String [] zip = info.getZip().split("-");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����ڼ���</title> 
<script>
	function check(){
		pass = document.frm.pass.value;
		pass2 = document.frm.pass2.value;
		zip1 = document.frm.zip1.value;
		zip2 = document.frm.zip2.value;
		addr = document.frm.addr.value;
		email = document.frm.email.value;
		job = document.frm.job.value;
		if(pass=="" || pass2==""){
			alert("����Է�!!");
			return false;
		}else if(pass!=pass2){
			alert("��й�ȣ�� ���� �ٸ��ϴ�");
			return false;
		}else if(email==""){
			alert("�̸��� �Է�!!");
			return false;
		}
	}

</script>

</head> 
<body>
  <center>
  <form name="frm" action="modifyprocess.jsp" method="post">
  <table width="600" border="0" cellpadding="5" >
      <tr bgcolor="#3399cc">
         <td><font size="4" color="white">�������������</font>
      </tr>      
  </table>
  <table border="1" cellpadding="5" width="600">
      <tr>
         <td width="100" bgcolor="#ffcccc">�����ID</td>
         <td colspan="3">       
         <input type="text" name="id" disabled="disabled" value="<%=id%>"></td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">��й�ȣ</td>
         <td><input type="password" name="pass" > </td>
         <td width="100" bgcolor="#ffcccc">���Ȯ��</td>
         <td><input type="password" name="pass2" > </td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">������̸�</td>
         <td colspan="3">
         <input type="text" name="name" disabled="disabled" value="<%=info.getName()%>">        
         </td>
         
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">�ֹι�ȣ</td>
         <td colspan="3">
              <input type="text" name="jumin1" size="6" maxlength="6"
                      style="height:23px" disabled="disabled" value="<%=jumin[0]%>">
              -
              <input type="password" name="jumin2" size="7" maxlength="7"
                      style="height:23px" disabled="disabled" value="<%=jumin[1]%>"></td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc" >�������</td>
         <td colspan="3">
         <input type="text" name="year" size="4" maxlength="4" disabled="disabled" value="<%=birth[0]%>">��
         <select name="month" disabled="disabled" >
         	<option><%=birth[1]%></option>
         </select va>��          
         <select name="day" disabled="disabled">
         	<option><%=birth[2]%></option>    
         </select>��          
          </td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">�����ȣ</td>
         <td colspan="3">
            <input type="text" name="zip1" size="3" maxlength="3" value="<%=zip[0]%>"> 
            - 
            <input type="text" name="zip2" size="3" maxlength="3" value="<%=zip[1]%>">
	     </td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">�ּ�</td>
         <td colspan="3"><input type="text" name="addr" size="50" value="<%=info.getAddr()%>"></td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">E-Mail</td>
         <td colspan="3"><input type="text" name="email" size="30" value="<%=info.getEmail()%>">
          </td>
      </tr>
    
      <tr>
         <td width="100" bgcolor="#ffcccc">����</td>
         <td colspan="3">
               <select name="job">
               <% String [] jobs = {"�л�","������","���/����","����/����","�Ϲݻ繫��","������","���/������","����/�Ƿ�","�ڿ���","�ֺ�","��Ÿ"}; 
               		for(int i=0;i<jobs.length;i++){
               			if(jobs[i].equals(info.getJob())){
               %>
               				<option value="<%= jobs[i]%>" selected="selected"><%= jobs[i]%></option>
               			<%}else{ %>	
               				<option value="<%= jobs[i]%>"><%= jobs[i]%></option>
               			<%}
               		}%>
               <%-- 
                     <option <% if (info.getJob().equals("�л�"))out.print("selected");%>>�л�</option>
                     <option <% if (info.getJob().equals("������"))out.print("selected");%>>������</option>
                     <option <% if (info.getJob().equals("���/����"))out.print("selected");%>>���/����</option>
                     <option <% if (info.getJob().equals("����/����"))out.print("selected");%>>����/����</option>
                     <option <% if (info.getJob().equals("�Ϲݻ繫��"))out.print("selected");%>>�Ϲݻ繫��</option>
                     <option <% if (info.getJob().equals("������"))out.print("selected");%>>������</option>
                     <option <% if (info.getJob().equals("���/������"))out.print("selected");%>>���/������</option>
                     <option <% if (info.getJob().equals("����/�Ƿ�"))out.print("selected");%>>����/�Ƿ�</option>
                     <option <% if (info.getJob().equals("�ڿ���"))out.print("selected");%>>�ڿ���</option>
                     <option <% if (info.getJob().equals("�ֺ�"))out.print("selected");%>>�ֺ�</option>
                     <option <% if (info.getJob().equals("��Ÿ"))out.print("selected");%>>��Ÿ</option>
               --%>
                  </select>
         </td>
      </tr>
      <tr align="center">
         <td colspan="4">
           <input type="submit" value="����">
           <input type="reset" value="���">
         </td>
      </tr>
  </table>
  </form>
  </center>
</body>
</html>