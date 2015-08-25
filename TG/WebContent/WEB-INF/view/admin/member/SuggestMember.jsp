<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/plain; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
[
<%
		List list = (List)request.getAttribute("list");    	
     //  System.out.println("check!!!!!");
	   for(int i=0; i<list.size(); i++){
		 
	     out.print("'"+list.get(i)+"'");
	     if(i < list.size()-1)out.print(",");
	 //  System.out.println(list.get(i));
	   }

%>
]