-- ù��° ���� ���ν��� 

create or replace procedure del_user (delid in varchar2)
is	

begin

-- �ٷλ���
delete from friend where id= delid or fid=delid;
delete from invitegroup where id= delid or fid=delid;
delete from encore where id=delid ;
delete from wish where id=delid ;

-- ���Ļ���(�̸�����)

update participant set pid= '(Ż��ȸ��)'||delid where pid= delid;
update reply set id = '(Ż��ȸ��)'||delid where id= delid;
update member set id='(Ż��ȸ��)'||delid where id = delid;
update qna set id='(Ż��ȸ��)'||delid where id=delid;

-- ��������(�̸�����)
update note set senderid = '(Ż��ȸ��)'||delid where senderid= delid;
update note set receiverid = '(Ż��ȸ��)'||delid where receiverid= delid;
update report set reporter = '(Ż��ȸ��)'||delid where reporter= delid;
update report set accused= '(Ż��ȸ��)'||delid where accused= delid;

-- �׷���� 

	delete from gxgroup where ghost=delid and gdate<=gday;
	update gxgroup set ghost= '(Ż��ȸ��)'||delid where ghost= delid;
	

commit;

  exception 

  	when others then 
  	rollback;
end;
/
--===============================================================================================
--�ι�° ���� ���ν��� 

create or replace procedure del_user2 (delid in varchar2)
is
begin
--����� ����
delete from gxgroup where ghost=delid;
delete from participant where pid=delid;
delete from reply where id=delid;
delete from member where id=delid;
delete from qna where id=delid;

-- ȸ�����̵𺯰�
update note set senderid = '(Ż��ȸ��)'||TO_CHAR(SYSDATE,'YYMMDD')||delmember.nextval where senderid= delid;
update note set receiverid = '(Ż��ȸ��)'||TO_CHAR(SYSDATE,'YYMMDD')||delmember.nextval where receiverid= delid;
update report set reporter = '(Ż��ȸ��)'||TO_CHAR(SYSDATE,'YYMMDD')||delmember.nextval where reporter= delid;
update report set accused= '(Ż��ȸ��)'||TO_CHAR(SYSDATE,'YYMMDD')||delmember.nextval where accused= delid;


commit;

  exception 

    
  	when others then 
  	rollback;
end;
/


--===============================================================================================
-- Ż���� ��� �ڿ� �ٿ��� ������ ���� ������ 
create sequence delmember
start with 1
increment by 1
maxvalue 999999
cycle;

--===============================================================================================
-- �׷� ���� ���ν��� 


create or replace procedure del_group(delg in varchar2)
is	

begin

delete from wish where gno= delg;
delete from invitegroup where gno= delg;
delete from participant where gno= delg ;
delete from reply where gno = delg;

delete from gxgroup where gno=delg;

commit;

  exception 

  	when others then 
  	rollback;
end;
/