<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�亯�ϱ�</title>
<style type="text/css">
.Area{
	width: 600px;
	height: 200px;
}
.Input{
	border-color: white;
	border-style: none;
}
.Content{
text-align: left; 
width: 70%
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
<div style="">
	<form class="Content" action="adminQnaOk" >
		<h3 >�亯�ϱ�</h3><br>
			<input type="text" value="${bean.qno  }" name="qno" hidden="true">
			������ ��� : <input type="text" value="${bean.id  }" class="Input" readonly="readonly">
			��ȭ��ȣ : ${bean.tel } <br>
			���ǳ�¥ : ${bean.qdate }<br>
			<b>${bean.qtitle }</b> <br>
			 ${bean.qcont } <br>
			<textarea placeholder="�亯�� �Է����ּ���" class="Area" name="rcont"></textarea><br>
			<center>
				<input type="submit" value="�亯�ϱ�" > 
				<input type="button" value="���" onclick="history.back()"> 
			</center>
	</form>
	</div>
</div>
</body>
</html>