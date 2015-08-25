<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/list.css">
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/responsive.css">
<link rel="stylesheet" type="text/css" href="css/TGlist.css">
<link rel="stylesheet" type="text/css" href="css/search.css">
<title>Today, ToGathering, Together</title>
<style type="text/css">
.button{
	font-family: 'Source Sans Pro', sans-serif;
  	background-color: #53e3a6;
	 margin:0 auto 3px auto; 
	  border: 0;
	  color: white;
	  border-radius: 1px;
	  width: 8%;
	  min-width:80px;
	  max-width:150px;
	  height: 40px;
	  cursor: pointer;
	  font-size: 16px;
	}

.button:hover {
  background-color: rgba(83,227,166,0.8);
}

.button:focus {
  background-color: #21c982;
}
</style>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/trim.js"></script>
<script type="text/javascript">
	
	order = '';
	day = '';
	keyword = '';
	cnt = 6;
	function addPage(){// ������ �߰�
		cnt += 6;
		loadlist();
	}
	
	function setOrder(ord) {
		order = ord;
		loadlist();
	}
	
	function setDay(gday) {
		day = gday
		location.href = 'groupsearch?day='+day;
	}
	
	function setKey() {
		order ='';
		day='';
		keyword = document.frm.search.value;
		location.href = 'groupsearch?search='+keyword;
	}
	
	function loadlist() {
		$.ajax({url:"groupsearch", type:"POST", data:"search="+keyword+"&order="+order+"&day="+day+"&cnt="+cnt, dataType:"text",
			success:function(data){
				var list = document.getElementById('list');
				list.innerHTML = data;
			}
		});
	}
	function loadfirst(){
		order = '';
		day = '';
		keyword = '';
		cnt = 6;
		document.frm.search.value = '';
		loadlist();
	}
	
	function popularity() {//�α��
		
	}
	
	function gogroupinfo(gno){
		location.href = 'groupinfo?gno='+gno;
	}
	
	$(document).ready(function() {
		
	});

	
</script>

</head>
<body>
	<div><tiles:insertAttribute name="header"/></div>
	<section class='searchingHere'>
		
		<label class="mainLabel">
			${size }���� ToGathering�� �������Դϴ�. <br><br>
		</label>
		<form name="frm">	
			<div class="orderBySubject" align="center">
				<input type="button" class="sbutton" value="�α��" name="buttons" hidden=""> &nbsp;
				<input type="button" class="sbutton" value="��¥��" name="buttons" onclick="setOrder('gday')"> &nbsp; 
				<input type="button" class="sbutton" value="������" name="buttons" onclick="setOrder('gdate')"> &nbsp;
				<input type="button" class="sbutton" value="�˻��ʱ�ȭ " onclick="loadfirst()">  &nbsp;
				<input type="text" style="height:30px;" placeholder="�˻�� �Է��ϼ��� :-)" size="30" name="search" value="${keyword }">
				<input type="button" class="sbutton" value="�˻�" onclick="setKey()">
			</div>
		</form>
		<br><br>
	
		<div id="leftdiary"></div>
			<table width="600px" border="0" cellspacing="0" cellpadding="0" style="margin-top:20">
				<tr height="30"></tr>
			</table>
			<!-- �޴����� Ķ���͸�� end -->
		<script type="text/javascript">
			var now = new Date();
		    var lsy = now.getFullYear();
		    var lsm = now.getMonth()+1;
		    var selDate = null;
			function makeLeftDiary() {
				  //���� �⵵�� ���� ���� ù°���� ���ϰ� ���������� �˾Ƴ���, ���� nfirstweek, nlastday��� ������ �����մϴ�.
				var strsm = lsm+"";
				if(strsm.length==1) { strsm = "0"+strsm; }
				var nfirstdate = new Date(lsy,(lsm-1),1);
				var nfirstweek = nfirstdate.getDay();
				var nlastdate = new Date(lsy,lsm,0);
				var nlastday = nlastdate.getDate();
				//"dtmsg"��� ������ 0103�ҽ����� �߶� �κ��߿��� �޷��� ��� �κ��� ����(0103�ҽ����� line 46~64)�� �����ؼ� �ְ�, ���� �⵵�� ���� ������ ������ "lsy"�� "lsm"��� ������ �̿��Ͽ� �־� �ݴϴ�.
				var dtmsg = "<tr height='40'><td colspan='2' style='font-family:tahoma;font-size:24;color:#aaaaaa;' align='right' onclick=\"moveLeftMonth('-')\">��</td>";
				dtmsg += "<td colspan='3' align='center'><div style='font-family:tahoma;font-size:10;font-weight:bold;'>"+lsy+"</div><div style='font-family:tahoma;font-size:24;font-weight:bold;'>"+lsm+"</div></td>";
				dtmsg += "<td colspan='2' style='font-family:tahoma;font-size:24;color:#aaaaaa;' onclick=\"moveLeftMonth('+')\">��</td></tr><tr bgcolor='#cccccc'><td colspan='7' height='1'></td></tr>";
				dtmsg += "<tr align='center' height='21'><td width='14%' style='color:#ff0000;'>��</td><td width='14%'>��</td><td width='14%'>ȭ</td><td width='14%'>��</td><td width='14%'>��</td><td width='14%'>��</td><td width='14%' style='color:#0000ff;'>��</td></tr>";
				dtmsg += "<tr bgcolor='#cccccc'><td colspan='7' height='1'></td></tr>";
				var d = 0;
				//�޷¿� ���� td�� �հ踦 ���մϴ�(�̹����� �� �ϼ� + �Ͽ��Ϻ��� ���۵Ǵ� ����Ⱓ).
				var ntdsum = nlastday+nfirstweek;
				//�޷��� ��¥�κ��� "dmsg"��� ������ �����մϴ�.
				var dmsg = "";
				for(i=0; i<ntdsum; i++) {
					//���� 1���� �Ͽ����� �ƴ϶�� 1�ϱ��� �� ������ ����� �ݴϴ�.
					if(i<nfirstweek) {//���� ���� 1�Ϻ��� ������������ �Ͽ��ϰ� ����(�����)�� ���� ���� �ٲپ��ָ� ���ʴ�� ĭ�� ä�� �ֽ��ϴ�.
				    	if(i==0) dmsg += "<td class='srgfont' style='cursor:hand;'></td>";
				      	else dmsg += "<td class='sgfont' style='cursor:hand;' ></td>";
				    }else {
				    	d++;
						var tdfc = "sfont";
						if(((i+1)%7)==1) { 
							tdfc = "srfont"; 
						}
				    	dmsg += "<td class='"+tdfc+"' style='cursor:hand;background-color:#eeeeee;'onclick=\"selectDate(this)\" id='"+d+"'>"+d+"</td>";		      
				    }
				    if(i<ntdsum-1 && ((i+1)%7)==0) { 
				    	dmsg += "</tr><tr align='center' height='17' bgcolor='#eeeeee'>"; 
				    }
				}
				//���⼭ i�� 0���� ������ �ִ� ������ line 289���� ������ ���� i�� ���� �Ѱ� ���� �ʱ� ���ؼ� �Դϴ�.)
				i = 0;
				//���� ���� ������������ ������ ������� �ƴ� ���, �߰��� ĭ�� ����� 1���� �����ϴ� ����(������)�� �־� �ݴϴ�.
				if(7-(ntdsum%7)>0 && (ntdsum%7)>0) {
					for(i=0; i<(7-(ntdsum%7)); i++) {
				    	tdfc = "sgfont";
				      	if(i==0 && (ntdsum%7)==0) { 
				      		tdfc = "srgfont"; 
				      	}
				      	dmsg += "<td class='"+tdfc+"' style='cursor:hand;' >"+(i+1)+"</td>";
				    }
				}
				//�޷¿��� �������� 1������ �߰��� �� �����ֵ��� �մϴ�. �̹����� ���������� ������� ��츦 �����Ͽ� �������� 14���� ���� �ʵ��� �մϴ�.
				dmsg += "<tr align='center' height='17'><td  	 class='srgfont' style='cursor:hand;'>"+(i+1)+"</td>";
				for(j=1; j<7; j++) { 
					dmsg += "<td class='sgfont' style='cursor:hand;'>"+(i+j+1)+"</td>"; 
				}//�̷��� �޷��� ���κа� ���ںκ��� ���� 'dtmsg', 'dmsg'�� ���ǵǾ��ٸ� "leftdiary"�� ������ div�� innerHTML�� �־� �ݴϴ�.
				document.getElementById("leftdiary").innerHTML = "<table width='100%' border='0' cellspacing='0' cellpadding='0'>"+dtmsg+"<tr align='center' height='17' bgcolor='#eeeeee'>"+dmsg+"</tr><tr bgcolor='#cccccc'><td colspan='7' height='1'></td></tr></table>";
				//�޷¿��� ��ܿ� ���ڰ� �� ĭ�� ���� �˾Ƴ� ��, �������� ������ ���� ����Ͽ� ���ʷ� ���ڸ� �־� �ݴϴ�.
				var ltm = lsm-1;
				var lty = lsy;
				if(ltm<1) { 
					lty = lsy-1; ltm = 12; 
				}
				var tlastdate = new Date(lty,ltm,0);
				var tlastday = tlastdate.getDate();
				var btcnt = -1;
				for(i=0; i<7; i++) {
					//childNodes�� ����� ������ ���� ������ �޷� Table���� id�� �ο����� �ʾ� ���� ������ �� ���� ������, �� ���� ������Ʈ�� "leftdiary"���� �ڽĿ�����Ʈ�� ù��°(childNodes[0])�� �޷� Table�� ������ �ֱ� ���ؼ� �Դϴ�.
				    if(!document.getElementById("leftdiary").childNodes[0].rows[4].cells[i].innerText) btcnt++;
				}
				var tfirstday = tlastday - btcnt;
				for(i=0; i<=btcnt; i++) {
					document.getElementById("leftdiary").childNodes[0].rows[4].cells[i].innerText = tfirstday+i;
				}
				//�޷��� ���ó�¥�� ���� �⵵, ���� ���� ��� ���ó�¥�� �Ķ��� ����� �ְ� ��� �۾��� ǥ���� �ݴϴ�. �ݴ��� ��� ������ �����մϴ�.
				if(lsy==now.getFullYear() && lsm==(now.getMonth()+1)) {
					for(i=4; i<document.getElementById("leftdiary").childNodes[0].rows.length-1; i++) {
				    	for(j=0; j<7; j++) {
				        	if(document.getElementById("leftdiary").childNodes[0].rows[i].cells[j].style.backgroundColor=="#eeeeee") {
				          		if(document.getElementById("leftdiary").childNodes[0].rows[i].cells[j].innerText=="<\%=date("+d+")*1%>") {
				            		document.getElementById("leftdiary").childNodes[0].rows[i].cells[j].style.backgroundColor = "#6e9cf2";
				            		document.getElementById("leftdiary").childNodes[0].rows[i].cells[j].style.color = "#ffffff";
				          		}else {
				            		document.getElementById("leftdiary").childNodes[0].rows[i].cells[j].style.backgroundColor = "#eeeeee";
				            		document.getElementById("leftdiary").childNodes[0].rows[i].cells[j].style.color = "";
				         		}
							}
				      	}
				    }
				}
			}
			makeLeftDiary();
			function moveLeftMonth(s) {
			    if(s=="+") {
			    	lsm++;
			      	//�����޷� �̵��� ���� 12���� ũ�� �⵵�� +1���ְ� ���� 1�� ����ϴ�.
			      	if(lsm>12) { lsy++; lsm = 1; }
			    }else {
			    	lsm--;
			      	//�����޷� �̵��� ���� 1���� ������ �⵵�� -1���ְ� ���� 12�� ����ϴ�.
			      	if(lsm<1) { lsy--; lsm = 12; }
			    }
			    
			    document.getElementById("leftdiary").childNodes[0].rows[0].cells[1].innerHTML = "<div style='font-family:tahoma;font-size:10;font-weight:bold;'>"+lsy+"</div><div style='font-family:tahoma;font-size:24;font-weight:bold;'>"+lsm+"</div>";
			    //����� ��/���� �°� ���� �޷��� �ٽ� ����ϴ�.
			    makeLeftDiary();
			}
			
			function selectDate(td){
				var myYear = lsy%100;
				var myMonth = lsm;
				var myDay = td.id;
				if(myYear<10){
					myYear = '0'+myYear;
				}
				if(myMonth<10){
					myMonth = '0'+myMonth;
				}
				if(myDay.length == 1){
					myDay = '0'+myDay;
				}
				selDate = myYear+"/"+myMonth+"/"+myDay;
				
				setDay(selDate);
			 } 
		</script><!-- searching �� --> 

	</section>
	<section class="listings">
		<div class="wrapper">
			<ul class="properties_list" id="list">
				<c:forEach  items='${tglist }' var='tglist' >
					<li onclick="gogroupinfo(${tglist.gno})">
						<a><img src="upimg/${tglist.gimg}" class="property_img"/></a>
						<span class="price">${tglist.gloc}</span>
						<div class="property_details">
							<h1><a href="#">${tglist.gtitle}</a></h1>
							<h2>${tglist.gstatus}</h2>
							<h2>${tglist.goption }</h2>
							<span class="property_size">${tglist.nick}</span>
						</div>
					</li>
				</c:forEach>
			</ul>
			<div class="more_listing" id="divbt">
				<a class="more_listing_btn" onclick="addPage()">View More Listings</a>
			</div>
		</div>
	</section> <!--  end listing section  -->
	<div><tiles:insertAttribute name="footer"/></div>
</body>
</html>