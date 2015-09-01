-- 기간이 지난 모임 상태 변경 프로시저
create or replace procedure endgx

is

begin

update gxgroup 
set gstatus = '모임종료' 
where gday < sysdate;

commit;

end endgx;

--기간이 지난 모임 상태 변경 프로시저 ver2
create or replace procedure endgx

is

	type pids is table of participant.pid%type index by binary_integer;
	type num is table of gxgroup.gno%type index by binary_integer;

	p_id pids;
	p_gno num;

	i binary_integer := 0;
	j binary_integer := 0;

begin

	for gno_idx in (select gno from gxgroup where gday < sysdate and gstatus != '모임종료') loop
	
		i := i+1;
		p_gno(i) := gno_idx.gno;
	
	end loop;
	
	
	for idx in 1..i loop
	
		for id_idx in (select pid from participant where gno = p_gno(idx)) loop
			j := j+1;
			p_id(j) := id_idx.pid;
			
			for eval_idx in (select pid from participant where gno = p_gno(idx)) loop
			
				if p_id(j) != eval_idx.pid then
					insert into review values(review_seq.nextval, p_gno(idx), p_id(j), eval_idx.pid, null, null);
				end if;
			
			end loop;
		
		end loop;
	
	end loop;
	
	update gxgroup 
	set gstatus = '모임종료' 
	where gday < sysdate;
	
	commit;

end;
/

-- dbms_job 설정 
declare
	jobno number;   -- job의 번호 설정을 위한 선언 등록하면 랜덤으로 지정됨
begin
	dbms_job.submit(jobno,'endgx;', sysdate, 'sysdate+1/144'); -- dbms_job 설정 dbms_job.submit(번호, 실행할 프로시저, 적용할 시간설정 , 실행할 시간설정)
end;


-- 모임 개최 2일 전 자동쪽지보내기 프로시저
create or replace procedure sendgxnote

is

	type pids is table of participant.pid%type index by binary_integer;
	type num is table of gxgroup.gno%type index by binary_integer;
	type host is table of gxgroup.ghost%type index by binary_integer;
	type title is table of gxgroup.gtitle%type index by binary_integer;	
	type day is table of gxgroup.gday%type index by binary_integer;

	p_gno num;
	p_ghost host;
	p_title title;
	p_day day;

	i binary_integer := 0;

begin

	for gno_idx in (select gno, ghost, gtitle, gday from gxgroup where to_date(gday,'yy/mm/dd') = to_date(sysdate+2,'yy/mm/dd') and gstatus 
			!= '모임종료') loop
	
		i := i+1;
		p_gno(i) := gno_idx.gno;
		p_ghost(i) := gno_idx.ghost;
		p_title(i) := gno_idx.gtitle;
		p_day(i) := gno_idx.gday;
	end loop;
	
	
	for idx in 1..i loop
	
		for id_idx in (select pid from participant where gno = p_gno(idx)) loop
			
			insert into note (noteNo, senderId, receiverId, noteTitle, noteContent, noteDate) 
				values (gxgroup_seq.nextval, p_ghost(idx), id_idx.pid, '모임 2일전 입니다', 
						p_title(idx)||' 모임이 '|| to_char(p_day(idx),'yyyy-mm-dd-hh24-mi')||'에 개최 예정입니다', sysdate);
		
		end loop;
	
	end loop;
	
	
	
	commit;

end;
/

-- sendgxnote 스케줄 등록
declare
	jobno number;   -- job의 번호 설정을 위한 선언 등록하면 랜덤으로 지정됨
begin
	dbms_job.submit(jobno,'sendgxnote;', sysdate, 'trunc(sysdate)+1'); -- dbms_job 설정 dbms_job.submit(번호, 실행할 프로시저, 적용할 시간설정 , 실행할 시간설정)
end;