<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% response.setStatus(HttpServletResponse.SC_OK); %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���Դ��� :: �������� ã�� �� �����ϴ�.</title>
<link rel="shortcut icon" href="img/favi/tgFavi.ico">
<style type="text/css">
*{
list-style: none

}

body{
width : 700px;

}

h1{
float: left;
}

ul{
float: right;
}

</style>
</head>
<body>

	<h1><a href="main"><img src="img/logo2.png" class="logo" alt="" title=""></a></h1>
	<ul>
		<li><a href="main">���Դ���Ȩ</a></li>
		<li><a href="qna">���Դ��� ����</a></li>
	</ul>
	
	<br><br>
	<br>
	<br>
	<br>
	
	<p>�˼��մϴ�.</p>
	<p>��û�Ͻ� �������� ã�� �� �����ϴ�.</p>
	<p>�湮�Ͻ÷��� �������� �ּҰ� �߸� �ԷµǾ��ų�,</p>
	<p>�������� �ּҰ� ���� Ȥ�� �����Ǿ� ��û�Ͻ� �������� ã�� �� �����ϴ�.</p>
	<p>�Է��Ͻ� �ּҰ� ��Ȯ���� �ٽ� �ѹ� Ȯ���� �ֽñ� �ٶ��ϴ�.</p>
	<p>���� ���ǻ����� ���̹� �����Ϳ� �˷��ֽø� ģ���ϰ� �ȳ��� �帮�ڽ��ϴ�.</p>
	<p>�����մϴ�.</p>

	<br>
	<br>
	
	<form class="frm" name="frm" action="groupsearch">
		<input type="text" class="search" placeholder="�˻����ּ���." name="search">
		<button type="submit" class="button" name="search_bt" >���� �˻�</button>
	</form>

</body>
<%-- [error ����]
<br>
<br>

�����ڵ� : ${requestScope['javax.servlet.error.status_code']}
<br>
����Ÿ�� : ${requestScope['javax.servlet.error.exception_type']}
<br>
�޼��� :  ${requestScope['javax.servlet.error.message']}
<br>
�������� URI : ${requestScope['javax.servlet.error.request_uri']}
<br>
�������� ���� : ${requestScope['javax.servlet.error.servlet_name']}  
<br> --%>

</html>