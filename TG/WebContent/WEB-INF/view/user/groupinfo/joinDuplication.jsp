<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
[
<c:forEach items="${joinlist }" var="list" varStatus="status">
{"exist": "${list.exist }", "id": "${list.fid }"}
	<c:if test="${not status.last }">, </c:if>
</c:forEach>
]