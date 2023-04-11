set lines 256;
set trimout on;
set tab off;


drop table appointment;
drop table availability;
drop table doc_specialization;
drop table qualification;
drop table specialization;
drop table doctor;
drop table patient_dept;
drop table patient;
drop table department;

create table specialization(
    id number(10) not null,
    name varchar(20),
    primary key(id)  
);


insert into specialization(id,name) values (1,'nurology');
insert into specialization(id,name) values (2,'cardiology');
insert into specialization(id,name) values (3,'nephrology');
insert into specialization(id,name) values (4,'gynocology');
insert into specialization(id,name) values (5,'endrocynology');

create table doctor(
    id number(10) not null,
    name varchar(20),
    practicing_from date,
    contact_no varchar(20),
    department varchar(30),
    primary key(id)
);


insert into doctor(id,name,practicing_from,contact_no,department) 
values (1,'rownak',TO_DATE('05-jan-2022'),'01756291819','nurology');
insert into doctor(id,name,practicing_from,contact_no,department) 
values (2,'shuvo',TO_DATE('05-jan-2022'),'01756291819','cardiology');
insert into doctor(id,name,practicing_from,contact_no,department)
values (3,'labib',TO_DATE('05-feb-2022'),'01756291819','endocrynology');
insert into doctor(id,name,practicing_from,contact_no,department) 
values (4,'tanim',TO_DATE('05-jan-2022'),'01756291819','nephrology');
insert into doctor(id,name,practicing_from,contact_no,department) 
values (5,'alvee',TO_DATE('05-jan-2022'),'01756291819','gynocology and obstetrics');

create table doc_specialization(
    doc_id number(10) not null,
    specialization_id number(20) not null,
    primary key(doc_id,specialization_id),
    foreign key (doc_id) references doctor(id),
    foreign key (specialization_id) references specialization(id)
);


insert into doc_specialization 
(doc_id,specialization_id) values (1,1);
insert into doc_specialization 
(doc_id,specialization_id) values (2,2);
insert into doc_specialization 
(doc_id,specialization_id) values (3,5);
insert into doc_specialization 
(doc_id,specialization_id) values (4,4);
insert into doc_specialization 
(doc_id,specialization_id) values (5,3);
insert into doc_specialization 
(doc_id,specialization_id) values (2,3);
insert into doc_specialization 
(doc_id,specialization_id) values (1,5);


create table qualification(
    doc_id number(10) not null,
    degree varchar(20) not null,
    institute varchar(50),
    grad_year date,
    foreign key (doc_id) references doctor(id), 
    primary key(doc_id,degree)
);


insert into qualification 
(doc_id,degree,institute,grad_year) values 
(1,'MBBS','DMC',TO_DATE('15-jan-2010'));
insert into qualification 
(doc_id,degree,institute,grad_year) values 
(1,'FCPS','',TO_DATE('15-jan-2013'));
insert into qualification 
(doc_id,degree,institute,grad_year) values 
(1,'FRCS','Royal College of England',TO_DATE('15-jan-2010'));
insert into qualification 
(doc_id,degree,institute,grad_year) values 
(2,'MBBS','CMC',TO_DATE('14-jun-2010'));
insert into qualification 
(doc_id,degree,institute,grad_year) values 
(3,'MBBS','SMC',TO_DATE('15-jan-2010'));
insert into qualification 
(doc_id,degree,institute,grad_year) values 
(4,'MBBS','RMC',TO_DATE('15-jan-2010'));
insert into qualification 
(doc_id,degree,institute,grad_year) values 
(5,'MBBS','DMC',TO_DATE('15-jan-2010'));
insert into qualification 
(doc_id,degree,institute,grad_year) values 
(5,'FCPS','',TO_DATE('15-jan-2012'));



create table availability(
    room_no number(10) not null,
    doc_id number(10) not null,
    specialization_id number(10) not null,
    available number(1),
    sitting_date date,
    start_time timestamp,
    end_time timestamp,
    primary key (room_no,doc_id,sitting_date),
    foreign key (doc_id,specialization_id) references doc_specialization(doc_id,specialization_id) 
);



insert into availability 
(room_no,doc_id,specialization_id,available,sitting_date,start_time,end_time) 
values (201,1,1,1,TO_DATE('03-jan-2022'),
TO_TIMESTAMP('2022-01-03 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
TO_TIMESTAMP('2022-01-03 15:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into availability 
(room_no,doc_id,specialization_id,available,sitting_date,start_time,end_time) values 
(202,1,1,1,TO_DATE('03-jan-2022'),
TO_TIMESTAMP('2022-01-03 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),
TO_TIMESTAMP('2022-01-03 17:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into availability 
(room_no,doc_id,specialization_id,available,sitting_date,start_time,end_time) values 
(201,2,2,1,TO_DATE('04-jan-2022'),
TO_TIMESTAMP('2022-01-04 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
TO_TIMESTAMP('2022-01-04 11:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into availability 
(room_no,doc_id,specialization_id,available,sitting_date,start_time,end_time) values 
(201,3,5,1,TO_DATE('04-jan-2022'),
TO_TIMESTAMP('2022-01-04 11:30:00', 'YYYY-MM-DD HH24:MI:SS'),
TO_TIMESTAMP('2022-01-04 17:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into availability 
(room_no,doc_id,specialization_id,available,sitting_date,start_time,end_time) values 
(201,5,3,1,TO_DATE('05-jan-2022'),
TO_TIMESTAMP('2022-01-05 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
TO_TIMESTAMP('2022-01-05 15:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into availability 
(room_no,doc_id,specialization_id,available,sitting_date,start_time,end_time) values 
(201,4,4,1,TO_DATE('06-jan-2022'),
TO_TIMESTAMP('2022-01-06 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
TO_TIMESTAMP('2022-01-06 15:00:00', 'YYYY-MM-DD HH24:MI:SS'));



create table patient(
    id number(10) not null,
    name varchar(10),
    address varchar(100),
    contact_no varchar(12),
    symptoms varchar(300),
    primary key (id)
);


insert into patient (id,name,address,contact_no,symptoms) values 
(1,'mahin','rakeen city,Dhaka','01731214843',
'facial paralysis,hand tremor,vision issues,difficulties in speech');
insert into patient (id,name,address,contact_no,symptoms) values 
(2,'rakib','mirpur','01731214844',
'chest pain, breathlessness, sweating, pain in the shoulder');
insert into patient (id,name,address,contact_no,symptoms) values 
(3,'jubin','kafrul','01731214845',
'weight gain, abnormal hair growth, skin pigmentation');
insert into patient (id,name,address,contact_no,symptoms) values 
(4,'rain','vashantek','01731214846',
'urine incontinence, swelling of feet');
insert into patient (id,name,address,contact_no,symptoms) values 
(5,'alvee','mohammadur','01731214847',
'anenorrhea, repeated miscarriage,difficulty in conceiving');



create table department(
    id number(10) not null,
    name varchar(30),
    primary key (id)
);



insert into department(id,name)
 values (1,'nurology');
insert into department(id,name)
 values (2,'cardiology');
insert into department(id,name)
 values (3,'nephrology');
insert into department(id,name)
 values (4,'gynocology');
insert into department(id,name)
 values (5,'endrocynology');



create table patient_dept(
    patient_id number(10) not null,
    dept_id number(10) not null,
    foreign key (patient_id) references patient(id),
    foreign key (dept_id) references department(id), 
    primary key(patient_id,dept_id)
);


insert into patient_dept(patient_id,dept_id)
 values (1,1);
insert into patient_dept(patient_id,dept_id)
 values (2,2);
insert into patient_dept(patient_id,dept_id)
 values (4,3);
insert into patient_dept(patient_id,dept_id)
 values (3,5);
insert into patient_dept(patient_id,dept_id)
 values (5,4);



create table appointment(
    id number(10) not null ,
    doc_id number(10) not null,
    patient_id number(10) not null,
    dept_id number(10) not null,
    room_no number(10) not null,
    app_date date,
    start_time timestamp,
    end_time timestamp,
    fees number(10),
    primary key (id),
    foreign key (doc_id,room_no,app_date)
     references availability(doc_id,room_no,sitting_date),
    foreign key (patient_id,dept_id)
     references patient_dept(patient_id,dept_id)
);




insert into appointment values (1,1,1,1,201,
TO_DATE('03-jan-2022'),TO_TIMESTAMP('2022-01-03 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
TO_TIMESTAMP('2022-01-03 09:30:00', 'YYYY-MM-DD HH24:MI:SS'),500);
insert into appointment values (2,2,2,2,201,
TO_DATE('04-jan-2022'),TO_TIMESTAMP('2022-01-04 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
TO_TIMESTAMP('2022-01-04 10:30:00', 'YYYY-MM-DD HH24:MI:SS'),500);
insert into appointment values (3,3,3,5,201,
TO_DATE('04-jan-2022'),TO_TIMESTAMP('2022-01-04 11:30:00', 'YYYY-MM-DD HH24:MI:SS'),
TO_TIMESTAMP('2022-01-04 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),1000);






set lines 256;
set trimout on;
set tab off;

--add column(lab 02)
alter table specialization add temp_col varchar(20);
describe specialization;

--drop column(lab 02)
alter table specialization drop column temp_col;
describe specialization;

--modify colum type(lab 02)
alter table specialization modify name number(10);
describe specialization;

alter table specialization modify name varchar(20);
describe specialization;

--modify column name

alter table specialization rename column name to spec_name;
describe specialization;

alter table specialization rename column spec_name to name;
describe specialization;


--delete row
select * from appointment;
delete from appointment where id=1;
select * from appointment;

--update row
select * from doctor;
update doctor set name='muizz' where name='tanim';
select * from doctor;

--lab 3
--calculations and remaining columns
select id,name,(CURRENT_TIMESTAMP-practicing_from)
 as practice_duration from doctor;

--applying conditions
select id,name,practicing_from,
(CURRENT_TIMESTAMP-practicing_from) as practice_duration
 from doctor where practicing_from<CURRENT_TIMESTAMP;

--range search
select doc_id,institute,degree,grad_year
 from qualification where grad_year<CURRENT_DATE
  and grad_year>TO_DATE('10-jan-2010');

--membership
select * from patient where address like '%rpur%';

--order by
select * from qualification;
select * from qualification order by grad_year asc;

--lab 04
--aggregate functions
select count(*) from doctor;
select min(grad_year) as oldest_grad_doc
 from qualification;
select max(grad_year) as youngest_grad_doc from
 qualification; 

--group by
select count(*) as no_of_doc,degree from
 qualification group by degree;
select count(*) as patient_count,dept_id from
 patient_dept group by dept_id;

--having
select count(*) as no_of_doc,degree from
 qualification group by degree having degree='FRCS';

--lab 05
--in
select patient_id as patient from patient_dept
 where dept_id in(select specialization_id from
  doc_specialization);


--nested query
select name,address from patient where  id in
(select patient_id from appointment where doc_id=
(select id from doctor where name='rownak'));


--union (showing doc_id who have mbbs or mbbs and frcs)
select doc_id from qualification where degree='MBBS'
 union select doc_id
from qualification where degree='FRCS';


--intersection(Doctor id who have MBBS and FRCS )
select doc_id from qualification where degree='MBBS'
 intersect select doc_id
from qualification where degree='FRCS';


--minus(doctor_id  who have only mbbs degree)
select doc_id from qualification minus
select doc_id from qualification where degree in
 ('FRCS','FCPS');


--natural join(specialization and dept name)
select name as speciallization_and_dept from
 specialization natural join department;

--inner join(select doctor based on patient dept and doc specialization)
select * from doc_specialization 
inner join patient_dept
on dept_id=specialization_id;

--nested join to determine the specialization each doc have
select name,spec_name from doctor inner join (select doc_id,specialization_id,name as spec_name from doc_specialization inner join specialization on id=specialization_id)
on doc_id=doctor.id;

--left outer join(doc sitting date and room 
--not and time based on doc degree and available date)
select * from availability left outer join qualification 
using(doc_id) where degree='FRCS' and 
sitting_date='03-jan-22';

--right outer join(doc id,degree along with their appointment date)
select app_date,doc_id,degree from appointment
right outer join qualification using(doc_id) ;

--lab 7
--pl sql (finding out the youngest doctor based on practicing from)
set SERVEROUTPUT on;
DECLARE
    young_doctor doctor.name%type;

BEGIN
    select name into young_doctor
     from doctor where practicing_from=
    (select max(practicing_from) from  doctor);
    dbms_output.put_line('The yongest doctor is ' 
    || young_doctor || ' dcotor');
END;
/

--if else (finding if any doctor is
-- free on a specific date based on specialization)

set SERVEROUTPUT on;
DECLARE
    search_date availability.sitting_date%type;
    patient_id patient_dept.patient_id%type;
    dept_id patient_dept.dept_id%type;
    is_available availability.available%type;
    output varchar(10);
BEGIN
    search_date:='04-jan-2022';
    dept_id:=2;
    
    select available into is_available from availability 
    where sitting_date=search_date and
    specialization_id=dept_id; 
    IF is_available >= 1 THEN
        output:='available';
    ELSIF is_available <= 0 THEN
        output:='not available';
    END IF;  
    dbms_output.put_line(output);
END;
/

--lab 8
--use of cursor (show doctor and details for a specific dept)
SET SERVEROUTPUT ON
DECLARE
    CURSOR cur IS
    SELECT doc_id, sitting_date,start_time,end_time from availability WHERE specialization_id=1;
    b_details cur%ROWTYPE;
BEGIN
    OPEN cur;
    LOOP
    Fetch cur into b_details;
    EXIT WHEN cur%notfound;
    dbms_output.put_line('Doc_id: '||b_details.doc_id||', sitting date: '||b_details.sitting_date||', start time: '||b_details.start_time||', end time: '||b_details.end_time);
    END LOOP;
    CLOSE cur;
END;
/

--procedure add apointment
SET SERVEROUTPUT ON
create or replace procedure add_appointment(
    aid appointment.id%type,
    adoc_id appointment.doc_id%type,
    apatient_id appointment.patient_id%type,
    adept_id appointment.dept_id%type,
    aroom_no appointment.room_no%type,
    app_date appointment.app_date%type,
    start_time appointment.start_time%type,
    end_time appointment.end_time%type,
    fees appointment.fees%type
) is
BEGIN
    insert into appointment (id,doc_id,patient_id,
    dept_id,room_no,app_date,start_time,end_time,fees)
     values
    (aid,adoc_id,apatient_id,adept_id,
    aroom_no,app_date,start_time,end_time,fees);
END;
/

-- calling the procedure( procedure to
-- add an appointment to the appointment table)
declare
    date appointment.app_date%type;
    date2 varchar(15);
BEGIN
    date:=TO_DATE('03-jan-2022');
    add_appointment(12,1,1,1,201,date,
    TO_TIMESTAMP('2022-01-03 09:00:00', 
    'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2022-01-03 09:30:00', 
    'YYYY-MM-DD HH24:MI:SS'),
    500);
END;
/

select * from appointment;

--function (fucntion to determine if any doctor 
-- is avaiable for a specific dept and on a specific date)

SET SERVEROUTPUT ON
create or replace function is_available1 ( 
    date1 IN date,
    dept_id IN number ) return number is avail number(4):=0;
    no_row number(3);
BEGIN
    select count(*) into no_row from availability
     where sitting_date=date1 and specialization_id=dept_id;
     IF no_row >0 THEN
        avail:=1;
    ELSIF  no_row =0 THEN
        avail:=0;
END IF;
    return avail;
END;
/

--call function

BEGIN
DBMS_OUTPUT.PUT_LINE('Is available :'||
 is_available1(TO_DATE('03-jan-2022'),1));
END;
/

--trigger (to update the vacant time of a doctor 
-- after he is appointed to a appointment basically 
-- after inserting data to appointment table)

CREATE or REPLACE Trigger update_avail AFTER INSERT or UPDATE
on appointment FOR EACH ROW
BEGIN
    UPDATE availability set availability.start_time=:NEW.end_time
    where availability.doc_id= :NEW.doc_id
     and availability.specialization_id=:NEW.dept_id
     and availability.sitting_date=:NEW.app_date and
     availability.room_no=:NEW.room_no;
END update_avail;
/

--inserting into appointment and checking of the trigger 
-- updated the vacant time of the doctor

select * from appointment;

select * from availability;

declare
    date appointment.app_date%type;
    date2 varchar(15);
BEGIN
    date:=TO_DATE('03-jan-2022');
    add_appointment(1,1,1,1,201,date,
    TO_TIMESTAMP('2022-01-03 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2022-01-03 09:30:00', 'YYYY-MM-DD HH24:MI:SS'),
    500);
END;
/

select * from appointment;

select * from availability;

--Transaction management 
--savepoint,rollback,commit

insert into department(id,name) values (6,'Forensic Medicine');
insert into department(id,name) values (7,'Surgery');
COMMIT;
insert into department(id,name) values (8,'Physiology');
SAVEPOINT s1;
insert into department(id,name) values (9,'Anatomy');
insert into department(id,name) values (10,'Pathology');
savepoint s2;
select * from department;
rollback to s1;
select * from department;
insert into department(id,name) values (11,'Dermatology');
select * from department;


-- system date
select SYSDATE from DUAL;

--current system time
SELECT CURRENT_DATE from DUAL

--select system time stamp
select SYSTIMESTAMP from DUAL;

--arithmatic operation on date:

select ADD_MONTHS(SYSDATE,6) from DUAL; 

select ADD_MONTHS(SYSDATE,-6) from DUAL;