<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
 
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
<body>
	
	<h3>�����Կ��� �� �´� ������ ��õ�帮�� ���� �����Դϴ�..</h3>
	<h3>�����ϰ� ���� ������ �ּ� 4��, �ִ� 8������ ������ �� ���� ��ư�� �����ּ���.</h3>
	<h3>���� �Է��Ͻô� ���� ������ �����ôٸ� ���ι�ư�� ���� ����ȭ������ �Ͻ� �� �ֽ��ϴ�.</h3>
	
	<form action="sendPrefer" method="post" name="frm">
        <p>������ ��ȣ�ϴ� ������ ������?</p>
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
	
	<input type="submit" value="����" onclick='selectChkBox(frm)'/> 
	
	<a href="main"><input type="button" value="����ȭ������"></a>

</body>
</html>