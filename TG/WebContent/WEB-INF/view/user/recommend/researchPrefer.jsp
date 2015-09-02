<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<h3>유저님에게 꼭 맞는 모임을 추천드리기 위한 조사입니다..</h3>
	<h3>참여하고 싶은 모임을 최소 5개, 최대 10개까지 선택한 후 전송 버튼을 눌러주세요.</h3>
	<h3>지금 입력하시는 것을 원하지 않으시다면 메인버튼을 눌러 메인화면으로 하실 수 있습니다.</h3>
	
	<form action="" method="post">
        
        <p>유저님 선호하는 모임의 유형은?</p>
			<input type="checkbox" name="prefer" value="Cat" />Cats <br />
			<input type="checkbox" name="prefer" value="Dog" />Dogs<br />
			<input type="checkbox" name="prefer" value="Bird" />Birds<br />
			<input type="submit" value="전송"/> 
	</form>
	
	<input type="button" onclick="" value="메인화면으로">

</body>
</html>