<%@tag import="t0619.EmpBean"%>
<%@tag body-content="scriptless" pageEncoding="euc-kr"%>
<%@tag import="java.util.ArrayList"%>
<jsp:useBean class="t0619.EmpDAO" id="dao"></jsp:useBean>
<tr><th>������ȣ</th><th>�����̸�</th><th>�����޿�</th><th>�Ի糯¥</th></tr>
		<%
		ArrayList<EmpBean> list =  dao.select();
		for(EmpBean emp:list){
		%>
			<tr>
				<td><%=emp.getEmpno() %></td>
				<td><%=emp.getEname() %></td>
				<td><%=emp.getSal() %></td>
				<td><%=emp.getHiredate() %></td>				
			</tr>
		<% }%>