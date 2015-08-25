<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/search.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/trim.js"></script>
<script type="text/javascript">
	function searchMember() {//����˻� ����
		var msearch = trim(document.memFrm.msearch.value);
	
		if(!msearch){
			alert('�˻�� �Է����ּ���');
			return;
		}
		$.ajax({url:'searchuser', type:'POST', data: 'search='+msearch, dataType:'text', 
			success:function(data){
				var table = document.getElementById('listTable');
				if(data.length!=6){
					document.getElementById('listhead').style.display = '';
					table.innerHTML = data;					
				}else{
					alert('������� �����ϴ�');
				}
			}
		});
	}
	
	function friend(fid) {//ģ����û
		var msearch = trim(document.memFrm.msearch.value);
		
		$.ajax({url:'addFriend', type:'POST', data: 'search='+msearch+'&fid='+fid, dataType:'text', 
			success:function(data){
				var table = document.getElementById('listTable');
				
				document.getElementById('listhead').style.display = '';
				table.innerHTML = data;					
			}
		});
	}
	
	function report(reportId) {
		if(confirm("���� �Ű��Ͻðڽ��ϱ�?\n������ �Ű��� ��� ó���� ���� �� �ֽ��ϴ�.")){
			window.open('report?accused='+reportId,'','width=390, height=440, screenX=400, screenY=120  scrollbars= no'); 
		}else{
			alert("����");
		}
	}

</script>

<title>��� ã�ƿ�~</title>
</head>
<body>
	<div><tiles:insertAttribute name="header"/></div>
	<form name="memFrm">
		<div align="center">
			<h3>������� �˻��Ҽ��־��~</h3>
			<br>
			<input type="text" name="msearch"  placeholder="ID�� �Է����ּ���~">
			<input type="button" class="sbutton" name="msearch_bt" value="�˻�" onclick="searchMember()">
		</div>
	
		<hr>
		<div align="center" id="mlist">
			<table style="width: 70%; margin: 20px auto; min-width:700px; display: none" id="listhead">
				<tr style="height: 30px; background-color: #40C4AD; font-weight: bold;">
					<th width="120px">�����ʺ���</th>
					<th width="210px">I D</th>
					<th width="150px">�г���</th>
					<th width="70px">ģ����û</th>
					<th width="70px">�Ű��ϱ�</th>
				</tr>
			</table>
			<table style="width: 70%; margin: 20px auto; min-width:700px;" id="listTable">
				
			</table>
		</div>
	</form>
	<div style="position: relative; top: 150px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>