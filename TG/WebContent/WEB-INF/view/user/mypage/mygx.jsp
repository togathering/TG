<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/list.css">
<link rel="stylesheet" type="text/css" media="all" href="css/styleMy.css">
<title>Today, ToGathering, Together</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function cancelGx(gno) {
		location.href = 'gxcancel?gno='+gno;
	}
	$(document).ready(function(){
		if('${gstatus }'=='�����Ϸ�'){
			var cancels = document.getElementsByName("cancel");
			var tcancel = document.getElementById("tcancel");
			tcancel.style.display = 'none';
			for(var i=0;i<cancels.length;i++){
				cancels.item(i).style.display = 'none';
			}
			
		}else{
			alert('${gstatus}');
		}
	 });
</script>

</head>
<body>
		<div style="z-index: 2;"><tiles:insertAttribute name="header"/></div>
	<br><br>
	<div><tiles:insertAttribute name="myPageHeader"/></div>
	<div><tiles:insertAttribute name="gxSide"/></div>
	<section class="listings">
		<form id="form" style="padding-top: 20px; text-align: center;">
		<div class="wrapper"><h1>���� ����</h1><br><br>
		<font color="#add">���� ${gNum } ���� ���ӿ� �������Դϴ�</font><br><br>
			<table id="joinGx" style="width: 70%; margin-left: 5px;">
				<tr style="height: 40px; background-color: #40C4AD; border: 1px solid lightgray; font-weight: bold;">
					<td style="width: 100px; padding-top: 8px;">�����̸�</td>
					<td>������</td>
					<td>���</td>
					<td>�ð�</td>
					<td>�ּ��ο�</td>
					<td>�ִ��ο�</td>
					<td>�����ο�</td>
					<td>��������</td>
					<td id="tcancel" style="display: "><font style="text-align: center;">�������</font></td>
				</tr>
				<c:forEach  items='${list }' var='gx' >
				<tr style="height: 80px; text-align: center; border: 1px; border: 1px solid lightgray;" >
					<td style="padding-top: 15px;"><a style="color: gray;" href="groupinfo?gno=${gx.gno }">${gx.gtitle }</a></td>
					<td>${gx.ghost }</td>
					<td>${gx.gloc }</td>
					<td>${gx.gday }</td>
					<td>${gx.gmin }</td>
					<td>${gx.gmax }</td>
					<td>${gx.gsum }</td>
					<td>${gx.gstatus }</td>
					<td>
					<input type="button" name="cancel" class="button" value="�������" style="display: " onclick="cancelGx('${gx.gno}')">
							</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		</form>
		</section> <!--  end listing section  -->
		<div style="position: relative; top: 30px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>