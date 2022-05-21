select * from uni.application
where courseappliedfor is null
;
select * from uni.student
where courseid is not null
;
select * from uni.student
where dateofbirth between '2002-06-01' and '2020-06-30'
;
select * from uni.application
where courseappliedfor is null
and dateofapplication between '2020-04-01' and '2020-07-31'
