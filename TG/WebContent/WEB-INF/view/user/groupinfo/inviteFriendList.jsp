<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
		var con = confirm("아래의 친구들을 초대하시겠습니까?"+showFriends);
		if(con){
			location.href = 'inviteGroup?'+param+'&gno='+gno;
		}
	}
	
	
</script>

<title>친구초대</title>
</head>
<body>
<h3>친구목록</h3>
<form action="" name="friendsFrm">
	<table id="friendTable">
		<c:forEach  items='${flist }' var='flist' >
			<tr>
				<td width="30px"><input type="checkbox" name="friends"></td>
				<td width="220px">${flist.id }</td>
			</tr>
		</c:forEach>
		<tr><td colspan="2"><hr></td></tr>
		<tr>
			<td colspan="2"><input type="button" class="button" name="inviteBt" value="초대" onclick="sendInvite(${gno})"></td>
		</tr>				
	</table>
</form>
</body>
</html>