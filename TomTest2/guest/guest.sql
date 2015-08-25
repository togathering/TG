drop table guest;
create table guest(
	id number primary key,
	name varchar2(15) not null,
	pass varchar2(15) not null,	
	email varchar2(30),
	tel varchar2(15),
	contents varchar2(200),
	gdate date default sysdate
);

drop sequence guest_seq;
create sequence guest_seq
start with 1
increment by 1
nocycle
nocache;

insert into guest values(guest_seq.nextval, '��ȣ01','1111','hyung@naver.com','010-111-1234','�ȳ��ϼ���', sysdate);
insert into guest values(guest_seq.nextval, '��ȣ02','1111','hyung@naver.com','010-111-1234','�ȳ��ϼ���', sysdate);
insert into guest values(guest_seq.nextval, '��ȣ03','1111','hyung@naver.com','010-111-1234','�ȳ��ϼ���', sysdate);
insert into guest values(guest_seq.nextval, '��ȣ04','1111','hyung@naver.com','010-111-1234','�ȳ��ϼ���', sysdate);
insert into guest values(guest_seq.nextval, '��ȣ05','1111','hyung@naver.com','010-111-1234','�ȳ��ϼ���', sysdate);
insert into guest values(guest_seq.nextval, '��ȣ06','1111','hyung@naver.com','010-111-1234','�ȳ��ϼ���', sysdate);
insert into guest values(guest_seq.nextval, '��ȣ07','1111','hyung@naver.com','010-111-1234','�ȳ��ϼ���', sysdate);
insert into guest values(guest_seq.nextval, '��ȣ08','1111','hyung@naver.com','010-111-1234','�ȳ��ϼ���', sysdate);
insert into guest values(guest_seq.nextval, '��ȣ09','1111','hyung@naver.com','010-111-1234','�ȳ��ϼ���', sysdate);
insert into guest values(guest_seq.nextval, '��ȣ10','1111','hyung@naver.com','010-111-1234','�ȳ��ϼ���', sysdate);
insert into guest values(guest_seq.nextval, '��ȣ11','1111','hyung@naver.com','010-111-1234','�ȳ��ϼ���', sysdate);
insert into guest values(guest_seq.nextval, '��ȣ12','1111','hyung@naver.com','010-111-1234','�ȳ��ϼ���', sysdate);
insert into guest values(guest_seq.nextval, '��ȣ13','1111','hyung@naver.com','010-111-1234','�ȳ��ϼ���', sysdate);
insert into guest values(guest_seq.nextval, '��ȣ14','1111','hyung@naver.com','010-111-1234','�ȳ��ϼ���', sysdate);
insert into guest values(guest_seq.nextval, '��ȣ15','1111','hyung@naver.com','010-111-1234','�ȳ��ϼ���', sysdate);
insert into guest values(guest_seq.nextval, '��ȣ16','1111','hyung@naver.com','010-111-1234','�ȳ��ϼ���', sysdate);
insert into guest values(guest_seq.nextval, '��ȣ17','1111','hyung@naver.com','010-111-1234','�ȳ��ϼ���', sysdate);
insert into guest values(guest_seq.nextval, '��ȣ18','1111','hyung@naver.com','010-111-1234','�ȳ��ϼ���', sysdate);
insert into guest values(guest_seq.nextval, '��ȣ19','1111','hyung@naver.com','010-111-1234','�ȳ��ϼ���', sysdate);
insert into guest values(guest_seq.nextval, '��ȣ20','1111','hyung@naver.com','010-111-1234','�ȳ��ϼ���', sysdate);
insert into guest values(guest_seq.nextval, '��ȣ21','1111','hyung@naver.com','010-111-1234','�ȳ��ϼ���', sysdate);
