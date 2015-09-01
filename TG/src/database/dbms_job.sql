-- �Ⱓ�� ���� ���� ���� ���� ���ν���
create or replace procedure endgx

is

begin

update gxgroup 
set gstatus = '��������' 
where gday < sysdate;

commit;

end endgx;

--�Ⱓ�� ���� ���� ���� ���� ���ν��� ver2
create or replace procedure endgx

is

	type pids is table of participant.pid%type index by binary_integer;
	type num is table of gxgroup.gno%type index by binary_integer;

	p_id pids;
	p_gno num;

	i binary_integer := 0;
	j binary_integer := 0;

begin

	for gno_idx in (select gno from gxgroup where gday < sysdate and gstatus != '��������') loop
	
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
	set gstatus = '��������' 
	where gday < sysdate;
	
	commit;

end;
/

-- dbms_job ���� 
declare
	jobno number;   -- job�� ��ȣ ������ ���� ���� ����ϸ� �������� ������
begin
	dbms_job.submit(jobno,'endgx;', sysdate, 'sysdate+1/144'); -- dbms_job ���� dbms_job.submit(��ȣ, ������ ���ν���, ������ �ð����� , ������ �ð�����)
end;


-- ���� ���� 2�� �� �ڵ����������� ���ν���
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
			!= '��������') loop
	
		i := i+1;
		p_gno(i) := gno_idx.gno;
		p_ghost(i) := gno_idx.ghost;
		p_title(i) := gno_idx.gtitle;
		p_day(i) := gno_idx.gday;
	end loop;
	
	
	for idx in 1..i loop
	
		for id_idx in (select pid from participant where gno = p_gno(idx)) loop
			
			insert into note (noteNo, senderId, receiverId, noteTitle, noteContent, noteDate) 
				values (gxgroup_seq.nextval, p_ghost(idx), id_idx.pid, '���� 2���� �Դϴ�', 
						p_title(idx)||' ������ '|| to_char(p_day(idx),'yyyy-mm-dd-hh24-mi')||'�� ���� �����Դϴ�', sysdate);
		
		end loop;
	
	end loop;
	
	
	
	commit;

end;
/

-- sendgxnote ������ ���
declare
	jobno number;   -- job�� ��ȣ ������ ���� ���� ����ϸ� �������� ������
begin
	dbms_job.submit(jobno,'sendgxnote;', sysdate, 'trunc(sysdate)+1'); -- dbms_job ���� dbms_job.submit(��ȣ, ������ ���ν���, ������ �ð����� , ������ �ð�����)
end;