<%@page import="java.io.FileReader"%>
<%@page import="t0626.Person"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSTL테스트</title>
</head>
<body>
	<h3>JSTL테스트</h3>
	<hr>
	<c:set var="su" value="13"></c:set>
	
	SU:${su }<br>
	
	<c:set var="name1" value="${per.name }" scope="session"/>
	
	<c:set target="${per }" property="name" value="오준원"/>
	
	<c:set var="name2" value='<%=((Person)request.getAttribute("per")).getName() %>' scope="session"/>
	
	이름:${name1 }<br>
	이름:${name2 }<br>
	<c:remove var="su"/>
	SU:${su }<br>
	<hr>
	
	<c:set var="su1" value="${13 }"></c:set>
	<c:set var="su2" value="${23 }"></c:set>
	
	<c:if test="true">
		조건 성립!!
	</c:if><br>
	
	<c:if test="${su1<su2 }">
		su1이 su2보다 작습니다!!
	</c:if>
	
	<c:if test="${param.b=='rain' }">
		비가와요~!!${param.b }
	</c:if>
	<c:if test="${param.b=='snow' }">
		눈이와요~!!${param.b }
	</c:if>
	<br>
	<c:choose>
		<c:when test="${per.name=='김형호' }">
			<font color="blue" size="5">나~~!!</font>
		</c:when>
		<c:when test="${per.name=='오준원' }">
			<font color="red" size="5">반장~~!!</font>
		</c:when>
		<c:otherwise>
			<font color="cyan" size="10">7강의장!!!!</font>
		</c:otherwise>
	</c:choose>
	<hr>
	<table cellpadding="5">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>나이</th>
			<th>직업</th>
		</tr>
		<c:forEach var="list" items="${list }" varStatus="status">
		<tr>
			<td colspan="4" align="center">=======${status.index }::${status.count }=======</td>
		</tr>
		<tr>
			<td>${list.no }</td> 
			<td>${list.name }</td> 
			<td>${list.age }</td> 
			<td>${list.job }</td>
		</tr>
		</c:forEach>
	</table>
	<hr>
	<c:forEach items="${map }" var="map">
		${map.key } = ${map.value }<br>
	</c:forEach>
	<hr>
	<c:forTokens var="color" items="red,green.blue,yellow//white" delims=",/.">
		${color }<br>
	</c:forTokens>
	<hr>
	<h3>Import 테스트</h3>
	<c:import url="result.jsp">
		<c:param name="name" value="하니"/>
		<c:param name="age">11</c:param>
	</c:import>
	<br>
	<%-- <c:redirect url="0626/result.jsp">
		<c:param name="name1" value="아이유"/>
		<c:param name="age1">13</c:param>
	</c:redirect> --%>
	<c:out value="안녕, OUT~!!"></c:out><br>
	<%
		String path = application.getRealPath("/0626/result.jsp");
		FileReader fr = new FileReader(path);
	%>
	<pre>
<c:out value="<%=fr %>" escapeXml="true"/>
	</pre>
</body>
</html>