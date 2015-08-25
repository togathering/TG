<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean class="mission.dao.UserDAO" id="dao"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 처리</title>  
  <script type="text/javascript">
     function movePage(){
        location.href="modifyuser.jsp"; 
     }
     
     function movePage2(){
    	 if(confirm("정말탈퇴하시겠습니까?")){
    	 	location.href="deleteid.jsp";
    	 }
     }
  </script>
</head>
<%-- confirmprocess.jsp --%>
<body>
  <center>
  	<%
  		String id = request.getParameter("id");
  		if(dao.selectLogin(id).equals(request.getParameter("passwd"))){
  			session.setAttribute("login", "success");
  			session.setAttribute("id", id);
  		
  	%>
    		  <table width="280" border="0" cellpadding="5">
              <tr bgcolor="#3399cc">
                <td><b>로그인 성공</b></td>
              </tr>
              <tr>
                <td>
                   입력하신 아이디와 패스워드를<br> 확인했습니다.
                   <br><br>
                    <input type="button" value="회원정보수정"  
                              onclick="movePage()" >
                    <input type="button" value="회원탈퇴"  
                    		  onclick="movePage2()">
                   <br><br>
                   <a href="service.jsp">서비스화면</a>
                </td>
              </tr>
           </table>  
    	  <%}else if(!dao.selectLogin(id).equals("")){ %>
           <table width="280" border="0" cellpadding="5">
              <tr bgcolor="#3399cc">
                <td><b>로그인 실패</b></td>
              </tr>
              <tr>
                <td>
                   패스워드가 틀립니다.<br>
                   패스워드를 다시한번 확인해 주시기 바랍니다.<br><br>
                   <a href="userconfirm.jsp">로그인화면</a>
                </td>
              </tr>
           </table>  
    	 <%}else{ %>
    	  <table width="280" border="0" cellpadding="5">
          <tr bgcolor="#3399cc">
            <td><b>로그인 실패</b></td>
          </tr>
          <tr>
            <td>
               다시 아이디를 확인하세요.<br>
               만약 가입하지 않으신 경우 신규가입을 하시기 바랍니다.<br><br>
               <a href="userinput.jsp">신규가입</a>
            </td>
          </tr>
          </table>     
          <%} %>  	 
  </center>
</body>
</html>








