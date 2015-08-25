<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport"	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>���Ӹ����</title>


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
			alert('���ӳ�¥�� �������ּ���');
			document.createFrm.gdate.focus();
			return;
		}
		
		if(trim(loc).length==0){
			alert('��Ҹ� �Է����ּ���');
			document.createFrm.loc.focus();
			return;
		}
		
		if(min > max){
			alert('�ּ��ο��� �ִ� �ο����� Ů�ϴ�');
			document.createFrm.min.focus();
			return;
		}
		
		if(trim(title).length==0){
			alert('���� ���� �Է����ּ���');
			document.createFrm.title.focus();
			return;
		}
		
		if(title.length >= 30){
			alert('���� ���� �ִ� 30���� ���� �����մϴ�');
			document.createFrm.title.focus();
			return;
		}
		
		if(message.length >= 300){
			alert('300���� �̳��� �����ּ���');
			document.createFrm.message.focus();
			return;
		}
		
		if(!option){
			alert("�׷� ���� ����� �������ּ���");
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
			<h2 style="center">���ӵ���ϱ�</h2>

			<form name="createFrm" id="hongkiat-form" method="post" action="gxcreate" enctype="multipart/form-data">
				<div id="wrapping" class="clearfix">
					<section id="aligned">
						<h1>�ð��� ��¥</h1>
						<div id="leftdiary"></div>
						<table style="margin-top: 20; margin-right: 20;">
							<tr height="30">
							</tr>
						</table>
						<!-- �޴����� Ķ���͸�� end -->
						<script type="text/javascript">
							var now = new Date();
							var lsy = now.getFullYear();
							var lsm = now.getMonth() + 1;
							var selDate = null;
							function makeLeftDiary() {
								//���� �⵵�� ���� ���� ù°���� ���ϰ� ���������� �˾Ƴ���, ���� nfirstweek, nlastday��� ������ �����մϴ�.
								var strsm = lsm + "";
								if (strsm.length == 1) {
									strsm = "0" + strsm;
								}
								var nfirstdate = new Date(lsy, (lsm - 1), 1);
								var nfirstweek = nfirstdate.getDay();
								var nlastdate = new Date(lsy, lsm, 0);
								var nlastday = nlastdate.getDate();
								//"dtmsg"��� ������ 0103�ҽ����� �߶� �κ��߿��� �޷��� ��� �κ��� ����(0103�ҽ����� line 46~64)�� �����ؼ� �ְ�, ���� �⵵�� ���� ������ ������ "lsy"�� "lsm"��� ������ �̿��Ͽ� �־� �ݴϴ�.

								var dtmsg = "<tr height='40'><td colspan='2' style='font-family:tahoma;font-size:24;color:#aaaaaa;' align='right' onclick=\"moveLeftMonth('-')\">��</td>";
								dtmsg += "<td colspan='3' align='center'><div style='font-family:tahoma;font-size:10;font-weight:bold;'>"
										+ lsy
										+ "</div><div style='font-family:tahoma;font-size:24;font-weight:bold;'>"
										+ lsm + "</div></td>";
								dtmsg += "<td colspan='2' style='font-family:tahoma;font-size:24;color:#aaaaaa;' onclick=\"moveLeftMonth('+')\">��</td></tr><tr bgcolor='#cccccc'><td colspan='7' height='1'></td></tr>";
								dtmsg += "<tr align='center' height='21'><td width='14%' style='color:#ff0000;'>��</td><td width='14%'>��</td><td width='14%'>ȭ</td><td width='14%'>��</td><td width='14%'>��</td><td width='14%'>��</td><td width='14%' style='color:#0000ff;'>��</td></tr>";
								dtmsg += "<tr bgcolor='#cccccc'><td colspan='7' height='1'></td></tr>";
								var d = 0;
								//�޷¿� ���� td�� �հ踦 ���մϴ�(�̹����� �� �ϼ� + �Ͽ��Ϻ��� ���۵Ǵ� ����Ⱓ).
								var ntdsum = nlastday + nfirstweek;
								//�޷��� ��¥�κ��� "dmsg"��� ������ �����մϴ�.
								var dmsg = "";
								for (i = 0; i < ntdsum; i++) {
									//���� 1���� �Ͽ����� �ƴ϶�� 1�ϱ��� �� ������ ����� �ݴϴ�.
									if (i < nfirstweek) {
										if (i == 0)
											dmsg += "<td class='srgfont' style='cursor:hand;'></td>";
										else
											dmsg += "<td class='sgfont' style='cursor:hand;' ></td>";
									}
									//���� ���� 1�Ϻ��� ������������ �Ͽ��ϰ� ����(�����)�� ���� ���� �ٲپ��ָ� ���ʴ�� ĭ�� ä�� �ֽ��ϴ�.
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
								//���⼭ i�� 0���� ������ �ִ� ������ line 289���� ������ ���� i�� ���� �Ѱ� ���� �ʱ� ���ؼ� �Դϴ�.)
								i = 0;
								//���� ���� ������������ ������ ������� �ƴ� ���, �߰��� ĭ�� ����� 1���� �����ϴ� ����(������)�� �־� �ݴϴ�.
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
								//�޷¿��� �������� 1������ �߰��� �� �����ֵ��� �մϴ�. �̹����� ���������� ������� ��츦 �����Ͽ� �������� 14���� ���� �ʵ��� �մϴ�.
								dmsg += "<tr align='center' height='17'><td class='srgfont' style='cursor:hand;'>"
										+ (i + 1) + "</td>";
								for (j = 1; j < 7; j++) {
									dmsg += "<td class='sgfont' style='cursor:hand;'>"
											+ (i + j + 1) + "</td>";
								}
								//�̷��� �޷��� ���κа� ���ںκ��� ���� 'dtmsg', 'dmsg'�� ���ǵǾ��ٸ� "leftdiary"�� ������ div�� innerHTML�� �־� �ݴϴ�.
								document.getElementById("leftdiary").innerHTML = "<table width='100%' border='0' cellspacing='0' cellpadding='0'>"
										+ dtmsg
										+ "<tr align='center' height='17' bgcolor='#eeeeee'>"
										+ dmsg
										+ "</tr><tr bgcolor='#cccccc'><td colspan='7' height='1'></td></tr></table>";
								//�޷¿��� ��ܿ� ���ڰ� �� ĭ�� ���� �˾Ƴ� ��, �������� ������ ���� ����Ͽ� ���ʷ� ���ڸ� �־� �ݴϴ�.
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
									//childNodes�� ����� ������ ���� ������ �޷� Table���� id�� �ο����� �ʾ� ���� ������ �� ���� ������, �� ���� ������Ʈ�� "leftdiary"���� �ڽĿ�����Ʈ�� ù��°(childNodes[0])�� �޷� Table�� ������ �ֱ� ���ؼ� �Դϴ�.
									if (!document.getElementById("leftdiary").childNodes[0].rows[4].cells[i].innerText)
										btcnt++;
								}
								var tfirstday = tlastday - btcnt;
								for (i = 0; i <= btcnt; i++) {
									document.getElementById("leftdiary").childNodes[0].rows[4].cells[i].innerText = tfirstday
											+ i;
								}
								//�޷��� ���ó�¥�� ���� �⵵, ���� ���� ��� ���ó�¥�� �Ķ��� ����� �ְ� ��� �۾��� ǥ���� �ݴϴ�. �ݴ��� ��� ������ �����մϴ�.
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
									//�����޷� �̵��� ���� 12���� ũ�� �⵵�� +1���ְ� ���� 1�� ����ϴ�.
									if (lsm > 12) {
										lsy++;
										lsm = 1;
									}
								} else {
									lsm--;
									//�����޷� �̵��� ���� 1���� ������ �⵵�� -1���ְ� ���� 12�� ����ϴ�.
									if (lsm < 1) {
										lsy--;
										lsm = 12;
									}
								}
								if (lsm < 10) {
									lsm = "0" + lsm;
								}
								//�޷� ����� ��/���� �����ؼ� �־� �ݴϴ�.
								document.getElementById("leftdiary").childNodes[0].rows[0].cells[1].innerHTML = "<div style='font-family:tahoma;font-size:10;font-weight:bold;'>"
										+ lsy
										+ "</div><div style='font-family:tahoma;font-size:24;font-weight:bold;'>"
										+ lsm + "</div>";
								//����� ��/���� �°� ���� �޷��� �ٽ� ����ϴ�.
								makeLeftDiary();
							}

							function selectDate(td) {

								selDate = lsy + "-" + lsm + "-" + td.id;

								//alert(selDate);
								var now = new Date();
								var year = 	now.getFullYear(); // 2015��
								var month = now.getMonth()+1; // 7��
								var day = now.getDate(); //23��
								if(year == lsy){
									if(month == lsm){//������ ����� ���� ����� ���� ���
										if(day < td.id){ // ������ ��� ���� ���� ���� ���� ������ �Ϻ��� ���� ���
											document.createFrm.gdate.value = selDate; // ���ð���
										}else{
											alert('�̹� ���� ��¥�Դϴ�');//���� �Ұ���
											return;
										}
									}else if(month < lsm){//������ �⵵�� �����⵵�� ���� ������ ���� ���� ������ Ŭ ���
										document.createFrm.gdate.value = selDate; //���� ����
									}else{//������ �⵵�� �����⵵�� ���� ������ ���� ���������� ���� ���
										alert('�̹� ���� ��¥�Դϴ�');// ���� �Ұ���
										return;
									}
								}else if(year < lsy){//������ �⵵�� �����⵵���� Ŭ ���
									document.createFrm.gdate.value = selDate;//���ð���
								}else{//������ �⵵���� �����⵵�� Ŭ ���
									alert('�̹� ���� ��¥�Դϴ�');//���� �Ұ���
									return;
								}
								
								/* document.createFrm.gdate.value = selDate; */

							}
						</script>
						<input type="text" id="date" name="gdate" class="txtinput"
							readonly="readonly"><br>
						<select id="hour" name="hour" tabindex="" class="selmenu">
							<option value="00">���� 12��</option>
							<option value="01">���� 01��</option>
							<option value="02">���� 02��</option>
							<option value="03">���� 03��</option>
							<option value="04">���� 04��</option>
							<option value="05">���� 05��</option>
							<option value="06">���� 06��</option>
							<option value="07">���� 07��</option>
							<option value="08">���� 08��</option>
							<option value="09">���� 09��</option>
							<option value="10">���� 10��</option>
							<option value="11">���� 11��</option>
							<option value="12">���� 12��</option>
							<option value="13">���� 01��</option>
							<option value="14">���� 02��</option>
							<option value="15">���� 03��</option>
							<option value="16">���� 04��</option>
							<option value="17">���� 05��</option>
							<option value="18">���� 06��</option>
							<option value="19">���� 07��</option>
							<option value="20">���� 08��</option>
							<option value="21">���� 09��</option>
							<option value="22">���� 10��</option>
							<option value="23">���� 11��</option>
						</select> <select id="minute" name="minute" tabindex="" class="selmenu">
							<option value="00">00��</option>
							<option value="10">10��</option>
							<option value="20">20��</option>
							<option value="30">30��</option>
							<option value="40">40��</option>
							<option value="50">50��</option>
						</select>
						<h1>���</h1>
						<section id="buttons">
						</section>
						<input type="button" onclick="searchAddress()" value="��Ҽ���"><br><br>
						<input type="text" id="loc" name="loc" class="txtinput" placeholder="�ּ�" readonly="readonly">
						<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
						<script>
						    function searchAddress() {
						        new daum.Postcode({
						            oncomplete: function(data) {
						                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
						                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
						                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
						                var fullAddr = ''; // ���� �ּ� ����
						                var extraAddr = ''; // ������ �ּ� ����
						                // ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
						                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
						                    fullAddr = data.roadAddress;
						                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
						                    fullAddr = data.jibunAddress;
						                }
						                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
						                if(data.userSelectedType === 'R'){
						                    //���������� ���� ��� �߰��Ѵ�.
						                    if(data.bname !== ''){
						                        extraAddr += data.bname;
						                    }
						                    // �ǹ����� ���� ��� �߰��Ѵ�.
						                    if(data.buildingName !== ''){
						                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						                    }
						                    // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
						                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
						                }
						                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
						                //document.getElementById("sample6_postcode").value = data.zonecode; //5�ڸ� ���ʱ�����ȣ ���
						                document.getElementById("loc").value = fullAddr;
						            }
						        }).open();
						    }
						</script>
						<br> <br>
						<div>
							<h1>�ο� ��</h1>
							<h3>�ִ� 6�� ���� ���� �����ϸ�, �ּ� 3���� ���� ���� ���� 6�ñ��� �������� ������, ������ �ڵ�
								��ҵ˴ϴ�. �ּ� �ο� �� ������ �����ϰ� ����⡯���� �����մϴ�.</h3>
						</div>
						<br> <select id="min" name="min" class="selmenu">
							<option value="min">�ּ��ο�</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
						</select> 
						<select id="max" name="max" class="selmenu">
							<option value="max">�ִ��ο�</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
						</select> <br>
						<h1>����� �ʴ��</h1>
						<input type="text" name="title" id="title"
							placeholder="ex)���� �޸��� ��" autocomplete="on" tabindex=""
							class="txtinput" style="font-size: medium; margin-bottom: 2px;">
						
						<textarea name="message" id="message" autocomplete="on"
							tabindex="" class="txtblock" row="50" col=""
							style="font-size: medium; text-align: center;">
							
���� _____ �� �����ϴ� ����Դϴ�.
		
� ������ ������ ����� �Ƴ���?
������ �ڱ�Ұ��� �����սô�. 
��, ��ȭ��ȣ, �̸���, īī����(�޽���) ����
���ο���ó �ۼ��� �����մϴ�.
		
		
_____ �ϴ� ������ �Ұ��մϴ�.
���� ���� ���� ��� ���������ϴ�.
		
�̷� ���� �ָ��ϼ���!

�츮 ���� ��� ���, ���� ������ ����� ���, 
�ƴϸ� �׳� ��ſ� �ð��� �������� ���? 
������ ���� �����?
�̷� ��ȭ�� ������ �����ؿ�!
������ ����� �� �ִ� ó�� 5��! 
��, �츮 � �̾߱�� ģ�������?
			</textarea>


						<!-- <h1>�� �� �Ұ�</h1>
			<section id="one">
			<input type="text" name="like" id="telephone" placeholder="�޸��⸦ �����ϴ�" tabindex="" class="txtinput" autocomplete="on"><h3>����</h3><br>
			<input type="text" name="like" id="telephone" placeholder="������" tabindex="" class="txtinput" autocomplete="on"><h3>(��)�� ���� ������</h3>
			<input type="text" name="like" id="telephone" placeholder="�" tabindex="" class="txtinput" autocomplete="on"><h3>(��)�� �;��</h3>
			</section> -->

						<br style="clear: both;">
						<h1>�±�</h1>
						<section id="tags">
							<input type="text" name="tag" id="tag"
								placeholder="�±׸� �Է����ּ���. �±׾տ� #�� �ٿ��ּ���." autocomplete="on"
								tabindex="" class="txtinput"> <br style="clear: both;">
						</section>
					<section id="img">
						<h1>�̹���</h1>
						<input type="file" name="imgfile" size=40> 
						<br>
						<br>
						<h1>�׷� ���� ���</h1>
						<input type="radio" name="joinOption" value="����������">����������
						<input type="radio" name="joinOption" value="������Ѻο�">������Ѻο�
						<br>
						<br>
						<br>
						</section>
						<section id="buttons">
							<input type="button" name="save" id="save" class="resetbtn"
								value="���� �����" onclick="checkValue()"> <br style="clear: both;">
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