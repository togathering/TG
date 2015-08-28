<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�亯�ϱ�</title>
<link rel="stylesheet" type="text/css" href="css/search.css">
<style type="text/css">
.Area{
	width: 600px;
	height: 100px;
}
.Input{
	border-color: white;
	border-style: none;
}
.Content{
width: 600px;

}
td{
font-size: 14px;
color: #585858;
}
h3{
color: #585858;
}
.board_div{
width: 100%;
margin: 0 auto;
margin-left: 400px;
}
</style>
<script type="text/javascript">
function qnaReply(qno) {
	alert(qno);
	location.href = 'MboardQna.do?re='+qno;
}
</script>
</head>
<body>
<div><tiles:insertAttribute name="adminHeader"/></div>
	<div><tiles:insertAttribute name="adminBoard"/></div>

<div class="board_div">
	<form class="Content" action="adminQnaOk" >
	<h3 >�亯�ϱ�</h3>
	<input type="text" value="${bean.qno  }" name="qno" hidden="true">
		<table>
			<tr>
				<td width="100"><strong>������ ���</strong></td><td width="600">${bean.id  }</td>
			</tr>
			<tr>
				<td><strong>��ȭ��ȣ</strong></td><td>${bean.tel }</td>
			</tr>
			<tr>
				<td><strong>���ǳ�¥</strong></td><td>${bean.qdate }</td>
			</tr>
			<tr>
				<td><strong>����</strong></td><td>${bean.qtitle }</td>
			</tr>
			<tr  height="100" valign="top" >
				<td><strong>����</strong></td><td>${bean.qcont } </td>
			</tr>
		</table><br>
		<textarea placeholder="�亯�� �Է����ּ���" class="Area" name="rcont"></textarea><br><br>
		<div align="center">
			<input type="submit" value="�亯�ϱ�" class="sbutton" > 
			<input type="button" value="���" onclick="history.back()" class="sbutton" > 
		</div><br>
	</form>
	</div>
</body>
</html>