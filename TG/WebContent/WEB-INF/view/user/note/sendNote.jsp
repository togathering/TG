<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쪽지 보내기</title>
<link rel="stylesheet" type="text/css" href="css/search.css">
<style type="text/css">

/* form 디자인 설정 */
.noteInput {
	width: 300px;
}
</style>

<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">
	// 취소버튼을 누르면 이전페이지로 이동
	function goBack() {
		history.back();
	}

	// 유효성 검사 : 글자 수 제한(10글자)
	function limitTitleLength() {
		var noteTitle = document.frm.noteTitle.value;

		if (noteTitle.length >= 10) {
			alert("더 이상 입력하실 수 없습니다.");
		}
	}

	// 유효성 검사 : 글자 수 제한 (50글자)
	function limitContentLength() {
		var noteContent = document.frm.noteContent.value;

		if (noteContent.length >= 200) {
			alert("더 이상 입력하실 수 없습니다.");
			location.reload();
		}
	}

	// 금지단어가 포함되어 쪽지가 컨트롤러에서 반환되었을 경우
	$(document)
			.ready(
					function() {
						if ('${param.result}' == 'containBan') {
							alert("금지어가 포함되어있습니다.");
							document.getElementById('noteTitle').value = "${param.noteTitle}";
							document.getElementById('noteContent').value = "${param.noteContent}";
						}
					});

	// 빈값 체크
	function emptyCheck() {
		var noteTitle = document.frm.noteTitle.value;
		var noteContent = document.frm.noteContent.value;

		if (noteTitle.length == 0) {
			alert("제목을 입력해주세요.")
			document.frm.noteTitle.focus();
			return;

		} else if (noteContent.length == 0) {
			alert("내용을 입력해주세요.");
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
					alert("[ " + data + ' ]는(은) 금지어입니다. 금지어를 지우고 다시 시도해주세요.');
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
					<label>받는사람 : ${param.nick}(${param.id})</label> 
					</div>
					<div style=" border: 1px solid lightgray; border-top: 0px; background-color: white;">
					 <input	type="text" name="noteTitle" placeholder="제목을 입력해주세요 (최대 10글자)"
						class="noteInput" onkeydown="limitTitleLength()" maxlength="9"
						style="padding: 5px 5px; margin: 20px 0 10px 5px; width:350px">
					<br>
					<textarea rows="15"  name="noteContent" maxlength="199"
						class="noteInput" placeholder="내용을 입력해주세요 (최대 50글자)" onkeydown="limitContentLength()" 
						style="padding:5px 5px; margin: 1px 0 20px 0; width:350px">
						
					</textarea>
					</div>
			</section>
		</form>
		<div style="padding-top: 10px;">
		<input type="submit" class="sbutton" value="보내기"
			onclick="emptyCheck()"> <input type="button"
			class="sbutton" onclick="goBack()" value="취소">
		</div>
	</div>
</body>
</html>