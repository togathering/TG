<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/tgBoard.css">
<!-- <link rel="stylesheet" type="text/css" href="css/list.css"> -->
<!-- <link rel="stylesheet" type="text/css" media="all" href="css/styleMy.css"> -->
<title>Today, ToGathering, Together</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function deleteGx(gno) {
		alert(gno);
		location.href = 'gxdelete?gno='+gno;
	}
	$(document).ready(function(){		
		myhost();		
	 });
</script>
</head>
<body>
	<div style="z-index: 2;"><tiles:insertAttribute name="header"/></div>
	<div><tiles:insertAttribute name="myPageHeader"/></div>
	<div><tiles:insertAttribute name="hostSide"/></div>
	<section class="listings">
	<br>
		<form id="form" style="padding-top: 20px; text-align: center;">
		<div class="wrapper"><h1>ȣ��Ʈ ����</h1><br><br>
			<font color="#add">���� ${hNum}���� ������ ȣ��Ʈ�� �ð��ֽ��ϴ�.</font><br><br>
			<table id="hostGx" style="width: 70%; margin-left: 5px">
				<tr style="height: 40px; background-color: #40C4AD; font-weight: bold; border: 1px solid lightgray;">
					<td hidden="true">���ӹ�ȣ</td>
					<td>�����̸�</td>
					<td>���</td>
					<td>�ð�</td>
					<td>�ּ��ο�</td>
					<td>�ִ��ο�</td>
					<td>�����ο�</td>
					<td>��������</td>
					<td style="padding-top: 8px;">���ӻ���</td>
				</tr>
				<c:forEach  items='${list }' var='host' >
				<tr style="height: 80px; text-align: center; border: 1px; background-color: #add; ">
					<td hidden="true">${host.gno }</td>
					<td><a style="color: gray;" href="groupinfo?gno=${host.gno }">${host.gtitle }</a></td>
					<td>${host.gloc }</td>
					<td>${host.gday }</td>
					<td>${host.gmin }</td>
					<td>${host.gmax }</td>
					<td>${host.gsum }</td>
					<td>${host.gstatus }</td>
					<td style="padding-top: 15px; width: 100px;">
					<input type="button" class="sbutton" value="����" onclick="deleteGx('${host.gno}')"></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		</form>
		</section> <!--  end listing section  -->
		<div style="position: relative; top: 30px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>