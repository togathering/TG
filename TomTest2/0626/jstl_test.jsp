<%@page import="java.io.FileReader"%>
<%@page import="t0626.Person"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSTL�׽�Ʈ</title>
</head>
<body>
	<h3>JSTL�׽�Ʈ</h3>
	<hr>
	<c:set var="su" value="13"></c:set>
	
	SU:${su }<br>
	
	<c:set var="name1" value="${per.name }" scope="session"/>
	
	<c:set target="${per }" property="name" value="���ؿ�"/>
	
	<c:set var="name2" value='<%=((Person)request.getAttribute("per")).getName() %>' scope="session"/>
	
	�̸�:${name1 }<br>
	�̸�:${name2 }<br>
	<c:remove var="su"/>
	SU:${su }<br>
	<hr>
	
	<c:set var="su1" value="${13 }"></c:set>
	<c:set var="su2" value="${23 }"></c:set>
	
	<c:if test="true">
		���� ����!!
	</c:if><br>
	
	<c:if test="${su1<su2 }">
		su1�� su2���� �۽��ϴ�!!
	</c:if>
	
	<c:if test="${param.b=='rain' }">
		�񰡿Ϳ�~!!${param.b }
	</c:if>
	<c:if test="${param.b=='snow' }">
		���̿Ϳ�~!!${param.b }
	</c:if>
	<br>
	<c:choose>
		<c:when test="${per.name=='����ȣ' }">
			<font color="blue" size="5">��~~!!</font>
		</c:when>
		<c:when test="${per.name=='���ؿ�' }">
			<font color="red" size="5">����~~!!</font>
		</c:when>
		<c:otherwise>
			<font color="cyan" size="10">7������!!!!</font>
		</c:otherwise>
	</c:choose>
	<hr>
	<table cellpadding="5">
		<tr>
			<th>��ȣ</th>
			<th>�̸�</th>
			<th>����</th>
			<th>����</th>
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
	<h3>Import �׽�Ʈ</h3>
	<c:import url="result.jsp">
		<c:param name="name" value="�ϴ�"/>
		<c:param name="age">11</c:param>
	</c:import>
	<br>
	<%-- <c:redirect url="0626/result.jsp">
		<c:param name="name1" value="������"/>
		<c:param name="age1">13</c:param>
	</c:redirect> --%>
	<c:out value="�ȳ�, OUT~!!"></c:out><br>
	<%
		String path = application.getRealPath("/0626/result.jsp");
		FileReader fr = new FileReader(path);
	%>
	<pre>
<c:out value="<%=fr %>" escapeXml="true"/>
	</pre>
</body>
</html>