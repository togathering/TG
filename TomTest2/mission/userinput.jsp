<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사용자등록</title>
<script type="text/javascript">
	function movePage(){
		var id = document.frm.id.value;
		if(id==""){alert("아이디 입력!!"); return;}
		newWin = window.open("confirmid.jsp?id="+id,'confirm','toolbar=no,scrollbars=no,top=200,left=300,width=300,height=200')		
	}
	
	function check(){
		id = document.frm.id.value;
		name = document.frm.name.value;
		pass = document.frm.pass.value;
		pass2 = document.frm.pass2.value;
		jumin1 = document.frm.jumin1.value;
		jumin2 = document.frm.jumin2.value;
		year = document.frm.year.value;
		month = document.frm.month.value;
		day = document.frm.day.value;
		zip1 = document.frm.zip1.value;
		zip2 = document.frm.zip2.value;
		addr = document.frm.addr.value;
		email = document.frm.email.value;
		job = document.frm.job.value;
		
		var email_Exp = new RegExp('^[a-zA-Z0-9]{6,15}@[a-zA-Z]+[.][a-zA-Z]+$','g');
		
		if(id==""){
			alert("아이디를 입력하세요");
			return false;
		}else if(name==""){
			alert("이름을 입력하세요");
			return false;
		}else if(pass=="" || pass2==""){
			alert("비번입력!!");
			return false;
		}else if(pass!=pass2){
			alert("비밀번호가 서로 다릅니다");
			return false;
		}else if(jumin1=="" || jumin2==""){
			alert("주민번호입력!");
			return false;
		}else if(email==""){
			alert("이메일 입력!!");
			return false;
		}else if(isNaN(jumin1) || isNaN(jumin2)){
			alert("주민번호를 확인!!");
			return false;
		}else if(jumin1.length != 6 || jumin2.length != 7){
			alert("주민번호자릿수 확인!!");
			return false;
		}else if(!email_Exp.test(email)){
			alert("이메일 형식 확인!!");
			return false;
		}
	}
	
</script>    
</head>
<body>
  <center>
  <form name="frm" action="userprocess.jsp" method="post" onsubmit="return check()">
  <table width="600" border="0" cellpadding="5" >
      <tr bgcolor="#3399cc">
         <td><font size="4" color="white">사용자정보입력</font>
      </tr>
      <tr>
         <td>안녕하세요. 이 페이지를 자유롭게 이용하려면
               먼저 회원가입을 하셔야 합니다.<br>
               아래의 사항들을 빠짐없이 기록해 주세요.
         </td>
      </tr>
  </table>
  <table border="1" cellpadding="5" width="600">
      <tr>
         <td width="100" bgcolor="#ffcccc">사용자ID</td>
         <td colspan="3"><input type="text" name="id"> 
         <input type="button" value="중복확인"  onclick="movePage()"> </td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">비밀번호</td>
         <td><input type="password" name="pass"> </td>
         <td width="100" bgcolor="#ffcccc">비번확인</td>
         <td><input type="password" name="pass2"> </td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">사용자이름</td>
         <td colspan="3"><input type="text" name="name"> </td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">주민번호</td>
         <td colspan="3">
              <input type="text" name="jumin1" size="6" maxlength="6"
                      style="height:23px" >
              -
              <input type="password" name="jumin2" size="7" maxlength="7"
                      style="height:23px" ></td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc" >생년월일</td>
         <td colspan="3">
         <input type="text" name="year" size="4" maxlength="4">년
         <select name="month">
         <option>--</option>
         <%for(int i=1;i<13;i++){ 
         	if(i<10){%>
         	<option>0<%=i %></option>
         	<%}else{ %>
         	<option><%=i %></option>
         <%}
         } %>          
         </select>월          
         <select name="day" >
         <option>--</option>
         <%for(int i=1;i<32;i++){ %>            
			<option><%=i %></option>
         <%} %>
         </select>일          
          </td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">우편번호</td>
         <td colspan="3">
            <input type="text" name="zip1" size="3" maxlength="3"> 
            - 
            <input type="text" name="zip2" size="3" maxlength="3"></td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">주소</td>
         <td colspan="3"><input type="text" name="addr" size="50"></td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">E-Mail</td>
         <td colspan="3"><input type="text" name="email" size="30"></td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">직업</td>
         <td colspan="3">
               <select name="job" >
                     <option>학생</option>
                     <option>공무원</option>
                     <option>언론/출판</option>
                     <option>군인/경찰</option>
                     <option>일반사무직</option>
                     <option>영업직</option>
                     <option>기술/전문직</option>
                     <option>보건/의료</option>
                     <option>자영업</option>
                     <option>주부</option>
                     <option>기타</option>
                  </select>
         </td>
      </tr>
      <tr align="center">
         <td colspan="4">
           <input type="submit" value="등록" >
           <input type="reset" value="취소">
         </td>
      </tr>
  </table>
  </form>
  </center>
</body>
</html>