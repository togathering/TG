-- Ã¹¹øÂ° »èÁ¦ ÇÁ·Î½ÃÀú 

create or replace procedure del_user (delid in varchar2)
is	

begin

-- ¹Ù·Î»èÁ¦
delete from friend where id= delid or fid=delid;
delete from invitegroup where id= delid or fid=delid;
delete from encore where id=delid ;
delete from wish where id=delid ;

-- ÃßÈÄ»èÁ¦(ÀÌ¸§º¯°æ)

update participant set pid= '(Å»ÅğÈ¸¿ø)'||delid where pid= delid;
update reply set id = '(Å»ÅğÈ¸¿ø)'||delid where id= delid;
update member set id='(Å»ÅğÈ¸¿ø)'||delid where id = delid;
update qna set id='(Å»ÅğÈ¸¿ø)'||delid where id=delid;

-- ¿µ±¸º¸Á¸(ÀÌ¸§º¯°æ)
update note set senderid = '(Å»ÅğÈ¸¿ø)'||delid where senderid= delid;
update note set receiverid = '(Å»ÅğÈ¸¿ø)'||delid where receiverid= delid;
update report set reporter = '(Å»ÅğÈ¸¿ø)'||delid where reporter= delid;
update report set accused= '(Å»ÅğÈ¸¿ø)'||delid where accused= delid;

-- ±×·ì°ü·Ã 

	delete from gxgroup where ghost=delid and gdate<=gday;
	update gxgroup set ghost= '(Å»ÅğÈ¸¿ø)'||delid where ghost= delid;
	

commit;

  exception 

  	when others then 
  	rollback;
end;
/
--===============================================================================================
--µÎ¹øÂ° »èÁ¦ ÇÁ·Î½ÃÀú 

create or replace procedure del_user2 (delid in varchar2)
is
begin
--°æ°úÈÄ »èÁ¦
delete from gxgroup where ghost=delid;
delete from participant where pid=delid;
delete from reply where id=delid;
delete from member where id=delid;
delete from qna where id=delid;

-- È¸¿ø¾ÆÀÌµğº¯°æ
update note set senderid = '(Å»ÅğÈ¸¿ø)'||TO_CHAR(SYSDATE,'YYMMDD')||delmember.nextval where senderid= delid;
update note set receiverid = '(Å»ÅğÈ¸¿ø)'||TO_CHAR(SYSDATE,'YYMMDD')||delmember.nextval where receiverid= delid;
update report set reporter = '(Å»ÅğÈ¸¿ø)'||TO_CHAR(SYSDATE,'YYMMDD')||delmember.nextval where reporter= delid;
update report set accused= '(Å»ÅğÈ¸¿ø)'||TO_CHAR(SYSDATE,'YYMMDD')||delmember.nextval where accused= delid;


commit;

  exception 

    
  	when others then 
  	rollback;
end;
/


--===============================================================================================
-- Å»ÅğÇÑ »ç¶÷ µÚ¿¡ ºÙ¿©ÁÙ ·£´ıÀÇ ¼ıÀÚ ½ÃÄö½º 
create sequence delmember
start with 1
increment by 1
maxvalue 999999
cycle;

--===============================================================================================
-- ±×·ì »èÁ¦ ÇÁ·Î½ÃÀú 


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