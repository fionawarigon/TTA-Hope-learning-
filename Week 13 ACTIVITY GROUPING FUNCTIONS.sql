select courseid, count(*)
from uni.module
group by courseid
;
select courseappliedfor, count(*)
from uni.application
group by courseappliedfor
;
select supervisingstaff, avg(membershipfee) from uni.club
group by supervisingstaff
;
select supervisingstaff, sum(joiningfee) from uni.club
where active = 1
group by supervisingstaff
;