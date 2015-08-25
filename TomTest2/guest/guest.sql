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

insert into guest values(guest_seq.nextval, '형호01','1111','hyung@naver.com','010-111-1234','안녕하세요', sysdate);
insert into guest values(guest_seq.nextval, '형호02','1111','hyung@naver.com','010-111-1234','안녕하세요', sysdate);
insert into guest values(guest_seq.nextval, '형호03','1111','hyung@naver.com','010-111-1234','안녕하세요', sysdate);
insert into guest values(guest_seq.nextval, '형호04','1111','hyung@naver.com','010-111-1234','안녕하세요', sysdate);
insert into guest values(guest_seq.nextval, '형호05','1111','hyung@naver.com','010-111-1234','안녕하세요', sysdate);
insert into guest values(guest_seq.nextval, '형호06','1111','hyung@naver.com','010-111-1234','안녕하세요', sysdate);
insert into guest values(guest_seq.nextval, '형호07','1111','hyung@naver.com','010-111-1234','안녕하세요', sysdate);
insert into guest values(guest_seq.nextval, '형호08','1111','hyung@naver.com','010-111-1234','안녕하세요', sysdate);
insert into guest values(guest_seq.nextval, '형호09','1111','hyung@naver.com','010-111-1234','안녕하세요', sysdate);
insert into guest values(guest_seq.nextval, '형호10','1111','hyung@naver.com','010-111-1234','안녕하세요', sysdate);
insert into guest values(guest_seq.nextval, '형호11','1111','hyung@naver.com','010-111-1234','안녕하세요', sysdate);
insert into guest values(guest_seq.nextval, '형호12','1111','hyung@naver.com','010-111-1234','안녕하세요', sysdate);
insert into guest values(guest_seq.nextval, '형호13','1111','hyung@naver.com','010-111-1234','안녕하세요', sysdate);
insert into guest values(guest_seq.nextval, '형호14','1111','hyung@naver.com','010-111-1234','안녕하세요', sysdate);
insert into guest values(guest_seq.nextval, '형호15','1111','hyung@naver.com','010-111-1234','안녕하세요', sysdate);
insert into guest values(guest_seq.nextval, '형호16','1111','hyung@naver.com','010-111-1234','안녕하세요', sysdate);
insert into guest values(guest_seq.nextval, '형호17','1111','hyung@naver.com','010-111-1234','안녕하세요', sysdate);
insert into guest values(guest_seq.nextval, '형호18','1111','hyung@naver.com','010-111-1234','안녕하세요', sysdate);
insert into guest values(guest_seq.nextval, '형호19','1111','hyung@naver.com','010-111-1234','안녕하세요', sysdate);
insert into guest values(guest_seq.nextval, '형호20','1111','hyung@naver.com','010-111-1234','안녕하세요', sysdate);
insert into guest values(guest_seq.nextval, '형호21','1111','hyung@naver.com','010-111-1234','안녕하세요', sysdate);
