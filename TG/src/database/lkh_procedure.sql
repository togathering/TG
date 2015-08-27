
create or replace procedure del_user (delid in varchar2)
is
 
begin
-- ¹Ù·Î»èÁ¦
 delete from friend where id= delid or fid=delid;
 delete from invitegroup where id= delid  or fid=delid;
 delete from encore where id=delid ;
 delete from wish where id=delid ;
 
 
-- ÃßÈÄ»èÁ¦(ÀÌ¸§º¯°æ)

update gxgroup set ghost= '(Å»ÅğÈ¸¿ø)'||delid where ghost= delid;
update participant set pid= '(Å»ÅğÈ¸¿ø)'||delid where pid= delid;
update reply set id = '(Å»ÅğÈ¸¿ø)'||delid where id= delid;
update member set id='(Å»ÅğÈ¸¿ø)'||delid where id = delid;
update qna set id='(Å»ÅğÈ¸¿ø)'||delid where id=delid;

-- ¿µ±¸º¸Á¸(ÀÌ¸§º¯°æ)
update note set senderid = '(Å»ÅğÈ¸¿ø)'||delid where senderid= delid;
update note set receiverid = '(Å»ÅğÈ¸¿ø)'||delid where receiverid= delid;
update report1 set reporter = '(Å»ÅğÈ¸¿ø)'||delid where reporter= delid;
update report1 set accused= '(Å»ÅğÈ¸¿ø)'||delid where accused= delid;
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
--°æ°úÈÄ »èÁ¦
delete from gxgroup where ghost='(Å»ÅğÈ¸¿ø)'||delid;
delete from participant where pid='(Å»ÅğÈ¸¿ø)'||delid;
delete from reply where id='(Å»ÅğÈ¸¿ø)'||delid;
delete from member where id='(Å»ÅğÈ¸¿ø)'||delid;
delete from qna where id='(Å»ÅğÈ¸¿ø)'||delid;

-- È¸¿ø¾ÆÀÌµğº¯°æ
update note set senderid = '(Å»ÅğÈ¸¿ø)'||delmember.nextval where senderid= '(Å»ÅğÈ¸¿ø)'||delid;
update note set receiverid = '(Å»ÅğÈ¸¿ø)'||delmember.nextval where receiverid= '(Å»ÅğÈ¸¿ø)'||delid;
update report1 set reporter = '(Å»ÅğÈ¸¿ø)'||delmember.nextval where reporter= '(Å»ÅğÈ¸¿ø)'||delid;
update report1 set accused= '(Å»ÅğÈ¸¿ø)'||delmember.nextval where accused= '(Å»ÅğÈ¸¿ø)'||delid;

end;
/