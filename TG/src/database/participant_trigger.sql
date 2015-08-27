create or replace trigger group_trigger
after
insert on gxgroup

declare

group_no number;
host varchar2(50);

begin
select max(gno) into group_no from gxgroup;
select ghost into host from gxgroup where gno = group_no;

insert into participant values (group_no, host, 'host');

end;
/