<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function checkValue() {
		var nick = document.hongkiat.nick.value;
		var tel = document.hongkiat.tel.value;
		var pass = document.hongkiat.pass.value;
		var intro = document.hongkiat.intro.value;
	
			if(nick.length==0){
				alert('닉네임을 입력해주세요');
				document.hongkiat.tel.focus();
				return;
			}
			if(pass.length==0){
				alert('비밀번호를 입력해주세요');
				document.hongkiat.pass.focus();
				return;
			}
			if(tel.length==0){
				alert('전화번호을 입력해주세요');
				document.hongkiat.nick.focus();
				return;
			}
			if(intro.length>200){
				alert("소개글이 너무 깁니다");
				document.hongkiat.intro.focus();
				return;
			}
		
		
				var fileName =document.getElementById("imgFile").value;
				var ext = fileName.substring(fileName.lastIndexOf(".")+1);
				if(ext !=".jpg" &&  ext !=".JPEG" && ext !=".gif" && ext !="png"){
					alert("이미지 파일 업로드시 확장자는 jpg,JPEG,gif,png 만 가능합니다.");
					document.getElementById("imgFile").value="";
					return;
				}
			
			document.hongkiat.submit();
		}	
	
	
	
	
	$(document).ready(function(){
			var gender = document.getElementById("gender");
			var selectGender = null;
		if('${my.gender}' == 'M'){
			selectGender = '<select id="gender" name="gender" tabindex="" class="sel" onselect="show()">';
			selectGender += '<option selected value="M">남자</option>';
			selectGender += '<option value="F">여자</option>';
			selectGender += '</select>';
		}else if('${my.gender}' == 'F'){
			
			selectGender= '<select id="gender" name="gender" tabindex="" class="sel" onselect="show()">';
			selectGender += '<option selected value="F">여자</option>';
			selectGender += '<option value="M">남자</option>';
			selectGender += '</select>';
		}else{
			selectGender= '<select id="gender" name="gender" tabindex="" class="sel" onselect="show()">';
			selectGender += '<option value=""> </option>';
			selectGender += '<option value="F">여자</option>';
			selectGender += '<option value="M">남자</option>';
			selectGender += '</select>';
		}
		gender.innerHTML = selectGender;
		
		var year = document.getElementById("year");
		var month = document.getElementById("month");
		var day = document.getElementById("day");
		var yy = null;		
		
		if('${my.birth}' != ''){
			var selectBirth = '${my.birth}'.split("-", 3);
			var selectYear = selectBirth[0];
			var selectMonth = selectBirth[1];
			var selectDay = selectBirth[2].split(" ", 1);
			yy = '<option selected value="'+selectYear+'">'+selectYear+'</option>';
			<% for(int i=2015; i>=1930; i--){ %>
            yy +=  '<option value="<%= i %>"><%= i %></option>';
            <% } %>
			var mm = '<option selected value="'+selectMonth+'">'+selectMonth+'</option>';
			<% for(int i=1; i<=12; i++){ %>
			<%if(i<10){%>
            mm +=  '<option value="0<%= i %>">0<%= i %></option>';
            <%}else{%>
            mm +=  '<option value="<%= i %>"><%= i %></option>';
            <%}
			}%>
			var dd = '<option selected value="'+selectDay+'">'+selectDay+'</option>';
			<% for(int i=1; i<=31; i++){ %>
			<%if(i<10){%>
            dd +=  '<option value="0<%= i %>">0<%= i %></option>';
            <%}else{%>
            dd +=  '<option value="<%= i %>"><%= i %></option>';
            <%}}%>
		}else{
			<% for(int i=2015; i>=1930; i--){ %>
            yy +=  '<option value="<%= i %>"><%= i %></option>';
            <% } %>
            <% for(int i=1; i<=12; i++){ %>
            <%if(i<10){%>
            mm +=  '<option value="0<%= i %>">0<%= i %></option>';
            <%}else{%>
            mm +=  '<option value="<%= i %>"><%= i %></option>';
            <%}
			}%>
            <% for(int i=1; i<=31; i++){ %>
            <%if(i<10){%>
            dd +=  '<option value="0<%= i %>">0<%= i %></option>';
            <%}else{%>
            dd +=  '<option value="<%= i %>"><%= i %></option>';
            <%}
            }%>
		}
		year.innerHTML = yy;
		month.innerHTML = mm;
		day.innerHTML = dd;
	});
		
	

	
</script>
<head>

<style type="text/css">

</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport"	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>MY PAGE</title>
<link rel="stylesheet" type="text/css" media="all" href="css/styleMy.css">
<link rel="stylesheet" type="text/css" media="all" href="css/responsiveMy.css">


</head>
<body>
	<div style="z-index: 2;"><tiles:insertAttribute name="header"/></div>
	<div><tiles:insertAttribute name="myPageHeader"/></div>
	
	<div id="menu" class="t"><br>
			<h2>프로필</h2>
	<div id="main"
		style="position: relative; top: 10px; margin-top: 10px; z-index: 1;">
		<section id="container">
			<span class="chyron"><em></em></span>
			<form name="hongkiat" id="hongkiat-form" method="post" action="myupdate">

			<div class="_1">
				<h3>닉네임</h3><br><h3>이메일</h3><br><h3>비밀번호</h3><br>
				<h3>휴대전화</h3><br><h3>성별</h3><br><h3>생년월일</h3><br>
				<h3>선호운동</h3><br><h3>활동지역</h3><br>
				<h3>Instagram</h3><br><h3>Facebook</h3><br><h3>자기소개</h3>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><h3>프사</h3>
			</div>
			
				<div id="wrapping" class="clearfix" style="margin-left: 30px">
					<section id="aligned">
	
				<input type="text" id="nick" name="nick" class="txtinput" value="${my.nick }"><br>
               	<input type="text" id="email" name="email" class="txtinput" readonly="readonly"   value="<%=session.getAttribute("id") %>"><br>
               	<input type="password" id="pass" name="pass" class="txtinput" value="${my.pass }"><br>
               	<input type="text" id="tel" name="tel" class="txtinput" value="${my.tel }"><br>
               	<span id="gender">
	               	<select id="gender" name="gender" tabindex="" class="sel" onselect="show()">
	               	</select>
               	</span>
               	<br><br>
            	  	<select id="year" name="year" tabindex="" class="selmenu">
            			 <span id="year"></span>
	            	</select>
            	  	<select id="month" name="month" tabindex="" class="selmenu">
            			 <span id="month"></span> 
	            	</select>
            	  	<select id="day" name="day" tabindex="" class="selmenu">
            			 <span id="day"></span>  
	            	</select>
	            	   <br><br>
         	 	<input type="text" name="favo" id="favo" tabindex="" class="txtinput" value="${my.favo }"><br>
        		<input type="text" name="loc" id="loc" tabindex="" class="txtinput" value="${my.loc }"><br>
        		<input type="text" name="insta" id="insta" tabindex="" class="txtinput" value="${my.insta }"><br>
        		<input type="text" name="fbook" id="fbook" tabindex="" class="txtinput" value="${my.fbook }"><br>
        		<textarea name="intro" id="intro" autocomplete="on"  tabindex="" class="txtblock" row="10" col="">
         		${my.intro }
         		</textarea>
         		
         		<input type="file" name="imgFile" id="imgFile" class="txtinput" value="">
						<br style="clear: both;">
						<section id="buttons">
							<input type="button" name="save" id="save" class="resetbtn"
								value="수정하기" onclick="checkValue()" onresize="false"> <br style="clear: both;">
						</section>
					</section>
				</div>
				</form>
			</section>		
		</div>
	</div>
	<div style="position: relative; top: 30px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>