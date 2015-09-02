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

-- Ʈ���� new version �׷������ ȣ��Ʈ�� ���������̺� ����԰� ���ÿ� �׷켺�� ���̺��� insert
create or replace trigger group_trigger
after
insert on gxgroup

declare

group_no number;
host varchar2(50);
category varchar2(30);
loc varchar2(10);
gender_ratio number;

begin
select max(gno) into group_no from gxgroup;
select ghost into host from gxgroup where gno = group_no;
insert into participant values (group_no, host, 'host');

gender_ratio := 0;
select gcategory into category from gxgroup where gno = group_no;
select decode(substr(gloc,0,3),'��û��','�泲', '�泲 ', '�泲', '��û��','���', '��� ', '���', '���� ','����', '����Ư', '����', '��� ','���', '��⵵','���', '��õ ', '��õ', '��õ��', '��õ', '���� ','����','������','����','����','����','���� ','����', '�����','����','���� ','����', '���', '�泲', '�泲 ', '�泲', '����', '���', '��� ','���', '�λ� ','�λ�', '�λ걤','�λ�', '��� ', '���', '��걤','���','�뱸 ','�뱸','�뱸��','�뱸','���� ','����','������','����','���� ','����','���ֱ�','����','���ֵ�', '����', '����Ư','����') into loc from gxgroup where gno = group_no;
for idx in (select decode(gender,'M',1,'F',-1) g from participant, member where id = pid and gno = group_no) loop
gender_ratio := gender_ratio + idx.g;

end loop;


insert into group_preference values (group_no, category, loc, gender_ratio);
end;
/