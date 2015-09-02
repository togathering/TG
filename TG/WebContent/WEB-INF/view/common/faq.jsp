<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="js/jquery.js"></script>

<head>
<style type="text/css">
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport"	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>TG FAQ</title>
<link rel="stylesheet" type="text/css" media="all" href="css/styleMy.css">
<link rel="stylesheet" type="text/css" media="all" href="css/responsiveMy.css">
</head>
<script type="text/javascript">
$(document).ready(function(){
    $("#flip").click(function(){
        $("#panel").slideToggle("slow");
    });
});
</script>
<style> 
#panel, #flip {
    padding: 5px;
    text-align: center;
    background-color: #e5eecc;
    border: solid 1px #c3c3c3;
}

#panel {
    padding: 50px;
    display: none;
}
</style>
<body>
	<div style="z-index: 2;"><tiles:insertAttribute name="header"/></div>
	<div style="position: relative;"><tiles:insertAttribute name="faqside"/></div> 
	<div id="flip">Click to slide the panel down or up</div>
	<div id="panel">Hello world!</div>

	
	
	<div style="position: relative; top: 30px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>