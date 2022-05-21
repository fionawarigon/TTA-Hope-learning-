use uni ;
select * from uni.course
where courseid in (1,3,5,7)
;
select * from uni.module
where courseid in
(select courseid 
from uni.fees 
where fulltimefee > 9000)
;
select * from uni.class where moduleid in
(select moduleid from uni.module
where courseid in
(select courseid 
from uni.fees 
where fulltimefee > 9000))
;
#--extension (this is a real stretch task)
select studentID from uni.registration where classid in
(select classid from uni.schedule where cdate = 
(select max(cdate) from uni.schedule where classid in
(select classid from uni.class
where moduleid in
(select moduleid from uni.module
	where courseid in 
	(select courseid from uni.fees
	where fulltimefee = 
		(select max(fulltimefee) from uni.fees)))))
and classid in
(select classid from uni.class
where moduleid in
(select moduleid from uni.module
	where courseid in 
	(select courseid from uni.fees
	where fulltimefee = 
		(select max(fulltimefee) from uni.fees))))
        )
