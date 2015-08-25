<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport"	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>모임만들기</title>


<link rel="stylesheet" type="text/css" media="all" href="css/styleGC.css">
<link rel="stylesheet" type="text/css" media="all" href="css/responsiveGC.css">
<script type="text/javascript" src="js/trim.js"></script>
<script type="text/javascript">
	function checkValue() {
		var gdate = document.createFrm.gdate.value;
		var hour = document.createFrm.hour.value;
		
		var minute = document.createFrm.minute.value;
		var loc = document.createFrm.loc.value;
		var min = document.createFrm.min.value;
		var max = document.createFrm.max.value;
		var title = document.createFrm.title.value;
		var message = document.createFrm.message.value;
		var tag = document.createFrm.tag.value;
		var option = document.createFrm.joinOption.value;
		
		if(trim(gdate).length==0){
			alert('모임날짜를 선택해주세요');
			document.createFrm.gdate.focus();
			return;
		}
		
		if(trim(loc).length==0){
			alert('장소를 입력해주세요');
			document.createFrm.loc.focus();
			return;
		}
		
		if(min > max){
			alert('최소인원이 최대 인원보다 큽니다');
			document.createFrm.min.focus();
			return;
		}
		
		if(trim(title).length==0){
			alert('모임 명을 입력해주세요');
			document.createFrm.title.focus();
			return;
		}
		
		if(title.length >= 30){
			alert('모임 명은 최대 30글자 까지 가능합니다');
			document.createFrm.title.focus();
			return;
		}
		
		if(message.length >= 300){
			alert('300글자 이내로 적어주세요');
			document.createFrm.message.focus();
			return;
		}
		
		if(!option){
			alert("그룹 참여 방식을 선택해주세요");
			document.createFrm.joinOption.focus();
			return;
		}
		
		
		document.createFrm.submit();
		
	}
</script>

</head>
<body>
	<div style="z-index: 2;">
		<tiles:insertAttribute name="header" />
	</div>
	<div
		style="position: relative; top: 10px; margin-top: 10px; z-index: 1;">
		<section id="container">
			<span class="chyron"><em></em></span>
			<h2 style="center">모임등록하기</h2>

			<form name="createFrm" id="hongkiat-form" method="post" action="gxcreate" enctype="multipart/form-data">
				<div id="wrapping" class="clearfix">
					<section id="aligned">
						<h1>시간과 날짜</h1>
						<div id="leftdiary"></div>
						<table style="margin-top: 20; margin-right: 20;">
							<tr height="30">
							</tr>
						</table>
						<!-- 메뉴영역 캘린터목록 end -->
						<script type="text/javascript">
							var now = new Date();
							var lsy = now.getFullYear();
							var lsm = now.getMonth() + 1;
							var selDate = null;
							function makeLeftDiary() {
								//현재 년도와 월에 따른 첫째날의 요일과 마지막날을 알아내어, 각각 nfirstweek, nlastday라는 변수로 저장합니다.
								var strsm = lsm + "";
								if (strsm.length == 1) {
									strsm = "0" + strsm;
								}
								var nfirstdate = new Date(lsy, (lsm - 1), 1);
								var nfirstweek = nfirstdate.getDay();
								var nlastdate = new Date(lsy, lsm, 0);
								var nlastday = nlastdate.getDate();
								//"dtmsg"라는 변수에 0103소스에서 잘라낸 부분중에서 달력의 상단 부분의 내용(0103소스기준 line 46~64)을 정리해서 넣고, 현재 년도와 월을 위에서 선언한 "lsy"와 "lsm"라는 변수를 이용하여 넣어 줍니다.

								var dtmsg = "<tr height='40'><td colspan='2' style='font-family:tahoma;font-size:24;color:#aaaaaa;' align='right' onclick=\"moveLeftMonth('-')\">◀</td>";
								dtmsg += "<td colspan='3' align='center'><div style='font-family:tahoma;font-size:10;font-weight:bold;'>"
										+ lsy
										+ "</div><div style='font-family:tahoma;font-size:24;font-weight:bold;'>"
										+ lsm + "</div></td>";
								dtmsg += "<td colspan='2' style='font-family:tahoma;font-size:24;color:#aaaaaa;' onclick=\"moveLeftMonth('+')\">▶</td></tr><tr bgcolor='#cccccc'><td colspan='7' height='1'></td></tr>";
								dtmsg += "<tr align='center' height='21'><td width='14%' style='color:#ff0000;'>일</td><td width='14%'>월</td><td width='14%'>화</td><td width='14%'>수</td><td width='14%'>목</td><td width='14%'>금</td><td width='14%' style='color:#0000ff;'>토</td></tr>";
								dtmsg += "<tr bgcolor='#cccccc'><td colspan='7' height='1'></td></tr>";
								var d = 0;
								//달력에 사용될 td의 합계를 구합니다(이번달의 총 일수 + 일요일부터 시작되는 공백기간).
								var ntdsum = nlastday + nfirstweek;
								//달력의 날짜부분을 "dmsg"라는 변수에 저장합니다.
								var dmsg = "";
								for (i = 0; i < ntdsum; i++) {
									//달의 1일이 일요일이 아니라면 1일까지 빈 공간을 만들어 줍니다.
									if (i < nfirstweek) {
										if (i == 0)
											dmsg += "<td class='srgfont' style='cursor:hand;'></td>";
										else
											dmsg += "<td class='sgfont' style='cursor:hand;' ></td>";
									}
									//현재 달의 1일부터 마지막날까지 일요일과 평일(토요일)의 글자 색상만 바꾸어주며 차례대로 칸을 채워 넣습니다.
									else {
										d++;
										var tdfc = "sfont";
										if (((i + 1) % 7) == 1) {
											tdfc = "srfont";
										}
										dmsg += "<td class='"
												+ tdfc
												+ "' style='cursor:hand;background-color:#eeeeee;'onclick=\"selectDate(this)\" id='"
												+ d + "'>" + d + "</td>";
									}
									if (i < ntdsum - 1 && ((i + 1) % 7) == 0) {
										dmsg += "</tr><tr align='center' height='17' bgcolor='#eeeeee'>";
									}
								}
								//여기서 i를 0으로 정의해 주는 이유는 line 289에서 루프로 돌린 i의 값을 넘겨 받지 않기 위해서 입니다.)
								i = 0;
								//현재 달의 마지막일자의 요일이 토요일이 아닐 경우, 추가로 칸을 만들고 1부터 시작하는 숫자(다음달)를 넣어 줍니다.
								if (7 - (ntdsum % 7) > 0 && (ntdsum % 7) > 0) {
									for (i = 0; i < (7 - (ntdsum % 7)); i++) {
										tdfc = "sgfont";
										if (i == 0 && (ntdsum % 7) == 0) {
											tdfc = "srgfont";
										}
										dmsg += "<td class='"+tdfc+"' style='cursor:hand;' >"
												+ (i + 1) + "</td>";
									}
								}
								//달력에서 다음달의 1주일을 추가로 더 보여주도록 합니다. 이번달의 마지막날이 토요일일 경우를 감안하여 다음달이 14일이 넘지 않도록 합니다.
								dmsg += "<tr align='center' height='17'><td class='srgfont' style='cursor:hand;'>"
										+ (i + 1) + "</td>";
								for (j = 1; j < 7; j++) {
									dmsg += "<td class='sgfont' style='cursor:hand;'>"
											+ (i + j + 1) + "</td>";
								}
								//이렇게 달력의 윗부분과 일자부분이 각각 'dtmsg', 'dmsg'로 정의되었다면 "leftdiary"로 정의한 div에 innerHTML로 넣어 줍니다.
								document.getElementById("leftdiary").innerHTML = "<table width='100%' border='0' cellspacing='0' cellpadding='0'>"
										+ dtmsg
										+ "<tr align='center' height='17' bgcolor='#eeeeee'>"
										+ dmsg
										+ "</tr><tr bgcolor='#cccccc'><td colspan='7' height='1'></td></tr></table>";
								//달력에서 상단에 일자가 빈 칸의 수를 알아낸 후, 지난달의 마지막 날을 계산하여 차례로 숫자를 넣어 줍니다.
								var ltm = lsm - 1;
								var lty = lsy;
								if (ltm < 1) {
									lty = lsy - 1;
									ltm = 12;
								}
								var tlastdate = new Date(lty, ltm, 0);
								var tlastday = tlastdate.getDate();
								var btcnt = -1;
								for (i = 0; i < 7; i++) {
									//childNodes를 사용한 이유는 좌측 영역의 달력 Table에는 id가 부여되지 않아 직접 지정할 수 없기 때문에, 그 상위 엘리먼트인 "leftdiary"안의 자식엘리먼트의 첫번째(childNodes[0])인 달력 Table을 지정해 주기 위해서 입니다.
									if (!document.getElementById("leftdiary").childNodes[0].rows[4].cells[i].innerText)
										btcnt++;
								}
								var tfirstday = tlastday - btcnt;
								for (i = 0; i <= btcnt; i++) {
									document.getElementById("leftdiary").childNodes[0].rows[4].cells[i].innerText = tfirstday
											+ i;
								}
								//달력이 오늘날짜와 같은 년도, 같은 달일 경우 오늘날짜에 파란색 배경을 주고 흰색 글씨로 표현해 줍니다. 반대의 경우 원상대로 복원합니다.
								if (lsy == now.getFullYear()
										&& lsm == (now.getMonth() + 1)) {
									for (i = 4; i < document
											.getElementById("leftdiary").childNodes[0].rows.length - 1; i++) {
										for (j = 0; j < 7; j++) {
											if (document
													.getElementById("leftdiary").childNodes[0].rows[i].cells[j].style.backgroundColor == "#eeeeee") {
												if (document
														.getElementById("leftdiary").childNodes[0].rows[i].cells[j].innerText == "<\%=date("
														+ d + ")*1%>") {
													document
															.getElementById("leftdiary").childNodes[0].rows[i].cells[j].style.backgroundColor = "#6e9cf2";
													document
															.getElementById("leftdiary").childNodes[0].rows[i].cells[j].style.color = "#ffffff";
												} else {
													document
															.getElementById("leftdiary").childNodes[0].rows[i].cells[j].style.backgroundColor = "#eeeeee";
													document
															.getElementById("leftdiary").childNodes[0].rows[i].cells[j].style.color = "";
												}
											}
										}
									}
								}
							}
							makeLeftDiary();
							function moveLeftMonth(s) {
								if (s == "+") {
									lsm++;
									//다음달로 이동시 월이 12보다 크면 년도를 +1해주고 월을 1로 만듭니다.
									if (lsm > 12) {
										lsy++;
										lsm = 1;
									}
								} else {
									lsm--;
									//이전달로 이동시 월이 1보다 작으면 년도를 -1해주고 월을 12로 만듭니다.
									if (lsm < 1) {
										lsy--;
										lsm = 12;
									}
								}
								if (lsm < 10) {
									lsm = "0" + lsm;
								}
								//달력 상단의 년/월을 변경해서 넣어 줍니다.
								document.getElementById("leftdiary").childNodes[0].rows[0].cells[1].innerHTML = "<div style='font-family:tahoma;font-size:10;font-weight:bold;'>"
										+ lsy
										+ "</div><div style='font-family:tahoma;font-size:24;font-weight:bold;'>"
										+ lsm + "</div>";
								//변경된 년/월에 맞게 좌측 달력을 다시 만듭니다.
								makeLeftDiary();
							}

							function selectDate(td) {

								selDate = lsy + "-" + lsm + "-" + td.id;

								//alert(selDate);
								var now = new Date();
								var year = 	now.getFullYear(); // 2015년
								var month = now.getMonth()+1; // 7월
								var day = now.getDate(); //23일
								if(year == lsy){
									if(month == lsm){//선택한 년월이 실제 년월과 같을 경우
										if(day < td.id){ // 선택한 년과 월이 같고 실제 일이 선택한 일보다 작을 경우
											document.createFrm.gdate.value = selDate; // 선택가능
										}else{
											alert('이미 지난 날짜입니다');//선택 불가능
											return;
										}
									}else if(month < lsm){//선택한 년도가 실제년도와 같고 선택한 월이 실제 월보다 클 경우
										document.createFrm.gdate.value = selDate; //선택 가능
									}else{//선택한 년도가 실제년도와 같고 선택한 월이 실제월보다 작을 경우
										alert('이미 지난 날짜입니다');// 선택 불가능
										return;
									}
								}else if(year < lsy){//선택한 년도가 실제년도보다 클 경우
									document.createFrm.gdate.value = selDate;//선택가능
								}else{//선택한 년도보다 실제년도가 클 경우
									alert('이미 지난 날짜입니다');//선택 불가능
									return;
								}
								
								/* document.createFrm.gdate.value = selDate; */

							}
						</script>
						<input type="text" id="date" name="gdate" class="txtinput"
							readonly="readonly"><br>
						<select id="hour" name="hour" tabindex="" class="selmenu">
							<option value="00">오전 12시</option>
							<option value="01">오전 01시</option>
							<option value="02">오전 02시</option>
							<option value="03">오전 03시</option>
							<option value="04">오전 04시</option>
							<option value="05">오전 05시</option>
							<option value="06">오전 06시</option>
							<option value="07">오전 07시</option>
							<option value="08">오전 08시</option>
							<option value="09">오전 09시</option>
							<option value="10">오전 10시</option>
							<option value="11">오전 11시</option>
							<option value="12">오후 12시</option>
							<option value="13">오후 01시</option>
							<option value="14">오후 02시</option>
							<option value="15">오후 03시</option>
							<option value="16">오후 04시</option>
							<option value="17">오후 05시</option>
							<option value="18">오후 06시</option>
							<option value="19">오후 07시</option>
							<option value="20">오후 08시</option>
							<option value="21">오후 09시</option>
							<option value="22">오후 10시</option>
							<option value="23">오후 11시</option>
						</select> <select id="minute" name="minute" tabindex="" class="selmenu">
							<option value="00">00분</option>
							<option value="10">10분</option>
							<option value="20">20분</option>
							<option value="30">30분</option>
							<option value="40">40분</option>
							<option value="50">50분</option>
						</select>
						<h1>장소</h1>
						<section id="buttons">
						</section>
						<input type="button" onclick="searchAddress()" value="장소선택"><br><br>
						<input type="text" id="loc" name="loc" class="txtinput" placeholder="주소" readonly="readonly">
						<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
						<script>
						    function searchAddress() {
						        new daum.Postcode({
						            oncomplete: function(data) {
						                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
						                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						                var fullAddr = ''; // 최종 주소 변수
						                var extraAddr = ''; // 조합형 주소 변수
						                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						                    fullAddr = data.roadAddress;
						                } else { // 사용자가 지번 주소를 선택했을 경우(J)
						                    fullAddr = data.jibunAddress;
						                }
						                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						                if(data.userSelectedType === 'R'){
						                    //법정동명이 있을 경우 추가한다.
						                    if(data.bname !== ''){
						                        extraAddr += data.bname;
						                    }
						                    // 건물명이 있을 경우 추가한다.
						                    if(data.buildingName !== ''){
						                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						                    }
						                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
						                }
						                // 우편번호와 주소 정보를 해당 필드에 넣는다.
						                //document.getElementById("sample6_postcode").value = data.zonecode; //5자리 기초구역번호 사용
						                document.getElementById("loc").value = fullAddr;
						            }
						        }).open();
						    }
						</script>
						<br> <br>
						<div>
							<h1>인원 수</h1>
							<h3>최대 6명 까지 참석 가능하며, 최소 3명이 모임 전날 오후 6시까지 참여하지 않으면, 모임이 자동
								취소됩니다. 최소 인원 수 설정은 ‘상세하게 만들기’에서 가능합니다.</h3>
						</div>
						<br> <select id="min" name="min" class="selmenu">
							<option value="min">최소인원</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
						</select> 
						<select id="max" name="max" class="selmenu">
							<option value="max">최대인원</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
						</select> <br>
						<h1>제목과 초대글</h1>
						<input type="text" name="title" id="title"
							placeholder="ex)같이 달리실 분" autocomplete="on" tabindex=""
							class="txtinput" style="font-size: medium; margin-bottom: 2px;">
						
						<textarea name="message" id="message" autocomplete="on"
							tabindex="" class="txtblock" row="50" col=""
							style="font-size: medium; text-align: center;">
							
저는 _____ 를 좋아하는 사람입니다.
		
어떤 이유로 모임을 만들게 됐나요?
간단한 자기소개로 시작합시다. 
단, 전화번호, 이메일, 카카오톡(메신저) 등의
개인연락처 작성은 금지합니다.
		
		
_____ 하는 모임을 소개합니다.
그저 손이 가는 대로 끄적여봅니다.
		
이런 분은 주목하세요!

우리 동네 사는 사람, 나와 취향이 비슷한 사람, 
아니면 그냥 즐거운 시간을 보내고픈 사람? 
누구를 만나 볼까요?
이런 대화로 모임을 시작해요!
누구나 어색할 수 있는 처음 5분! 
자, 우리 어떤 이야기로 친해질까요?
			</textarea>


						<!-- <h1>한 줄 소개</h1>
			<section id="one">
			<input type="text" name="like" id="telephone" placeholder="달리기를 좋아하는" tabindex="" class="txtinput" autocomplete="on"><h3>나는</h3><br>
			<input type="text" name="like" id="telephone" placeholder="사람들과" tabindex="" class="txtinput" autocomplete="on"><h3>(과)와 밥을 먹으며</h3>
			<input type="text" name="like" id="telephone" placeholder="운동" tabindex="" class="txtinput" autocomplete="on"><h3>(하)고 싶어요</h3>
			</section> -->

						<br style="clear: both;">
						<h1>태그</h1>
						<section id="tags">
							<input type="text" name="tag" id="tag"
								placeholder="태그를 입력해주세요. 태그앞에 #을 붙여주세요." autocomplete="on"
								tabindex="" class="txtinput"> <br style="clear: both;">
						</section>
					<section id="img">
						<h1>이미지</h1>
						<input type="file" name="imgfile" size=40> 
						<br>
						<br>
						<h1>그룹 참여 방식</h1>
						<input type="radio" name="joinOption" value="선착순참여">선착순참여
						<input type="radio" name="joinOption" value="방장권한부여">방장권한부여
						<br>
						<br>
						<br>
						</section>
						<section id="buttons">
							<input type="button" name="save" id="save" class="resetbtn"
								value="모임 만들기" onclick="checkValue()"> <br style="clear: both;">
						</section>
					</section>
				</div>
			</form>
		</section>		
	</div>

	<div style="position: relative; top: 10px">
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>