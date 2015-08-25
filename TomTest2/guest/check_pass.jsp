<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean class="guest.control.GuestBean" id="gb" scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비번확인</title>
<script type="text/javascript">
	function check(){
		if(document.frm.pass.value==${gb.pass}){
			window.opener.up();
			window.close();
			return true;
		}else{
			alert("땡!!");
			return false;
		}
	}

</script>
</head>
<body>
	<center>
	<form name="frm" onsubmit="return check()">
	<table>
		<tr>
			<td bgcolor="skyblue">비밀번호</td>
			<td><input type="password" name="pass"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="확인"></td>
		</tr>
	</table>
	</form>
	</center>
</body>
</html>