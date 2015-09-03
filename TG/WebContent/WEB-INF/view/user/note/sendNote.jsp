<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ������</title>
<link rel="stylesheet" type="text/css" href="css/search.css">
<style type="text/css">

/* form ������ ���� */
.noteInput {
	width: 300px;
}
</style>

<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">
	// ��ҹ�ư�� ������ ������������ �̵�
	function goBack() {
		history.back();
	}

	// ��ȿ�� �˻� : ���� �� ����(10����)
	function limitTitleLength() {
		var noteTitle = document.frm.noteTitle.value;

		if (noteTitle.length >= 10) {
			alert("�� �̻� �Է��Ͻ� �� �����ϴ�.");
		}
	}

	// ��ȿ�� �˻� : ���� �� ���� (50����)
	function limitContentLength() {
		var noteContent = document.frm.noteContent.value;

		if (noteContent.length >= 200) {
			alert("�� �̻� �Է��Ͻ� �� �����ϴ�.");
			location.reload();
		}
	}

	// �����ܾ ���ԵǾ� ������ ��Ʈ�ѷ����� ��ȯ�Ǿ��� ���
	$(document)
			.ready(
					function() {
						if ('${param.result}' == 'containBan') {
							alert("����� ���ԵǾ��ֽ��ϴ�.");
							document.getElementById('noteTitle').value = "${param.noteTitle}";
							document.getElementById('noteContent').value = "${param.noteContent}";
						}
					});

	// �� üũ
	function emptyCheck() {
		var noteTitle = document.frm.noteTitle.value;
		var noteContent = document.frm.noteContent.value;

		if (noteTitle.length == 0) {
			alert("������ �Է����ּ���.")
			document.frm.noteTitle.focus();
			return;

		} else if (noteContent.length == 0) {
			alert("������ �Է����ּ���.");
			document.frm.noteContent.fucus();
			return;
		}

		$.ajax({
			url : 'banCheck',
			data : {
				noteTitle : noteTitle,
				noteContent : noteContent
			},
			type : 'post',
			success : function(data) {
				if (data == 'ok')
					document.frm.submit();
				else
					alert("[ " + data + ' ]��(��) �������Դϴ�. ����� ����� �ٽ� �õ����ּ���.');
				document.frm.noteTitle.fucus();
			}
		});

	}
</script>
</head>
<body style="background-color: #FAFAFA;">
	<div align="center">
		<form action="noteSendAction" method="post" name="frm">
			<section>

				<input type="hidden" name="receiverId" id="receiverId"
					value="${param.id}"> <input type="hidden"
					name="receiverNick" id="receiverNick" value="${param.nick}">
					<div style="background-color: #E6E6E6; border: 1px solid lightgray; padding: 10px 5px;">
					<label>�޴»�� : ${param.nick}(${param.id})</label> 
					</div>
					<div style=" border: 1px solid lightgray; border-top: 0px; background-color: white;">
					 <input	type="text" name="noteTitle" placeholder="������ �Է����ּ��� (�ִ� 10����)"
						class="noteInput" onkeydown="limitTitleLength()" maxlength="9"
						style="padding: 5px 5px; margin: 20px 0 10px 5px; width:350px">
					<br>
					<textarea rows="15"  name="noteContent" maxlength="199"
						class="noteInput" placeholder="������ �Է����ּ��� (�ִ� 50����)" onkeydown="limitContentLength()" 
						style="padding:5px 5px; margin: 1px 0 20px 0; width:350px">
						
					</textarea>
					</div>
			</section>
		</form>
		<div style="padding-top: 10px;">
		<input type="submit" class="sbutton" value="������"
			onclick="emptyCheck()"> <input type="button"
			class="sbutton" onclick="goBack()" value="���">
		</div>
	</div>
</body>
</html>