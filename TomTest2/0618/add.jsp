<%@page import="java.util.ArrayList"%>
<%@page import="hangul.Korean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%! 
		String fruit;
		
	%>
	<% 
		fruit = Korean.toHangul(request.getParameter("product")); 
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("list");
		if(list==null){
			list = new ArrayList<String>();
		}
		list.add(fruit);
		session.setAttribute("list", list);
	%>
	<script type="text/javascript">
		alert("<%= fruit%>이(가) 추가되었습니다!!");
		history.back();//history.go(-1);
	</script>

</body>
</html>