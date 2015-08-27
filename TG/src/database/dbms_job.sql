-- 기간이 지난 모임 상태 변경 프로시저
create or replace procedure endgx

is

begin

update gxgroup 
set gstatus = '모임종료' 
where gday < sysdate;

commit;

end endgx;


-- dbms_job 설정 
declare
	jobno number;   -- job의 번호 설정을 위한 선언 등록하면 랜덤으로 지정됨
begin
	dbms_job.submit(jobno,'endgx;', sysdate, 'trunc(sysdate+1)'); -- dbms_job 설정 dbms_job.submit(번호, 실행할 프로시저, 적용할 시간설정 , 실행할 시간설정)
end;