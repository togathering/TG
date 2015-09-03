<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach  items='${tglist }' var='tglist' varStatus='status'>
	<li onclick='gogroupinfo(${tglist.gno}, ${tglist.nick})'>
		<a><img src='upimg/${tglist.gimg}' class='property_img'/></a>
		<span class='price'>${tglist.gloc}</span>
		<div class='property_details'>
			<h1><a href='#'>${tglist.gtitle}</a></h1>
			<h2>${tglist.gstatus}</h2>
			<h2>${tglist.goption }</h2>
			<span class='property_size'>${tglist.nick}</span>
		</div>
	</li>
</c:forEach>