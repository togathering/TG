<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쪽지 보내기</title>

<style type="text/css">

/* 폰트 임폴트 */
@import url("https://googledrive.com/host/0BxmAw3HA4YGCfnVVTFJoaHQ2R0xQNURCSmp0M1BrWVQ5SVFKN05uaTRabC1XeFRpUm51T2c/notokr-demilight.css");

/* 전체에 폰트 설정 */
* { 
font-family:notokr-demilight !important; 
}

/* class="sm_button"에 대한 디자인 설정 */
.sm_button {
   border: 0px solid #ffffff;
   background: #e74d3c;
   background: -webkit-gradient(linear, left top, left bottom, from(#e74d3c), to(#e74d3c));
   background: -webkit-linear-gradient(top, #e74d3c, #e74d3c);
   background: -moz-linear-gradient(top, #e74d3c, #e74d3c);
   background: -ms-linear-gradient(top, #e74d3c, #e74d3c);
   background: -o-linear-gradient(top, #e74d3c, #e74d3c);
   background-image: -ms-linear-gradient(top, #e74d3c 0%, #e74d3c 100%);
   padding: 7.5px 15px;
   -webkit-border-radius: 0px;
   -moz-border-radius: 0px;
   border-radius: 0px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
   box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
   text-shadow: #ffffff 0 1px 0;
   color: #ffffff;
   font-size: 13px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   }
.sm_button:hover {
   border: 0px solid #0a3c59;
   text-shadow: #ffffff 0 1px 0;
   background: #d44737;
   background: -webkit-gradient(linear, left top, left bottom, from(#d44737), to(#d44737));
   background: -webkit-linear-gradient(top, #d44737, #d44737);
   background: -moz-linear-gradient(top, #d44737, #d44737);
   background: -ms-linear-gradient(top, #d44737, #d44737);
   background: -o-linear-gradient(top, #d44737, #d44737);
   background-image: -ms-linear-gradient(top, #d44737 0%, #d44737 100%);
   color: #ffffff;
   }
.sm_button:active {
   text-shadow: #ffffff 0 1px 0;
   border: 0px solid #0a3c59;
   background: #a5291b;
   background: -webkit-gradient(linear, left top, left bottom, from(#a5291b), to(#d44737));
   background: -webkit-linear-gradient(top, #a5291b, #a5291b);
   background: -moz-linear-gradient(top, #a5291b, #a5291b);
   background: -ms-linear-gradient(top, #a5291b, #a5291b);
   background: -o-linear-gradient(top, #a5291b, #a5291b);
   background-image: -ms-linear-gradient(top, #a5291b 0%, #a5291b 100%);
   color: #ffffff;
   }
   
/* form 디자인 설정 */
.noteInput{
	width: 300px;
}
 
/* input{

  text-align:center;
  font-size: 8pt;
} */

</style>

<script type="text/javascript">

	// 취소버튼을 누르면 이전페이지로 이동
	function goBack(){
		history.back();
	}
	
	// 유효성 검사 : 글자 수 제한(10글자)
	function limitTitleLength(){
		var noteTitle = document.frm.noteTitle.value;	
		
		if(noteTitle.length >=10){
			alert("더 이상 입력하실 수 없습니다.");
		}
	}

	// 유효성 검사 : 글자 수 제한 (50글자)
	function limitContentLength(){
		var noteContent = document.frm.noteContent.value;
		
		if(noteContent.length >=200){
			alert("더 이상 입력하실 수 없습니다.");
			location.reload();                           
		}
	}
	
	// 빈값 체크
	function emptyCheck(){
		var noteTitle = document.frm.noteTitle.value;
		var noteContent = document.frm.noteContent.value;
		
		if(noteTitle.length == 0){
			alert("제목을 입력해주세요.")	
			document.frm.noteTitle.focus();
			return;
		
		} else if (noteContent.length == 0) {
			alert("내용을 입력해주세요.");
			document.frm.noteContent.fucus();
			return;
		}
		
		document.frm.submit();
		
		/* alert("쪽지 보내기 성공"); */
		
	}
</script>

</head>

<body>
	<div align="center">
	<form action="noteSendAction" method="post" name="frm">
		<section>			
			<input type="hidden" name="receiverId" value="${param.id}"></inpit>	
			<label>받는사람 : ${param.nick}(${param.id})</label><br>
			<input type="text" name="noteTitle" placeholder="제목을 입력해주세요 (최대 10글자)" class="noteInput"  
					onkeydown="limitTitleLength()" maxlength="9"><br>
			<textarea rows="15" cols="10" name="noteContent" maxlength="199" class="noteInput" 
					placeholder="내용을 입력해주세요 (최대 50글자)" onkeydown="limitContentLength()"></textarea><br>
		</section>
	</form>
	
	<input type="submit" class="sm_button" value="보내기" onclick="emptyCheck()">
	<input type="button" class="sm_button" onclick="goBack()" value="취소">
	
	</div>
</body>
</html>