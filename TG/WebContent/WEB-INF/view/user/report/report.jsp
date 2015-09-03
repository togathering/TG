<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>신고하기</title>

<script type="text/javascript">
</script>
<link rel="stylesheet" type="text/css" href="css/list.css">
<% String accused = request.getParameter("accused"); %>
</head>
<body>
	<form action="reportSend" name="frm" style="text-align: ; margin: 30px;">
		<h2 align="center">신고하기</h2>
		신고할 아이디 : <input type="text" name="accused" value="<%=accused%>" readonly="readonly" class="t"><br><br>
		<div class="report" align="left" >
			<input type="radio" name="category" value="성별을 속였습니다">성별을 속였습니다.<br>
			<input type="radio" name="category" value="모임에 방해가 됩니다">모임에 방해가 됩니다.<br>
			<input type="radio" name="category" value="참여를 열심히 하지 않았습니다">참여를 열심히 하지 않았습니다.<br>
			<input type="radio" name="category" value="기타">기타<br><br>
		</div>
		<textarea id="content" name="content" rows="10" cols="50" placeholder="신고할 내용을 입력하세요"></textarea><br>
		<div align="center"><br>
			<button type="submit" class="button" onclick="window.close()">신고하기</button>
			<button type="reset" class="button" onclick="window.close()">취소</button>
		</div>
	</form>
</body>
</html>