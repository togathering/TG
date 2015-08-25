<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
[
	{size: ${size }},
	<c:forEach  items='${list }' var='list' varStatus="status">
	{no:'${list.no }',name:'${list.name }',content:'${list.content }',id:'${list.id }'}<c:if test="${not status.last }">,</c:if>
	</c:forEach>
]