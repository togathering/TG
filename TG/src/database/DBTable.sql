drop table participant;
drop table wish;
drop table admintable;
drop table friend;
drop table invitegroup;
drop table note;
drop table qna;
drop table reply;
drop table report;
drop table review;
drop table banlanguage;
drop table encore;
drop table gxgroup;
drop table member;

--��� ���̺�
create table member
(
id varchar2(50) constraints member_pk primary key,
pass varchar2(30) not null,
nick varchar2(40) unique, 
tel varchar2(20), 
favo varchar2(100),
loc varchar2(100),
birth date,
intro varchar2(200),
gender varchar2(2),
insta varchar2(100),
fbook varchar2(100),
pic varchar2(100),
mdate date,
newbie varchar2(10) default 'newbie'
);

--�׷� ���̺�
create table gxgroup
(
gno number constraints gxgroup_pk primary key,
ghost varchar2(50) constraints gxgroup_fk references member(id),
gtitle varchar2(100) not null,
gloc varchar2(100) not null,
gintro varchar2(1000) not null,
gday date not null,
gmax number not null,
gmin number not null,
gimg varchar2(200),
gdate date not null,
gtag varchar2(20),
gstatus varchar2(20) default '���� ��' not null,
gsum number,
goption varchar2(15) not null
);

drop sequence gxgroup_seq;
create sequence gxgroup_seq
start with 1
increment by 1
nocycle
nocache;


--������ ���̺�
create table participant
(
gno number constraints participant_fk references gxgroup(gno),
pid varchar2(50) constraints participant_fk2 references member(id),
position varchar2(10),
primary key(gno, pid)
);

--���ؿ� ���̺�
create table wish
(
gno number constraints wish_fk references gxgroup(gno),
id varchar2(50) constraints wish_fk2 references member(id),
wdate date not null
);

--������ ���̺�
create table admintable
(
id varchar2(20) constraints admintable_pk primary key,
pass varchar2(20) not null
);

--ģ�� ���̺�
create table friend
(
id varchar2(50) constraints friend_fk references member(id),
fid varchar2(50) constraints friend_fk2 references member(id),
primary key(id, fid)
);

--�ʴ�׷� ���̺�
create table invitegroup
(
id varchar2(50) constraints invitegroup_fk references member(id),
fid varchar2(50) constraints invitegroup_fk2 references member(id),
gno number constraints invitegroup_fk3 references gxgroup(gno),
primary key(id, fid, gno)
);

--���� ���̺�
create table note
(
noteno number constraints note_pk primary key,
senderid varchar2(50) constraints note_fk references member(id),
receiverid varchar2(50) constraints note_fk2 references member(id),
notetitle varchar2(50) not null,
notecontent varchar2(200) not null,
notedate date
);

drop sequence note_seq;
create sequence note_seq
start with 1
increment by 1
nocycle
nocache;

--QnA ���̺�
create table qna
(
qno number constraints qna_pk primary key,
id varchar2(50) constraints qna_fk references member(id),
qtitle varchar2(100) not null,
qcont varchar2(1000) not null,
tel varchar2(20) not null,
qdate date not null,
rcont varchar2(1000),
rdate date,
qstatus varchar2(2)
);

drop sequence qna_seq;
create sequence qna_seq
start with 1
increment by 1
nocycle
nocache;

--��� ���̺�
create table reply
(
no number constraints reply_pk primary key,
name varchar2(50) constraints reply_fk references member(nick),
content varchar2(300),
gno number constraints reply_fk2 references gxgroup(gno),
id varchar2(50) constraints reply_fk3 references member(id)
);

drop sequence reply_seq;
create sequence reply_seq
start with 1
increment by 1
nocycle
nocache;

--�Ű� ���̺�
create table report
(
no number constraints report_pk primary key,
reporter varchar2(50) constraints report_fk references member(id),
accused varchar2(50) constraints report_fk2 references member(id),
category varchar2(100),
content varchar2(300),
rdate date not null,
status varchar2(2) not null
);

drop sequence report_seq;
create sequence report_seq
start with 1
increment by 1
nocycle
nocache;

--�� ���̺�
create table review
(
reviewno number constraints review_pk primary key,
gno number constraints review_fk references gxgroup(gno),
id varchar2(50) constraints review_fk2 references member(id),
evaluator varchar2(50) constraints review_fk3 references member(id),
evaluate varchar2(200),
grade number
);

drop sequence review_seq;
create sequence review_seq
start with 1
increment by 1
nocycle
nocache;

--������ ���̺�
create table banlanguage
(
ban varchar2(50) not null,
category varchar2(50) not null,
primary key(ban, category)
);

--���� ���̺�
create table encore
(
gno number constraints encore_fk references gxgroup(gno),
id varchar2(50) constraints encore_fk2 references member(id)
);

-----------------------------------�߰����̺�----------------------------------------

--���� ī�װ� ���̺�
drop table category;
create table category
(
category_name varchar2(30) constraints category_pk primary key,
category_no varchar2(3) not null
);

insert into category values('����/��ü/�ǳ�' , 111);
insert into category values('����/��ü/�ǿ�', 112);
insert into category values('����/����/�ǳ�', 121);
insert into category values('����/����/�ǿ�', 122);
insert into category values('�񱸱�/��ü/�ǳ�', 211);
insert into category values('�񱸱�/��ü/�ǿ�', 212);
insert into category values('�񱸱�/����/�ǳ�', 221);
insert into category values('�񱸱�/����/�ǿ�', 222);


--���� ���� ���̺�
drop table province;
create table province
(
province_name varchar2(10) constraints province_pk primary key,
province_no varchar2(2) not null
);

insert into province values('����', 11);
insert into province values('���', 12);
insert into province values('��õ', 11);
insert into province values('����', 13);
insert into province values('�泲', 21);
insert into province values('���', 22);
insert into province values('����', 41);
insert into province values('����', 31);
insert into province values('�泲', 42);
insert into province values('���', 23);
insert into province values('�λ�', 43);
insert into province values('���', 43);
insert into province values('�뱸', 33);
insert into province values('����', 22);
insert into province values('����', 41);

 
--���� ���� ���̺�
drop table user_preference;
create table user_preference
(
category_name varchar2(30) constraints user_preference_fk references category(category_name),
province_name varchar2(10) constraints user_preference_fk2 references province(province_name),
ratio number not null
);

drop table group_preference;
create table group_preference
(
category_name varchar2(30) constraints group_preference_fk references category(category_name),
province_name varchar2(10) constraints grou_preference_fk2 references province(province_name),
ratio number not null
);
