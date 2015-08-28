
create or replace procedure del_user (delid in varchar2)
is
 
begin
-- �ٷλ���
 delete from friend where id= delid or fid=delid;
 delete from invitegroup where id= delid  or fid=delid;
 delete from encore where id=delid ;
 delete from wish where id=delid ;
 
 
-- ���Ļ���(�̸�����)

update gxgroup set ghost= '(Ż��ȸ��)'||delid where ghost= delid;
update participant set pid= '(Ż��ȸ��)'||delid where pid= delid;
update reply set id = '(Ż��ȸ��)'||delid where id= delid;
update member set id='(Ż��ȸ��)'||delid where id = delid;
update qna set id='(Ż��ȸ��)'||delid where id=delid;

-- ��������(�̸�����)
update note set senderid = '(Ż��ȸ��)'||delid where senderid= delid;
update note set receiverid = '(Ż��ȸ��)'||delid where receiverid= delid;
update report1 set reporter = '(Ż��ȸ��)'||delid where reporter= delid;
update report1 set accused= '(Ż��ȸ��)'||delid where accused= delid;
end;
/


create sequence delmember
start with 1
increment by 1
maxvalue 999999
cycle;





create or replace procedure del_user2 (delid in varchar2)
is 
begin 
--����� ����
delete from gxgroup where ghost='(Ż��ȸ��)'||delid;
delete from participant where pid='(Ż��ȸ��)'||delid;
delete from reply where id='(Ż��ȸ��)'||delid;
delete from member where id='(Ż��ȸ��)'||delid;
delete from qna where id='(Ż��ȸ��)'||delid;

-- ȸ�����̵𺯰�
update note set senderid = '(Ż��ȸ��)'||delmember.nextval where senderid= '(Ż��ȸ��)'||delid;
update note set receiverid = '(Ż��ȸ��)'||delmember.nextval where receiverid= '(Ż��ȸ��)'||delid;
update report1 set reporter = '(Ż��ȸ��)'||delmember.nextval where reporter= '(Ż��ȸ��)'||delid;
update report1 set accused= '(Ż��ȸ��)'||delmember.nextval where accused= '(Ż��ȸ��)'||delid;

end;
/