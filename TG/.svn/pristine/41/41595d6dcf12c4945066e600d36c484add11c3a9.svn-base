<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.tg.common.beans.GroupBean"%>
<%@page import="java.util.List"%>
<%@page import="com.tg.common.dao.AdminDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("UTF-8");
	String gtitle = request.getParameter("gtitle");
	System.out.println("MsearchTitle:"+gtitle);
	AdminDAO dao = new AdminDAO();
	List<GroupBean> list = dao.AdminSearchTitle(gtitle);
	System.out.println("제목도착");
	request.setAttribute("list", list);

	%>
	
	<table style="width: 98%; border-collapse: collapse;" id="mtable">
				<tr height="30px" style="border-bottom: 1px solid #167266;">
					<th>모임번호</th>
					<th style="width: 250px">모임명</th>
					<th>만든날짜</th>
					<th>모임날짜</th>
					<th>참가인원</th>
					<th>삭제</th>
				</tr>
				<c:forEach items="${list }" var="gsearchTitle">
					<tr style="border-bottom: 1px solid #167266;">
						<td align="center">${gsearchTitle.gno }</td>
						<td align="center"><a href="#"
							onClick="window.open('http://localhost/ToGathering/groupinfo.do?gno=${gsearchTitle.gno }','name','width=1300,height=630');return false">${gsearchTitle.gtitle }</a></td>
						<td align="center">${gsearchTitle.gday }</td>
						<td align="center">${gsearchTitle.gdate }</td>
						<td align="center">${gsearchTitle.gsum }</td>
						<td align="center">
						 <input	type="button" onclick="deleteG()" class="button" name="delete"
							id="delete" value="삭제"></td>
					</tr>
				</c:forEach>
			</table>