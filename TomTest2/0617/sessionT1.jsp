<%@ page language="java" contentType="text/html; charset=euc-kr"%>

<html>
<head>
<title>����� ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style type="text/css">
<!--
.normal {  font-family: "����", "����"; font-size: x-small; font-style: normal; font-weight: normal; text-decoration: none}
.normalbold {  font-family: "����", "����"; font-size: x-small; font-style: normal; font-weight: bold; text-decoration: none}
-->
</style>
</head>

<body bgcolor="#FFFFFF"> <center>
<p class="normalbold">�ȳ��ϼ���. jsp Ȩ�������Դϴ�.<br>
  ����Ʈ�� �����ϱ� ���ؼ� ����� ���� ������ �ʿ��մϴ�.</p>
<p class="normalbold">ID�� PassWord�� �Է��ϼ���.</p>
<form method="post"  name="inputForm" action="sessionT2.jsp">
  <table width="350" border="1" cellspacing="0" cellpadding="0" bordercolor="#000000">
    <tr> 
      <td bgcolor="#FF9999" class="normalbold" width="25%"> 
        <div align="center"><font color="#000000">���̵�</font></div>
      </td>
      <td class="normal" width="75%"> 
        <input type="text" name="id">
      </td>
    </tr>
    <tr> 
      <td bgcolor="#FF9999" class="normalbold" width="25%"> 
        <div align="center"><font color="#000000">�н�����</font></div>
      </td>
      <td class="normal" width="75%"> 
        <input type="password" name="pass">
      </td>
    </tr>
  </table>
  <br>
  <p>
    <input type="submit" name="Submit" value="Ȯ��">
    <input type="reset" name="Reset" value="���">
  </p>
  </form> </center>
</body>
</html>
