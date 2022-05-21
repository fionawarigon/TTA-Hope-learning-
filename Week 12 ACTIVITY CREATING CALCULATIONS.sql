select count(*) from uni.student;

select sum(fulltimefee) from uni.fees
;
select min(fulltimefee) from uni.fees
;
select max(fulltimefee) from uni.fees
;
select avg(parttimefee) from uni.fees
; select courseid, fulltimefee-scholarshipdiscount
from uni.fees

;
select courseid from uni.fees where fulltimefee = (select min(fulltimefee) from uni.fees)
;
select courseid, fulltimefee-scholarshipdiscount
from uni.fees
order by 2 desc
;
select * from uni.application
where courseappliedfor = 11
and dateofapplication between '2020-03-01' and '2020-08-30'
;
