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
	
	<form action="sendPrefer" method="post" name="frm">
        <p>유저님 선호하는 모임의 유형은?</p>
		<input type="checkbox" name="prefer" value="구기/단체/실내z서울z-8" />풋살모임 | 서울 | 남(8), 여(0)<br/>
		<input type="checkbox" name="prefer" value="비구기/개인/실외z광주z5" />마라톤 | 광주 | 남(7), 여(2)<br />
		<input type="checkbox" name="prefer" value="구기/단체/실외|인천|5" />축구 | 인천 | 남(6), 여(1)<br />
		<input type="checkbox" name="prefer" value="구기/단체/실외|강원|2" />발야구 | 강원 | 남(5), 여(3)<br />
		<input type="checkbox" name="prefer" value="구기/개인/실외|전남|-1" />소프트볼 | 전남 | 남(4), 여(5)<br />
		<input type="checkbox" name="prefer" value="비구기/단체/실내|경남|5" />필라테스 | 경남 | 남(7), 여(2)<br />
		<input type="checkbox" name="prefer" value="구기/단체/실외|강원|0" />야구 | 강원 | 남(4), 여(4)<br />
		<input type="checkbox" name="prefer" value="구기/개인/실외|전북|2" />볼트래핑 | 전북 | 남(3), 여(1)<br />
<!-- 		<input type="checkbox" name="prefer" value="구기/단체/실내|서울|0" />222<br />
		<input type="checkbox" name="prefer" value="구기/개인/실내|충북|-9" />Birds<br />
		<input type="checkbox" name="prefer" value="구기/개인/실내|충남|9" />Birds<br />
		<input type="checkbox" name="prefer" value="구기/개인/실외|전북|3" />Birds<br />
		<input type="checkbox" name="prefer" value="구기/단체/실외|인천|2" />Birds<br />
		<input type="checkbox" name="prefer" value="비구기/단체/실내|경남|5" />Birds<br />
		<input type="checkbox" name="prefer" value="구기/단체/실내|경기|-1" />Birds<br />
		<input type="checkbox" name="prefer" value="구기/개인/실내|충남|-8" />Birds<br />
		<input type="checkbox" name="prefer" value="구기/단체/실내|경기|5" />Birds<br />
		<input type="checkbox" name="prefer" value="구기/단체/실외|경북|5" />Birds<br />
		<input type="checkbox" name="prefer" value="비구기/단체/실내|경북|-4" />Birds<br />
		<input type="checkbox" name="prefer" value="비구기/단체/실내|경북|3" />Birds<br />
		<input type="checkbox" name="prefer" value="구기/개인/실내|충북|5" />Birds<br />
		<input type="checkbox" name="prefer" value="구기/개인/실외|전남|4" />Birds<br />
		<input type="checkbox" name="prefer" value="비구기/개인/실내|대구|1" />Birds<br />
		<input type="checkbox" name="prefer" value="비구기/단체/실외|경북|5" />Birds<br />
		<input type="checkbox" name="prefer" value="구기/단체/실내|부산|-6" />Birds<br />
		<input type="checkbox" name="prefer" value="비구기/개인/실내|대구|5" />Birds<br />
		<input type="checkbox"	 name="prefer" value="비구기/단체/실외|부산|-8" />Birds<br />
		<input type="checkbox" name="prefer" value="비구기/단체/실외|울산|-7" />Birds<br />
		<input type="checkbox" name="prefer" value="비구기/단체/실외|울산|4" />Birds<br />
		<input type="checkbox" name="prefer" value="비구기/개인/실내|대전|2" />Birds<br />
		<input type="checkbox" name="prefer" value="비구기/개인/실외|대전|3" />Birds<br />
		<input type="checkbox" name="prefer" value="비구기/개인/실외|광주|-1" />Birds<br /> -->
		
		<input type="submit" value="전송"/> 
	</form>
	
	<a href="main"><input type="button" value="메인화면으로"></a>

</body>
</html>