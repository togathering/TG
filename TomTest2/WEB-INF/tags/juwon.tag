<%@tag body-content="scriptless" pageEncoding="euc-kr"%>

<%@attribute name="border" %>
<%@attribute name="color" %>

<jsp:useBean class="t0619.Product" id="product"/>

<h3><jsp:doBody/></h3>
<table border='${border }' bgcolor='${color }' width='200'>
	<%
	String[] list = product.getProductList();	
	for(int i=0;i<5;i++) {%>
	<tr>
		<td><%= list[i]%></td>
	</tr>
	<%} %>
</table>