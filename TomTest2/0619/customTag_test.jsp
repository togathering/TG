<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="/WEB-INF/tld/MyTag.tld" prefix="my"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="park" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>커스텀태그 테스트</h3>
	<hr>
	<my:gildong/>
	<hr>
	<park:juwon border="5" color="skyblue">상품목록</park:juwon>
</body>
</html>