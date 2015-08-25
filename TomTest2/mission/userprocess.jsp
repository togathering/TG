<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean class="mission.beans.UserInfo" id="info"/>
<jsp:useBean class="mission.dao.UserDAO" id="dao"/>
<jsp:setProperty property="*" name="info"/>
<%
	info.setJumin((String)request.getParameter("jumin1")+"-"+(String)request.getParameter("jumin2"));
	info.setBirth((String)request.getParameter("year")+"-"+(String)request.getParameter("month")+"-"+(String)request.getParameter("day"));
	info.setZip((String)request.getParameter("zip1")+"-"+(String)request.getParameter("zip2"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>가입처리결과</title>
</head>
<body>
  <center>      
	<% if(dao.insert(info)){%>
      <table width="330" border="0" cellpadding="5" >
         <tr bgcolor="#3399cc">
           <td><b>${info.name }님 가입을 축하합니다.</b></td>
         </tr>
         <tr>
           <td>
              입력하신 내용대로 가입이 완료되었습니다.<br>
              ${info.name }님께서 요청하신 아이디와 패스워드입니다.
              <p align="center">아이디:${info.id }<br>
                                    패스워드:${info.pass }<br><br>
                 <a href="userconfirm.jsp">로그인 화면</a>                   
              </p>
           </td>
         </tr>
      </table>
      <%}else{ %>
      
     <table width="330" border="0" cellpadding="5">
        <tr bgcolor="#3399cc">
          <td><b>가입이 되지않았습니다.<br>
                    입력내용을 다시 한번 확인해 주세요.</b></td>
        </tr>
        <tr>
          <td>            
             <p align="center">입력이 정확한 경우에도 가입이 되지 않는 경우
              관리자에게 문의하여 주십시요.                   
             </p>
          </td>
        </tr>
     </table>  
     <%} %>     
  </center>
</body>
</html>