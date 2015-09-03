<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% response.setStatus(HttpServletResponse.SC_OK); %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>투게더링 :: 페이지를 찾을 수 없습니다.</title>
<link rel="shortcut icon" href="img/favi/tgFavi.ico">
<link rel="stylesheet" type="text/css" href="css/search.css">
<link rel="stylesheet" type="text/css" href="css/tgBoard.css">
<style type="text/css">
*{
list-style: none

}

body{
width : 100%

}

h1{
float: left;
}

ul{
float: right;
margin-top: 30px;
}

</style>
</head>
<body>
<div style="margin: 20px 350px 20px 250px;">
	<h1><a href="main"><img src="img/logo2.png" class="logo" alt="" title=""></a></h1>
	<ul>
		<li><a href="main" style="text-decoration: none;">투게더링홈</a></li>
		<li><a href="qna" style="text-decoration: none;">투게더링 문의</a></li>
	</ul>
	
	<br><br>
	<br>
	<br>
	<div>
	<p>죄송합니다.</p>
	<p>요청하신 페이지를 찾을 수 없습니다.</p>
	<p>방문하시려는 페이지의 주소가 잘못 입력되었거나,</p>
	<p>페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.</p>
	<p>입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.</p>
	<p>관련 문의사항은 ToGathering 문의하기로 알려주시면 친절하게 안내해 드리겠습니다.</p>
	<p>감사합니다.</p>
	</div>
	<div>
	<p style="margin-left: 90px;">모임을 찾고계시다면 검색을 해보세요~!!</p>
	<form class="frm" name="frm" action="groupsearch" style="padding-top: 5px; width: 100%;">
		<input type="text" class="search" placeholder="검색해주세요." name="search" style="border: 1px solid lightgray; width: 400px; float: left; margin-left: 90px;">
		<button type="submit" class="button" name="search_bt" style="float: left; margin-left: 10px;">모임 검색</button>
	</form>
	</div>
</div>
</body>
<%-- [error 내용]
<br>
<br>

에러코드 : ${requestScope['javax.servlet.error.status_code']}
<br>
에러타입 : ${requestScope['javax.servlet.error.exception_type']}
<br>
메세지 :  ${requestScope['javax.servlet.error.message']}
<br>
에러유발 URI : ${requestScope['javax.servlet.error.request_uri']}
<br>
에러유발 서블릿 : ${requestScope['javax.servlet.error.servlet_name']}  
<br> --%>

</html>