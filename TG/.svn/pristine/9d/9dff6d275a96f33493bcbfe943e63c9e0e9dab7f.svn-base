<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>답변하기</title>
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
		<h3 >답변하기</h3><br>
			<input type="text" value="${bean.qno  }" name="qno" hidden="true">
			문의한 사람 : <input type="text" value="${bean.id  }" class="Input" readonly="readonly">
			전화번호 : ${bean.tel } <br>
			문의날짜 : ${bean.qdate }<br>
			<b>${bean.qtitle }</b> <br>
			 ${bean.qcont } <br>
			<textarea placeholder="답변을 입력해주세요" class="Area" name="rcont"></textarea><br>
			<center>
				<input type="submit" value="답변하기" > 
				<input type="button" value="취소" onclick="history.back()"> 
			</center>
	</form>
	</div>
</div>
</body>
</html>