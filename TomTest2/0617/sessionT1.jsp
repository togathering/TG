<%@ page language="java" contentType="text/html; charset=euc-kr"%>

<html>
<head>
<title>사용자 인증</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style type="text/css">
<!--
.normal {  font-family: "굴림", "돋움"; font-size: x-small; font-style: normal; font-weight: normal; text-decoration: none}
.normalbold {  font-family: "굴림", "돋움"; font-size: x-small; font-style: normal; font-weight: bold; text-decoration: none}
-->
</style>
</head>

<body bgcolor="#FFFFFF"> <center>
<p class="normalbold">안녕하세요. jsp 홈페이지입니다.<br>
  사이트에 접속하기 위해서 사용자 인증 절차가 필요합니다.</p>
<p class="normalbold">ID와 PassWord를 입력하세요.</p>
<form method="post"  name="inputForm" action="sessionT2.jsp">
  <table width="350" border="1" cellspacing="0" cellpadding="0" bordercolor="#000000">
    <tr> 
      <td bgcolor="#FF9999" class="normalbold" width="25%"> 
        <div align="center"><font color="#000000">아이디</font></div>
      </td>
      <td class="normal" width="75%"> 
        <input type="text" name="id">
      </td>
    </tr>
    <tr> 
      <td bgcolor="#FF9999" class="normalbold" width="25%"> 
        <div align="center"><font color="#000000">패스워드</font></div>
      </td>
      <td class="normal" width="75%"> 
        <input type="password" name="pass">
      </td>
    </tr>
  </table>
  <br>
  <p>
    <input type="submit" name="Submit" value="확인">
    <input type="reset" name="Reset" value="취소">
  </p>
  </form> </center>
</body>
</html>
