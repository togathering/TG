<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>

	<script type="text/javascript">
		$(document).ready(function(){
			if('${result}' == 'passSendSuccess'){
				alert("비밀번호를 이메일로 전송하였습니다.");
			} else if('${result}' == 'noteSendSuccess'){
				alert("쪽지 보내기 성공.");
			} 
			window.close();
		})
	</script>

</head>

<body>
	<!-- 쪽지를 보내고 난 후에 쪽지 창을 닫기 위한 클래스입니다. -->
</body>
</html>