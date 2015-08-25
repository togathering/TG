<%@tag import="guest.control.GuestBean"%>
<%@tag import="java.util.ArrayList"%>
<%@tag body-content="scriptless" pageEncoding="euc-kr"%>
<jsp:useBean class="guest.model.GuestDAO" id="dao"></jsp:useBean>
<table border="1">
	<% ArrayList<GuestBean> list = dao.findPage(1,10); %>
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
</table>