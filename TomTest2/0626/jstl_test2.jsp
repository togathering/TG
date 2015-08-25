<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<fmt:requestEncoding value="euc-kr"/>
	<h3>JSTL테스트</h3>
	<hr>
	<fmt:bundle basename="resource.message">
		<fmt:message key="title"/><br>
		<fmt:message key="greeting"/><br>
		<fmt:message key="visitor">
			<fmt:param value="위아래"/>
			<fmt:param value="위위아래"/>
			<fmt:param value="위아래"/>
		</fmt:message><br>
	</fmt:bundle>
	<c:set var="str1" value="  Functions <태그>를 사용a합니다.   !!"/>
	<c:set var="str2" value="사용A"/>
	<c:set var="tokens" value="1,2,3,4,5,6,7,8,9,10"/>
	
	length(str1) = ${fn:length(str1) }<br>
	toUpperCase(str1) = ${fn:toUpperCase(str1) }<br>
	toLowerCase(str1) = ${fn:toLowerCase(str1) }<br>
	subString(str1,3,4) = ${fn:substring(str1, 3, 6) }<br>
	subStringAfter(str1, str2) = ${fn:substringAfter(str1, str2) }<br>
	subStringBefore(str1, str2) = ${fn:substringBefore(str1, str2) }<br>
	trim(str1) = ${fn:trim(str1) }<br>
	replace(str1,src,dest) = ${fn:replace(str1, " ", "-") }<br>
	indexOf(str1,str2) = ${fn:indexOf(str1, str2) }<br>
	startsWith(str1, str2) = ${fn:startsWith(str1, "Fun") }<br>
	endsWith(str1, str2) = ${fn:endsWith(str1, "!!") }<br>
	contains(str1, str2) = ${fn:contains(str1, str2) }<br>
	containtsIgnoreCase(str1, str2) = ${fn:containsIgnoreCase(str1, str2) }<br>
	
	<c:set var="array" value="${fn:split(tokens,',')}"/>
	join(array,"-") = ${fn:join(array,"-") }<br>
	escapeXml(str1) = ${fn:escapeXml(str1) }<br>
</body>
</html>