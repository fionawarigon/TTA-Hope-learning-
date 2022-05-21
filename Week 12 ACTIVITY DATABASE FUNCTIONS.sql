select * from uni.application 
where courseappliedfor = 11
and studentid = 0
and accepted = 1
;
insert into 
uni.student(forenames, surname, emailaddress, courseid)
select forenames, surname, emailaddress, courseappliedfor
from uni.application
where courseappliedfor = 11
and studentid = 0
and accepted = 1
;

select * from uni.application
where courseappliedfor = 1 and accepted = 0
;
delete from uni.application
where courseappliedfor = 11 and accepted = 0
;
select * from uni.application
where courseappliedfor = 11
and accepted = 0
and dateofapplication > '2020-08-01'
;
update uni.application
set accepted = 1
where courseappliedfor = 11
and accepted = 0
and dateofapplication > '2020-08-01'
;
rollback
;
update uni.application
set accepted = 1
where courseappliedfor = 11
and accepted = 0
and dateofapplication > '2020-09-01'
;
commit
;
