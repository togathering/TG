<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% response.setStatus(HttpServletResponse.SC_OK); %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���Դ��� :: �������� ã�� �� �����ϴ�.</title>
<link rel="shortcut icon" href="img/favi/tgFavi.ico">
<link rel="stylesheet" type="text/css" href="css/search.css">
<link rel="stylesheet" type="text/css" href="css/tgBoard.css">
<style type="text/css">
*{
list-style: none

}

body{
width : 100%

}

h1{
float: left;
}

ul{
float: right;
margin-top: 30px;
}

</style>
</head>
<body>
<div style="margin: 20px 350px 20px 250px;">
	<h1><a href="main"><img src="img/logo2.png" class="logo" alt="" title=""></a></h1>
	<ul>
		<li><a href="main" style="text-decoration: none;">���Դ���Ȩ</a></li>
		<li><a href="qna" style="text-decoration: none;">���Դ��� ����</a></li>
	</ul>
	
	<br><br>
	<br>
	<br>
	<div>
	<p>�˼��մϴ�.</p>
	<p>��û�Ͻ� �������� ã�� �� �����ϴ�.</p>
	<p>�湮�Ͻ÷��� �������� �ּҰ� �߸� �ԷµǾ��ų�,</p>
	<p>�������� �ּҰ� ���� Ȥ�� �����Ǿ� ��û�Ͻ� �������� ã�� �� �����ϴ�.</p>
	<p>�Է��Ͻ� �ּҰ� ��Ȯ���� �ٽ� �ѹ� Ȯ���� �ֽñ� �ٶ��ϴ�.</p>
	<p>���� ���ǻ����� ToGathering �����ϱ�� �˷��ֽø� ģ���ϰ� �ȳ��� �帮�ڽ��ϴ�.</p>
	<p>�����մϴ�.</p>
	</div>
	<div>
	<p style="margin-left: 90px;">������ ã���ôٸ� �˻��� �غ�����~!!</p>
	<form class="frm" name="frm" action="groupsearch" style="padding-top: 5px; width: 100%;">
		<input type="text" class="search" placeholder="�˻����ּ���." name="search" style="border: 1px solid lightgray; width: 400px; float: left; margin-left: 90px;">
		<button type="submit" class="button" name="search_bt" style="float: left; margin-left: 10px;">���� �˻�</button>
	</form>
	</div>
</div>
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