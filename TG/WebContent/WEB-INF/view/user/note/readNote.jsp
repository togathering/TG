<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="tg/js/jquery.js"></script>	
<script type="text/javascript">
	
	function showBt() {
		if('${check}' == 'admin'){
			document.getElementById('reply').style.display = 'none';
		}
	}
	
	$(document).ready(function () {
		showBt();
	});
	
</script>

<style type="text/css">

/* ��Ʈ ����Ʈ */
@import url("https://googledrive.com/host/0BxmAw3HA4YGCfnVVTFJoaHQ2R0xQNURCSmp0M1BrWVQ5SVFKN05uaTRabC1XeFRpUm51T2c/notokr-demilight.css");

/* ��ü�� ��Ʈ ���� */
* { 
font-family:notokr-demilight !important; 
}

/* class="sm_button"�� ���� ������ ���� */
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
</style>

</head>
<body>
	<div>
		������ȣ : ${bean.noteNo}<br>
		������� : ${bean.senderId}<br>
		�����ð� : ${bean.noteDate}<br>
		�������� :<br> <pre>${bean.noteContent}</pre>
	
	</div>
	
	<form action="" method="post">
		<input type="hidden" id="noteNo" name="noteNo" value="${bean.noteNo}"></a>
		<input type="submit" id="delete" class="sm_button" value="�����ϱ�"></a>
	</form>
	<input type="button" id="reply" class="sm_button" style="display: " value="�����ϱ�">
	
</body>
</html>