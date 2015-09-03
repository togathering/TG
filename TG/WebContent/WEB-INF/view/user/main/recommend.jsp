<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach  items='${recommendList }' var='list' >
	<li onclick="gogroupinfo(${list.gno})">
		<a><img src="upimg/${list.gimg}" class="property_img"/></a>
		<span class="price">${list.gloc}</span>
		<div class="property_details">
			<h1><a href="#">${list.gtitle}</a></h1>
			<h2>${list.gstatus}</h2>
			<span class="property_size">${list.nick}</span>
		</div>
	</li>
</c:forEach>