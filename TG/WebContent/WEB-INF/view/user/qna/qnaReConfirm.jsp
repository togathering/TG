<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div style="z-index: 2;"><tiles:insertAttribute name="header"/></div><br><br>
	<div>	<tiles:insertAttribute name="myPageHeader"/></div><br><br>
	<div style="position: relative;"><tiles:insertAttribute name="qnaSide"/></div>
	<h3>���ǳ���</h3>
	
	<b>����: ${bean.qtitle } </b> ������ ��¥: ${bean.qdate }<br>
	 ${bean.qcont } <br><br><br>
	
	�亯========== <br>
	${bean.rcont }<br>
	
	
	
	<div style="position: relative; top: 30px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>