-- �Ⱓ�� ���� ���� ���� ���� ���ν���
create or replace procedure endgx

is

begin

update gxgroup 
set gstatus = '��������' 
where gday < sysdate;

commit;

end endgx;


-- dbms_job ���� 
declare
	jobno number;   -- job�� ��ȣ ������ ���� ���� ����ϸ� �������� ������
begin
	dbms_job.submit(jobno,'endgx;', sysdate, 'trunc(sysdate+1)'); -- dbms_job ���� dbms_job.submit(��ȣ, ������ ���ν���, ������ �ð����� , ������ �ð�����)
end;