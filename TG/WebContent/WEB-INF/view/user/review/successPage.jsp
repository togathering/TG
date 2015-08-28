<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
${reviewId }
<option value="함께한 친구들">함께한 친구들</option>
		<option value="${host }">${host }</option>	
		<c:forEach items="${list }" var="gx">
			<option value="${gx.pid }">${gx.pid }</option>
		</c:forEach>