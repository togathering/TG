<%@page import="java.util.ArrayList"%>
<%@page import="guest.control.GuestBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="table" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����</title>
</head>
<%-- ���� ����Ʈ --%>
<body>
	<center>
		<h3>����</h3>
		<hr>
		<a  href="guest?action=input">���Ͼ���</a>
		<table border="1">
			<% ArrayList<GuestBean> list = (ArrayList<GuestBean>)request.getAttribute("list"); %>
			<tr bgcolor="skyblue">
			<th>��ȣ</th>
			<th>�ۼ���</th>
			<th>��ȭ��ȣ</th>
			<th>�ۼ���</th>
			<th>����</th>				
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
     		 int p = Integer.parseInt(request.getParameter("page"));//2������ ����      
 		%> 
		<%if(p==1){//ù������ ������ %>
 		 ����  
  		<%}else{ %>
  		<a href="guest?page=<%= p-1 %>">����</a>   
  		<%} %>
  		<%
  			int total = Integer.parseInt(request.getAttribute("total").toString());
  		%>
  		<%if(p==total/10){ %>
  		����
  		<%}else{ %>
  		<a href="guest?action=list&page=<%= p+1 %>">����</a>
  		<%} %>
  		<br><br>
  		<input type="button" name="first" value="ù������" onclick="javascript:location.href='guest?action=list&page=1'">
  		<%
  			for (int i=1; i<=total; i++){
  				out.print("[<a href='guest?action=list&page="+i+"'>"+i+"</a>]");
  			}
  		%>
  		<input type="button" name="last" value="������������" onclick="javascript:location.href='guest?action=list&page=<%= total%>'">
	</center>
</body>
</html>