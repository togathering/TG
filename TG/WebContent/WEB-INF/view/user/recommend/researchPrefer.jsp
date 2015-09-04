<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/search.css">
<title>ToGathering : 설문조사</title>
 
<script type="text/javascript">
// 체크된 체크박스 갯수 체크
function selectChkBox(frm) {

	var sum = 0;
	var count = frm.prefer.length;
	
	for(var i=0; i < count; i++ ){
		if( frm.prefer[i].checked == true ){
			sum += 1;
		}
	} 
	
	if(sum < 4){
		alert("최소 4개의 모임을 선택해주세요.");
		return;
	} else document.frm.submit();
}
</script>

</head>
<body style="background-color:#FAFAFA; margin:0; ">
<div align="left" style=" padding:27px 0 18px 125px; background-color : white;">
	<a href="main"><img src="img/logo2.png" class="logo" alt="" title=""></a>
	</div>
	<div style="padding-bottom:70px; padding-top:30px; background-color: #FAFAFA; width: 100%;" align="center" >
	<div style="background-color: #E6E6E6; border: 1px solid lightgray; padding: 5px 5px; font-size: 15px; width: 620px;">
	<h3>설문조사</h3>
	</div>
	<div style=" border: 1px solid lightgray; border-top: 0px; padding: 10px 5px 20px 5px; background-color: white; font-size: 14px; width:620px;">
		<p>※ 유저님에게 <strong>꼭 맞는 모임을 추천드리기 위한</strong> 조사입니다</p>
		<p>참여하고 싶은 모임을 최소 4개, 최대 8개까지 선택한 후 전송 버튼을 눌러주세요.</p>
		<p>지금 입력하는 것을 원하지 않는다면 메인버튼을 눌러 메인화면으로 하실 수 있습니다.</p>
	<form action="sendPrefer" method="post" name="frm" >
        <h3>운동을 사랑하는 당신의 선호하는 모임 유형은?</h3>
		<input type="checkbox" name="prefer" value="구기/단체/실내z서울z8" />풋살모임 | 서울 | 남(8), 여(0)<br/>
		<input type="checkbox" name="prefer" value="비구기/개인/실외z광주z5" />마라톤 | 광주 | 남(7), 여(2)<br />
		<input type="checkbox" name="prefer" value="구기/단체/실외z인천z-8" />피구 | 인천 | 남(1), 여(9)<br />
		<input type="checkbox" name="prefer" value="비구기/단체/실외z강원z2" />발야구 | 강원 | 남(5), 여(3)<br />
		<input type="checkbox" name="prefer" value="구기/개인/실외z전남z-1" />소프트볼 | 전남 | 남(4), 여(5)<br />
		<input type="checkbox" name="prefer" value="비구기/단체/실내z경남z5" />필라테스 | 경남 | 남(7), 여(2)<br />
		<input type="checkbox" name="prefer" value="구기/단체/실외z강원z0" />야구 | 강원 | 남(4), 여(4)<br />
		<input type="checkbox" name="prefer" value="구기/개인/실외z전북z-2" />골프 | 전북 | 남(2), 여(4)<br />
<!-- 	<input type="checkbox" name="prefer" value="구기/단체/실내|서울|0" />222<br />
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
		<input type="checkbox" name="prefer" value="비구기/단체/실외|부산|-8" />Birds<br />
		<input type="checkbox" name="prefer" value="비구기/단체/실외|울산|-7" />Birds<br />
		<input type="checkbox" name="prefer" value="비구기/단체/실외|울산|4" />Birds<br />
		<input type="checkbox" name="prefer" value="비구기/개인/실내|대전|2" />Birds<br />
		<input type="checkbox" name="prefer" value="비구기/개인/실외|대전|3" />Birds<br />
		<input type="checkbox" name="prefer" value="비구기/개인/실외|광주|-1" />Birds<br /> -->
		
	</form>
	</div>
	<div style="margin-top: 15px; margin-left: 50px;">
	<input type="submit" value="전송" onclick='selectChkBox(frm)' class="sbutton" /> 
	
	<a href="main"><input type="button" value="메인화면으로" class="sbutton" style="width: 250px;"></a>
	</div>
	</div>
</body>
</html>