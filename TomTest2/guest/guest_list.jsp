<%@page import="java.util.ArrayList"%>
<%@page import="guest.control.GuestBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="table" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>방명록</title>
</head>
<%-- 방명록 리스트 --%>
<body>
	<center>
		<h3>방명록</h3>
		<hr>
		<a  href="guest?action=input">방명록쓰기</a>
		<table border="1">
			<% ArrayList<GuestBean> list = (ArrayList<GuestBean>)request.getAttribute("list"); %>
			<tr bgcolor="skyblue">
			<th>번호</th>
			<th>작성자</th>
			<th>전화번호</th>
			<th>작성일</th>
			<th>내용</th>				
			</tr>
			<%for(int i=0;i< list.size();i++){ 
				int id = list.get(i).getId();%>
			<tr>
				<td><%= id%></td>
				<td><%= list.get(i).getName()%></td>
				<td><%= list.get(i).getTel()%></td>
				<td><%= list.get(i).getGdate()%></td>
				<td><a href="guest?action=update&id=<%= id%>"><%= list.get(i).getContents()%></a></td>			
			</tr>
			<%} %>
		</table><br>
		<%
     		 int p = Integer.parseInt(request.getParameter("page"));//2페이지 가정      
 		%> 
		<%if(p==1){//첫페이지 였을때 %>
 		 이전  
  		<%}else{ %>
  		<a href="guest?page=<%= p-1 %>">이전</a>   
  		<%} %>
  		<%
  			int total = Integer.parseInt(request.getAttribute("total").toString());
  		%>
  		<%if(p==total/10){ %>
  		다음
  		<%}else{ %>
  		<a href="guest?action=list&page=<%= p+1 %>">다음</a>
  		<%} %>
  		<br><br>
  		<input type="button" name="first" value="첫페이지" onclick="javascript:location.href='guest?action=list&page=1'">
  		<%
  			for (int i=1; i<=total; i++){
  				out.print("[<a href='guest?action=list&page="+i+"'>"+i+"</a>]");
  			}
  		%>
  		<input type="button" name="last" value="마지막페이지" onclick="javascript:location.href='guest?action=list&page=<%= total%>'">
	</center>
</body>
</html>