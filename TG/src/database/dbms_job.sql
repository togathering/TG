--��ɾ��
SELECT * FROM USER_JOBS; --��ϵ� job ��ȸ  job: ��ϵ� job ��ȣ, what : job �� �����ϴ� ���ν���

BEGIN -- job ����
   DBMS_JOB.REMOVE(JOB_NO);
   COMMIT;
END;
/

-- ���յ� ���ν���
create or replace procedure endgx

is

	type pids is table of participant.pid%type index by binary_integer;
	type num is table of gxgroup.gno%type index by binary_integer;
	type host is table of gxgroup.ghost%type index by binary_integer;
	type title is table of gxgroup.gtitle%type index by binary_integer;	
	type day is table of gxgroup.gday%type index by binary_integer;
	type tels is table of member.tel%type index by binary_integer; 
	type min is table of gxgroup.gmin%type index by binary_integer;
	type sum is table of gxgroup.gsum%type index by binary_integer;
	
	p_gno num;
	p_ghost host;
	p_title title;
	p_day day;
	p_tel tels;
	p_id pids;
	p_min min;
	p_sum sum;
	msg varchar2(420);

	i binary_integer := 0;
	j binary_integer := 0;
	k binary_integer := 0;

begin

	for gno_idx in (select gno, ghost, gtitle, gday, gmin, gsum 
						from gxgroup 
						where to_char(gday,'yyyy-mm-dd-hh24-mi') = to_char(sysdate+1,'yyyy-mm-dd-hh24-mi') 
								and gstatus != '��������') loop
	
		i := i+1;
		p_gno(i) := gno_idx.gno;
		p_ghost(i) := gno_idx.ghost;
		p_title(i) := gno_idx.gtitle;
		p_day(i) := gno_idx.gday;
		p_min(i) := gno_idx.gmin;
		p_sum(i) := gno_idx.gsum;
	end loop;
	
	
	for idx in 1..i loop
		
		for id_idx in (select pid, tel from member, participant where id = pid and gno = p_gno(idx)) loop
			j := j+1;
			p_id(j) := id_idx.pid;
			
			for eval_idx in (select pid from participant where gno = p_gno(idx)) loop
				if p_min(idx) <= p_sum(idx) then
					if p_id(j) != eval_idx.pid then
						insert into review values(review_seq.nextval, p_gno(idx), p_id(j), eval_idx.pid, null, null);
					end if;
				end if;		
			end loop;				

			if p_ghost(idx) != id_idx.pid then
				if p_min(idx) <= p_sum(idx) then
					k := k+1;
					p_tel(k) := id_idx.tel;
					p_id(k) := id_idx.pid;
					insert into note (noteNo, senderId, receiverId, noteTitle, noteContent, noteDate) 
						values (gxgroup_seq.nextval, p_ghost(idx), id_idx.pid, '���� 1���� �Դϴ�', 
								p_title(idx)||' ������ '|| to_char(p_day(idx),'yyyy-mm-dd-hh24-mi')||'�� ���� �����Դϴ�', sysdate);
				else
					insert into note (noteNo, senderId, receiverId, noteTitle, noteContent, noteDate) 
						values (gxgroup_seq.nextval, p_ghost(idx), id_idx.pid, '������ �ּ��ο��� �������� ���Ͽ� ��ҵǾ����ϴ�', 
								p_title(idx)||' ������ �ּ��ο� '|| p_min(idx) ||'���� �������� ���Ͽ��� ��ҵǾ����ϴ�', sysdate);
					
				end if;
			end if;
		
		end loop;

		for idx2 in 1..k loop
			msg := msg ||'���̵�: '|| p_id(idx2) ||' ��ȭ��ȣ: '|| p_tel(idx2) ||chr(13)||chr(10); 
		end loop;
		if p_min(idx) <= p_sum(idx) then
			
			insert into note (noteNo, senderId, receiverId, noteTitle, noteContent, noteDate) 
						values (gxgroup_seq.nextval, p_ghost(idx), p_ghost(idx), '���� 1���� �Դϴ�', 
								p_title(idx)||' ������ '|| to_char(p_day(idx),'yyyy-mm-dd-hh24-mi')||'�� ���� �����Դϴ�'||chr(10)||chr(13)||'�����ο� �����Դϴ�'||chr(13)||chr(10)|| msg, sysdate);
	

		else
			insert into note (noteNo, senderId, receiverId, noteTitle, noteContent, noteDate) 
						values (gxgroup_seq.nextval, p_ghost(idx), p_ghost(idx), '������ �ּ��ο��� �������� ���Ͽ� ��ҵǾ����ϴ�', 
								p_title(idx)||' ������ �ּ��ο� '|| p_min(idx) ||'���� �������� ���Ͽ��� ��ҵǾ����ϴ�', sysdate);
		end if;

		
		
		if p_min(idx) <= p_sum(idx) then
			delete from participant where gno = p_gno(idx) and position != 'host';
			update gxgroup set gsum = 1 where gno = p_gno(idx);
		end if;

		k := 0;
		j := 0;
		msg := '';
	end loop;
	
	update gxgroup 
		set gstatus = '��������' 
		where to_char(gday,'yyyy-mm-dd-hh24-mi') = to_char(sysdate+1,'yyyy-mm-dd-hh24-mi');
	
	commit;

end;
/


declare
	jobno number;   -- job�� ��ȣ ������ ���� ���� ����ϸ� �������� ������
begin
	dbms_job.submit(jobno,'endgx;', sysdate, 'sysdate+1/144'); -- dbms_job ���� dbms_job.submit(��ȣ, ������ ���ν���, ������ �ð����� , ������ �ð�����)
end;
/