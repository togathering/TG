<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean class="guest.control.GuestBean" id="gb" scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ����</title>
	<script type="text/javascript">
		function movePage(){
			location.href="guest?action=list";
		}
		
		var updel;
		function del(ud){
			updel = ud;
			window.open('guest?action=check','check','toolbar=no,scrollbars=no,top=200,left=300,width=300,height=200');
			
		}
		function up(){
			
			if(updel=='d'){
				location.href="guest?action=delCon&id="+${gb.id };				
			}else {
				document.upfrm.submit();
			}
		}
	
	</script>

</head>
<%-- ���� ������ --%>
<body>
	<center>
		<h3>������</h3>
		<hr>
		<a href="guest?action=list">[�Խù� �������]</a><br><br>
		<form action="guest?action=upCon&id=${gb.id }" method="post" name="upfrm">
		<table border="1" cellpadding="5">
			<tr>
				<td bgcolor="skyblue">�ۼ���</td>
				<td><input type="text" name="name" value="${gb.name}" readonly="readonly"></td>
			</tr>	
			<tr>	
				<td bgcolor="skyblue">��й�ȣ</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td bgcolor="skyblue">email</td>
				<td><input type="text" name="email" value="${gb.email }"></td>
			</tr>
			<tr>
				<td bgcolor="skyblue">��ȭ��ȣ</td>
				<td><input type="text" name="tel" value="${gb.tel }"></td>
			</tr>
			<tr align="center">
				<td colspan="2"><textarea rows="5" cols="45" name="contents">${gb.contents }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="����" name="u" onclick="del()">
					<input type="button" value="���" onclick="movePage()">
					<input type="button" value="����" name="d" onclick="del()">
				</td>
			</tr>	
		</table>
		</form>
	</center>
</body>
</html>