<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean class="mission.dao.UserDAO" id="dao"></jsp:useBean>
<jsp:useBean class="mission.beans.UserInfo" id="info"></jsp:useBean>
<%
	String id = (String)session.getAttribute("id");
	info = dao.select(id); 
	String [] jumin = info.getJumin().split("-");
	String [] birth = info.getBirth().split("-");
	String [] zip = info.getZip().split("-");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사용자수정</title> 
<script>
	function check(){
		pass = document.frm.pass.value;
		pass2 = document.frm.pass2.value;
		zip1 = document.frm.zip1.value;
		zip2 = document.frm.zip2.value;
		addr = document.frm.addr.value;
		email = document.frm.email.value;
		job = document.frm.job.value;
		if(pass=="" || pass2==""){
			alert("비번입력!!");
			return false;
		}else if(pass!=pass2){
			alert("비밀번호가 서로 다릅니다");
			return false;
		}else if(email==""){
			alert("이메일 입력!!");
			return false;
		}
	}

</script>

</head> 
<body>
  <center>
  <form name="frm" action="modifyprocess.jsp" method="post">
  <table width="600" border="0" cellpadding="5" >
      <tr bgcolor="#3399cc">
         <td><font size="4" color="white">사용자정보수정</font>
      </tr>      
  </table>
  <table border="1" cellpadding="5" width="600">
      <tr>
         <td width="100" bgcolor="#ffcccc">사용자ID</td>
         <td colspan="3">       
         <input type="text" name="id" disabled="disabled" value="<%=id%>"></td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">비밀번호</td>
         <td><input type="password" name="pass" > </td>
         <td width="100" bgcolor="#ffcccc">비번확인</td>
         <td><input type="password" name="pass2" > </td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">사용자이름</td>
         <td colspan="3">
         <input type="text" name="name" disabled="disabled" value="<%=info.getName()%>">        
         </td>
         
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">주민번호</td>
         <td colspan="3">
              <input type="text" name="jumin1" size="6" maxlength="6"
                      style="height:23px" disabled="disabled" value="<%=jumin[0]%>">
              -
              <input type="password" name="jumin2" size="7" maxlength="7"
                      style="height:23px" disabled="disabled" value="<%=jumin[1]%>"></td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc" >생년월일</td>
         <td colspan="3">
         <input type="text" name="year" size="4" maxlength="4" disabled="disabled" value="<%=birth[0]%>">년
         <select name="month" disabled="disabled" >
         	<option><%=birth[1]%></option>
         </select va>월          
         <select name="day" disabled="disabled">
         	<option><%=birth[2]%></option>    
         </select>일          
          </td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">우편번호</td>
         <td colspan="3">
            <input type="text" name="zip1" size="3" maxlength="3" value="<%=zip[0]%>"> 
            - 
            <input type="text" name="zip2" size="3" maxlength="3" value="<%=zip[1]%>">
	     </td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">주소</td>
         <td colspan="3"><input type="text" name="addr" size="50" value="<%=info.getAddr()%>"></td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">E-Mail</td>
         <td colspan="3"><input type="text" name="email" size="30" value="<%=info.getEmail()%>">
          </td>
      </tr>
    
      <tr>
         <td width="100" bgcolor="#ffcccc">직업</td>
         <td colspan="3">
               <select name="job">
               <% String [] jobs = {"학생","공무원","언론/출판","군인/경찰","일반사무직","영업직","기술/전문직","보건/의료","자영업","주부","기타"}; 
               		for(int i=0;i<jobs.length;i++){
               			if(jobs[i].equals(info.getJob())){
               %>
               				<option value="<%= jobs[i]%>" selected="selected"><%= jobs[i]%></option>
               			<%}else{ %>	
               				<option value="<%= jobs[i]%>"><%= jobs[i]%></option>
               			<%}
               		}%>
               <%-- 
                     <option <% if (info.getJob().equals("학생"))out.print("selected");%>>학생</option>
                     <option <% if (info.getJob().equals("공무원"))out.print("selected");%>>공무원</option>
                     <option <% if (info.getJob().equals("언론/출판"))out.print("selected");%>>언론/출판</option>
                     <option <% if (info.getJob().equals("군인/경찰"))out.print("selected");%>>군인/경찰</option>
                     <option <% if (info.getJob().equals("일반사무직"))out.print("selected");%>>일반사무직</option>
                     <option <% if (info.getJob().equals("영업직"))out.print("selected");%>>영업직</option>
                     <option <% if (info.getJob().equals("기술/전문직"))out.print("selected");%>>기술/전문직</option>
                     <option <% if (info.getJob().equals("보건/의료"))out.print("selected");%>>보건/의료</option>
                     <option <% if (info.getJob().equals("자영업"))out.print("selected");%>>자영업</option>
                     <option <% if (info.getJob().equals("주부"))out.print("selected");%>>주부</option>
                     <option <% if (info.getJob().equals("기타"))out.print("selected");%>>기타</option>
               --%>
                  </select>
         </td>
      </tr>
      <tr align="center">
         <td colspan="4">
           <input type="submit" value="수정">
           <input type="reset" value="취소">
         </td>
      </tr>
  </table>
  </form>
  </center>
</body>
</html>