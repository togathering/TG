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
				alert("��й�ȣ�� �̸��Ϸ� �����Ͽ����ϴ�.");
			} else if('${result}' == 'noteSendSuccess'){
				alert("���� ������ ����.");
			} 
			window.close();
		})
	</script>

</head>

<body>
	<!-- ������ ������ �� �Ŀ� ���� â�� �ݱ� ���� Ŭ�����Դϴ�. -->
</body>
</html>