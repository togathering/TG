<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% response.setStatus(HttpServletResponse.SC_OK); %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>투게더링 :: 페이지를 찾을 수 없습니다.</title>
<link rel="shortcut icon" href="img/favi/tgFavi.ico">
<style type="text/css">
*{
list-style: none

}

body{
width : 700px;

}

h1{
float: left;
}

ul{
float: right;
}

</style>
</head>
<body>

	<h1><a href="main"><img src="img/logo2.png" class="logo" alt="" title=""></a></h1>
	<ul>
		<li><a href="main">투게더링홈</a></li>
		<li><a href="qna">투게더링 문의</a></li>
	</ul>
	
	<br><br>
	<br>
	<br>
	<br>
	
	<p>죄송합니다.</p>
	<p>요청하신 페이지를 찾을 수 없습니다.</p>
	<p>방문하시려는 페이지의 주소가 잘못 입력되었거나,</p>
	<p>페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.</p>
	<p>입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.</p>
	<p>관련 문의사항은 네이버 고객센터에 알려주시면 친절하게 안내해 드리겠습니다.</p>
	<p>감사합니다.</p>

	<br>
	<br>
	
	<form class="frm" name="frm" action="groupsearch">
		<input type="text" class="search" placeholder="검색해주세요." name="search">
		<button type="submit" class="button" name="search_bt" >모임 검색</button>
	</form>

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