<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/search.css">
<title>ToGathering : ��������</title>
 
<script type="text/javascript">
// üũ�� üũ�ڽ� ���� üũ
function selectChkBox(frm) {

	var sum = 0;
	var count = frm.prefer.length;
	
	for(var i=0; i < count; i++ ){
		if( frm.prefer[i].checked == true ){
			sum += 1;
		}
	} 
	
	if(sum < 4){
		alert("�ּ� 4���� ������ �������ּ���.");
		return;
	} else document.frm.submit();
}
</script>

</head>
<body style="background-color:#FAFAFA; margin:0; ">
<div align="left" style=" padding:15px 0 15px 100px; background-color : white;">
	<a href="main"><img src="img/logo2.png" class="logo" alt="" title=""></a>
	</div>
	<div style="padding-bottom:80px; padding-top:40px; background-color: #FAFAFA; width: 100%;" align="center" >
	
	<div style="background-color: #E6E6E6; border: 1px solid lightgray; padding: 5px 5px; font-size: 15px; width: 620px;">
	<h3>��������</h3>
	</div>
	<div style=" border: 1px solid lightgray; border-top: 0px; padding: 10px 5px; background-color: white; font-size: 14px; width:620px;">
		<p>�� �����Կ��� <strong>�� �´� ������ ��õ�帮�� ����</strong> �����Դϴ�</p>
		<p>�����ϰ� ���� ������ �ּ� 4��, �ִ� 8������ ������ �� ���� ��ư�� �����ּ���.</p>
		<p>���� �Է��ϴ� ���� ������ �ʴ´ٸ� ���ι�ư�� ���� ����ȭ������ �Ͻ� �� �ֽ��ϴ�.</p>
	<form action="sendPrefer" method="post" name="frm" >
        <h4>������ ��ȣ�ϴ� ������ ������?</h4>
		<input type="checkbox" name="prefer" value="����/��ü/�ǳ�z����z8" />ǲ����� | ���� | ��(8), ��(0)<br/>
		<input type="checkbox" name="prefer" value="�񱸱�/����/�ǿ�z����z5" />������ | ���� | ��(7), ��(2)<br />
		<input type="checkbox" name="prefer" value="����/��ü/�ǿ�z��õz-8" />�Ǳ� | ��õ | ��(1), ��(9)<br />
		<input type="checkbox" name="prefer" value="�񱸱�/��ü/�ǿ�z����z2" />�߾߱� | ���� | ��(5), ��(3)<br />
		<input type="checkbox" name="prefer" value="����/����/�ǿ�z����z-1" />����Ʈ�� | ���� | ��(4), ��(5)<br />
		<input type="checkbox" name="prefer" value="�񱸱�/��ü/�ǳ�z�泲z5" />�ʶ��׽� | �泲 | ��(7), ��(2)<br />
		<input type="checkbox" name="prefer" value="����/��ü/�ǿ�z����z0" />�߱� | ���� | ��(4), ��(4)<br />
		<input type="checkbox" name="prefer" value="����/����/�ǿ�z����z-2" />���� | ���� | ��(2), ��(4)<br />
<!-- 	<input type="checkbox" name="prefer" value="����/��ü/�ǳ�|����|0" />222<br />
		<input type="checkbox" name="prefer" value="����/����/�ǳ�|���|-9" />Birds<br />
		<input type="checkbox" name="prefer" value="����/����/�ǳ�|�泲|9" />Birds<br />
		<input type="checkbox" name="prefer" value="����/����/�ǿ�|����|3" />Birds<br />
		<input type="checkbox" name="prefer" value="����/��ü/�ǿ�|��õ|2" />Birds<br />
		<input type="checkbox" name="prefer" value="�񱸱�/��ü/�ǳ�|�泲|5" />Birds<br />
		<input type="checkbox" name="prefer" value="����/��ü/�ǳ�|���|-1" />Birds<br />
		<input type="checkbox" name="prefer" value="����/����/�ǳ�|�泲|-8" />Birds<br />
		<input type="checkbox" name="prefer" value="����/��ü/�ǳ�|���|5" />Birds<br />
		<input type="checkbox" name="prefer" value="����/��ü/�ǿ�|���|5" />Birds<br />
		<input type="checkbox" name="prefer" value="�񱸱�/��ü/�ǳ�|���|-4" />Birds<br />
		<input type="checkbox" name="prefer" value="�񱸱�/��ü/�ǳ�|���|3" />Birds<br />
		<input type="checkbox" name="prefer" value="����/����/�ǳ�|���|5" />Birds<br />
		<input type="checkbox" name="prefer" value="����/����/�ǿ�|����|4" />Birds<br />
		<input type="checkbox" name="prefer" value="�񱸱�/����/�ǳ�|�뱸|1" />Birds<br />
		<input type="checkbox" name="prefer" value="�񱸱�/��ü/�ǿ�|���|5" />Birds<br />
		<input type="checkbox" name="prefer" value="����/��ü/�ǳ�|�λ�|-6" />Birds<br />
		<input type="checkbox" name="prefer" value="�񱸱�/����/�ǳ�|�뱸|5" />Birds<br />
		<input type="checkbox" name="prefer" value="�񱸱�/��ü/�ǿ�|�λ�|-8" />Birds<br />
		<input type="checkbox" name="prefer" value="�񱸱�/��ü/�ǿ�|���|-7" />Birds<br />
		<input type="checkbox" name="prefer" value="�񱸱�/��ü/�ǿ�|���|4" />Birds<br />
		<input type="checkbox" name="prefer" value="�񱸱�/����/�ǳ�|����|2" />Birds<br />
		<input type="checkbox" name="prefer" value="�񱸱�/����/�ǿ�|����|3" />Birds<br />
		<input type="checkbox" name="prefer" value="�񱸱�/����/�ǿ�|����|-1" />Birds<br /> -->
		
	</form>
	</div>
	<div style="margin-top: 20px; margin-left: 50px;">
	<input type="submit" value="����" onclick='selectChkBox(frm)' class="sbutton" /> 
	
	<a href="main"><input type="button" value="����ȭ������" class="sbutton" style="width: 250px;"></a>
	</div>
	</div>
</body>
</html>