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

-- 트리거 new version 그룹생성시 호스트를 참가자테이블에 등록함과 동시에 그룹성향 테이블에도 insert
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
select decode(substr(gloc,0,3),'충청남','충남', '충남 ', '충남', '충청북','충북', '충북 ', '충북', '서울 ','서울', '서울특', '서울', '경기 ','경기', '경기도','경기', '인천 ', '인천', '인천광', '인천', '강원 ','강원','강원도','강원','전라남','전남','전남 ','전남', '전라북','전북','전북 ','전북', '경상남', '경남', '경남 ', '경남', '경상북', '경북', '경북 ','경북', '부산 ','부산', '부산광','부산', '울산 ', '울산', '울산광','울산','대구 ','대구','대구광','대구','대전 ','대전','대전광','대전','광주 ','광주','광주광','광주','제주도', '제주', '제주특','제주') into loc from gxgroup where gno = group_no;
for idx in (select decode(gender,'M',1,'F',-1) g from participant, member where id = pid and gno = group_no) loop
gender_ratio := gender_ratio + idx.g;

end loop;


insert into group_preference values (group_no, category, loc, gender_ratio);
end;
/