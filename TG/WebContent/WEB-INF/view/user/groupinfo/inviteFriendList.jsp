<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function sendInvite(gno) {
		var friends = document.friendsFrm.friends;
		var param = 'friends=';
		var showFriends = '\n\n';
		if(friends.nodeName){
			if(friends.checked){
				param += friends.parentNode.nextSibling.nextSibling.firstChild.nodeValue;
				showFriends += friends.parentNode.nextSibling.nextSibling.firstChild.nodeValue+'\n';
			}
		}else{
			for(var i=0;i<friends.length;i++){
				if(friends[i].checked){
					param += friends[i].parentNode.nextSibling.nextSibling.firstChild.nodeValue+',';
					showFriends += friends[i].parentNode.nextSibling.nextSibling.firstChild.nodeValue+'\n';
				}
			}			
		}
		var con = confirm("�Ʒ��� ģ������ �ʴ��Ͻðڽ��ϱ�?"+showFriends);
		if(con){
			location.href = 'inviteGroup?'+param+'&gno='+gno;
		}
	}
	
	function duplicationCheck() {
		$.ajax({url:'joinDuplication', typ :'POST', data: 'gno=${gno}', dataType: 'json',
			success: function(data) {				
				for(var i=0;i<data.length;i++){
					var id = document.getElementById(data[i].id);
					if(data[i].id == id.firstChild.nodeValue){
						id.nextSibling.nextSibling.firstChild.nodeValue = data[i].exist;
						id.previousSibling.previousSibling.firstChild.disabled = true;
					}
				}				
			}
		});
	}
	
	$(document).ready(function() {
		duplicationCheck();
	});
	
	
</script>

<title>ģ���ʴ�</title>
</head>
<body>
<h3>ģ�����</h3>
<form action="" name="friendsFrm">
	<table id="friendTable">
		<c:forEach  items='${flist }' var='flist' >
			<tr>
				<td width="30px"><input type="checkbox" name="friends"></td>
				<td width="220px" id="${flist.id }">${flist.id }</td>
				<td>�ʴ밡��</td>
			</tr>
		</c:forEach>
		<tr><td colspan="3"><hr></td></tr>
		<tr>
			<td colspan="2"><input type="button" class="button" name="inviteBt" value="�ʴ�" onclick="sendInvite(${gno})"></td>
		</tr>				
	</table>
	<div id="testdiv">
	
	</div>
</form>
</body>
</html>