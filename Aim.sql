SELECT * FROM ORG.Worker;
use ORG;
select DISTINCT DEPARTMENT FROM Worker;
SELECT DEPARTMENT FROM Worker GROUP BY DEPARTMENT; -- ERROR IF SELECT *,, 

select substring(LAST_NAME , 1, 3) FROM Worker;

select instr(FIRST_NAME, 'a') from Worker where FIRST_NAME='Amitabh';
select locate('B',FIRST_NAME) as Position from Worker where FIRST_NAME='Amitabh';
-- for case sensitive search-- 
select instr(BINARY FIRST_NAME, 'a') from Worker where FIRST_NAME='Amitabh';
 
 select DISTINCT DEPARTMENT, LENGTH(DEPARTMENT) FROM Worker;

select REPLACE(first_name, 'a', 'A')  from Worker;

select CONCAT(first_name, ' ', last_name) AS COMPLETE_NAME from Worker;

select * from Worker ORDER by first_name;
select * from Worker ORDER by first_name ASC, DEPARTMENT DESC;

select * from Worker where FIRST_NAME NOT IN('Vipul', 'Satish');

select * from Worker where DEPARTMENT LIKE 'admin%';

select * from Worker where NOT instr(FIRST_NAME, 'a')=0;
-- is not equal to by != or <> --
select * from Worker where first_name LIKE '%a%';
-- not contains a --
select * from Worker where instr(FIRST_NAME, 'a')=0;

select * from Worker where FIRST_NAME LIKE '%h' AND length(FIRST_NAME)=6;
select * from Worker where first_name LIKE '_____h';

select * from Worker where salary between 100000 AND 500000;

select * from Worker where JOINING_DATE LIKE '2014-02%';
select * from Worker where YEAR(joining_date) = 2014 AND MONTH(joining_date) = 02;

select department, count(department) from Worker where department='admin' ;

select department , count(department) from Worker group by department;

select concat(first_name, ' ',last_name) from Worker where salary between 100000 AND 500000;

select department , count(department) from Worker group by department order by count(department) desc;
select department, count(worker_id) AS no_of_worker from Worker group by department
ORDER BY no_of_worker desc;

select * from Worker as w inner join Title as t on w.worker_id = t.worker_ref_id where t.worker_title = 'Manager';

select worker_title, count(*) as count from Title group by worker_title having count>1 order by count;

select * from Worker where MOD (WORKER_ID, 3) <> 0;


create table worker_clone as select * from Worker where department in ('Admin' , 'Account') order by department;
-- or --
CREATE TABLE worker_clone2 LIKE Worker; -- only schema copy --
INSERT INTO worker_clone2 select * from Worker;




select curdate();
select now();

select * from Worker order by salary desc limit 5;
-- nth highest salary --
select * from Worker order by salary desc limit 4,1;



select department, sum(salary) as depSal from Worker group by department order by depSal;

select concat(first_name,' ',last_name), salary from Worker where salary = (select max(salary) from Worker);
