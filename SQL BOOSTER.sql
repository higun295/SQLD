select deptno as 부서번호
, avg(decode(month, 1, sal)) as M01
, avg(decode(month, 2, sal)) as M02
, avg(decode(month, 3, sal)) as M03
, avg(decode(month, 4, sal)) as M04
, avg(decode(month, 5, sal)) as M05
, avg(decode(month, 6, sal)) as M06
, avg(decode(month, 7, sal)) as M07
, avg(decode(month, 8, sal)) as M08
, avg(decode(month, 9, sal)) as M09
, avg(decode(month, 10, sal)) as M10
, avg(decode(month, 11, sal)) as M11
, avg(decode(month, 12, sal)) as M12
from (select ename, deptno, extract(month from hiredate) as month, sal from emp)
group by deptno;

select * from player

select team_id
, nvl(sum(case position when 'FW' then 1 else 0 end), 0) as FW
, nvl(sum(case position when 'MF' then 1 else 0 end), 0) as MF
, nvl(sum(case position when 'DF' then 1 else 0 end), 0) as DF
, nvl(sum(case position when 'GK' then 1 else 0 end), 0) as GK
, count(*)
, count(position)
from player
group by team_id

select team_id
, nvl(sum(case position when 'FW' then 1 end), 0) as FW
, nvl(sum(case position when 'MF' then 1 end), 0) as MF
, nvl(sum(case position when 'DF' then 1 end), 0) as DF
, nvl(sum(case position when 'GK' then 1 end), 0) as GK
, count(*)
, count(position) from player
group by team_id
order by team_id 

select mgr, count(comm), count(*) from emp
group by mgr

select round(avg(case when position = 'FW' then height end), 2) as FW평균키
, round(avg(case when position = 'MF' then height end), 2) as MF평균키
, round(avg(case when position = 'DF' then height end), 2) as DF평균키
, round(avg(case when position = 'GK' then height end), 2) as GK평균키
, round(avg(height), 2) as 전체평균키 
from player

select player_name as 선수명
, position as 포지션
, height as 키
, back_no as 등번호
from player 
where height is not null
order by 키 desc, 등번호

select player_name as 선수명, position as 포지션, back_no as 등번호
from player
where back_no is not null
order by 3 desc, 2, 1

select *
from dept

select *
from (select empno, ename from emp order by mgr)

select job, sum(sal) as 급여합계
from emp
group by job
having count(*) > 0
order by job;

select job
from emp
group by job
having sal > 1000
order by sum(sal) desc

select job, sum(sal)
from emp
group by job
order by sum(sal)

select player.player_name, team.team_name
from player, team
where team.team_id = player.team_id

select A.player_name, B.team_name
from player A
    inner join team B ON A.team_id = B.team_id

select A.player_name as 선수명, A.back_no as 등번호, B.team_name as 팀명, B.region_name as 연고지
from player A
    join team B ON A.team_id = B.team_id
    
select *
from player A, team B, stadium C
where B.team_id = A.team_id AND C.stadium_id = B.stadium_id

select B.*, A.*
from team A, stadium B
where A.team_id(+) = B.hometeam_id

select *
from dept A, emp B
where A.deptno = B.deptno(+)

select *
from emp a
join dept b on a.deptno = b.deptno

desc emp
desc dept

select *
from emp A natural join dept b

select *
from emp A 
join dept B on A.deptno = B.deptno

select B.ename, B.deptno, A.deptno, A.dname
from dept A
join emp B on A.deptno = B.deptno
where A.deptno = 30

select A.ename, A.mgr, B.deptno, B.dname
from emp A
join dept B on A.deptno = B.deptno and A.mgr = 7698

select * from team, stadium

select A.team_name, B.stadium_id, B.stadium_name
from team A
join stadium B on A.team_id = B.hometeam_id

select A.team_name, stadium_id, B.stadium_name
from team A
join stadium B using(stadium_id)

select *
from player, team, stadium

select * from schedule;
select * from stadium;
select * from team;

select B.stadium_name, B.stadium_id, A.sche_date, c.team_name, d.team_name, A.home_score, A.away_score
from schedule A
    join stadium B on A.stadium_id = B.stadium_id
    join team C on A.hometeam_id = C.team_id
    join team D on A.awayteam_id = D.team_id
where A.home_score - A.away_score >= 3
    
select *
from emp A cross join dept B
order by A.ename

select A.stadium_name, A.stadium_id, A.seat_count, A.hometeam_id
, B.team_name
from stadium A 
left join team B on A.hometeam_id = B.team_id
order by A.hometeam_id

select 
from dept A
right join emp B on A.dept_no = B.dept_no

select count(*) from emp where 1=0;
select max(empno) from emp where 1=0;
select nvl(empno, 9999) from emp where 1=0;
select nvl(max(empno), TO_CHAR('0000')) from emp where 1=0;


select concat(concat('A', CHR(10)), 'B') from dual
select 'A'||CHR(10)||CHR(10)||CHR(10)||CHR(10)||'B' as value from dual;

select to_char(to_date(sysdate) + (1/24/60)*10, 'YYYY.MM.DD HH24:MI:SS') as now from dual
select to_char(to_char(sysdate, 'YYYY.MM.DD HH24:MI:SS') + (1/24/60)*10, 'YYYY.MM.DD HH24:MI:SS') from dual
select to_char(to_date(to_char(sysdate, 'YYYY.MM.DD HH24:MI:SS'), 'YYYY.MM.DD HH24:MI:SS') + (1/24)*2, 'YYYY.MM.DD HH24:MI:SS') from dual

select team_id
, NVL(sum(case when position = 'FW' then 1 end), 0) as FW
, NVL(sum(case when position = 'MF' then 1 end), 0) as MF
, NVL(sum(case when position = 'DF' then 1 end), 0) as DF
, NVL(sum(case when position = 'GK' then 1 end), 0) as GK
, count(*) SUM
from player group by team_id

select team_id
, NVL(sum(case when position = 'FW' then 1 else 1 end), 0) as FW
, NVL(sum(case when position = 'MF' then 1 else 1 end), 0) as MF
, NVL(sum(case when position = 'DF' then 1 else 1 end), 0) as DF
, NVL(sum(case when position = 'GK' then 1 else 1 end), 0) as GK
, count(*) SUM
from player group by team_id

select * from emp

select sum(sal) as 합계
from emp
having avg(comm) > 100

select player_name as 선수명, position as 포지션, back_no as 등번호
from player 
where team_id = (select team_id from player where player_name = '정남일')
order by player_name

select player_name as 선수명, position as 포지션, back_no as 등번호, height
from player
where height <= (select avg(height) from player)
order by player_name

select * from player

select avg(height) from player 
where height <= (select avg(height) from player)
order by player_name

select *
from player
where team_id IN (select team_id from player where player_name = '정현수')

select B.dname
     , grouping(b.dname)
     , A.job
     , sum(a.sal)
from emp A, dept B where A.deptno = B.deptno group by a.job, rollup(B.dname);

select a.job
     , grouping(a.job)
     , count(a.job)
     , b.dname
     , grouping(b.dname)
     , count(b.dname)
     , sum(a.sal)
from emp a, dept b where a.deptno = b.deptno group by rollup(a.job, b.dname)


select b.dname
     , grouping(b.dname)
     , a.job
     , count(a.job)
     , grouping(a.job)
     , sum(a.sal)
from emp A, dept B where a.deptno = B.deptno group by rollup(a.job, b.dname);

select b.dname
     , a.job
     , count(*)
     , sum(a.sal)
from emp A, dept B where a.deptno = b.deptno group by b.dname, cube(a.job)
order by b.dname, A.job;

select b.dname
     , a.job
     , count(*)
     , sum(a.sal)
from emp A, dept B where a.deptno = b.deptno group by b.dname, rollup(a.job)
order by b.dname, A.job;

select b.dname
     , a.job
     , count(*)
     , sum(a.sal)
from emp A, dept B where a.deptno = b.deptno group by cube(b.dname, a.job)
order by b.dname, A.job;

select b.dname, a.job, count(*), sum(a.sal)
from emp A, dept B where a.deptno = b.deptno group by b.dname, a.job
union
select b.dname, null, count(*), sum(a.sal)
from emp A, dept B where a.deptno = b.deptno group by b.dname
union
select null, a.job, count(*), sum(a.sal)
from emp A, dept B where a.deptno = b.deptno group by a.job
union
select null, null, count(*), sum(a.sal)
from emp A, dept B where a.deptno = b.deptno

select b.dname
     , a.job
     , count(*)
     , sum(sal)
from emp A, dept B where a.deptno = b.deptno group by grouping sets(b.dname, a.job)
order by b.dname, a.job

select b.dname, a.job, a.mgr
, count(*), sum(a.sal)
from emp A, dept B where a.deptno = b.deptno group by grouping sets((b.dname, a.job, a.mgr), (b.dname, a.job), (a.job, a.mgr))
order by b.dname, a.job, a.mgr

select job, ename, sal
, rank() over (order by sal desc) as all_rk
, rank() over (partition by job order by sal desc) as job_rk
from emp;

select job, ename, sal
     , rank() over (partition by job order by sal desc) job_rk
from emp;

select job, ename, sal
, rank() over (order by sal desc) as rk
, dense_rank() over (order by sal desc) as drk
from emp;

select job, ename, sal
, rank() over (order by sal desc) as rk
, row_number() over (order by sal desc, ename desc) as rn
from emp;

select mgr, ename, sal
, sum (sal) over (partition by mgr) as sal_sum
from emp;

select mgr, ename, sal
, sum (sal) over (partition by mgr order by sal range unbounded preceding) as sal_sum
from emp;

select mgr, ename, sal
, max (sal) over (partition by mgr) as max_sum
from emp;

select mgr, ename, sal
from (select mgr, ename, sal, max (sal) over (partition by mgr order by sal) as max_sal from emp)
where sal = max_sal;

select mgr, ename, sal
from (select mgr, ename, sal, rank() over (partition by mgr order by sal desc) as sal_rk from emp)
where sal_rk = 1;

select mgr, ename, sal
     , round(avg (sal) over (partition by mgr order by hiredate rows between 1 preceding and 1 following), 2) as avg_sal
from emp;

select ename, sal
     , count(*) over (order by sal range between 50 preceding and 150 following) as emp_cnt
from emp; 

select deptno, ename, sal
, first_value (ename) over (partition by deptno order by sal desc rows between 1 preceding and 1 following) as ename_fv
from emp;

select deptno, ename, sal
, first_value (ename) over (partition by deptno order by sal desc rows between unbounded preceding and current row) as ename_fv
from emp;

select deptno, ename, sal
, last_value (ename) over (partition by deptno order by sal desc rows between current row and unbounded following) as ename_lv
from emp;

select ename, hiredate, sal
, lag (sal, 2, 0) over (order by hiredate) as lag_sal
from emp where job = 'SALESMAN';

select ename, hiredate
, lead (hiredate, 1, sysdate) over (order by hiredate) as lead_hiredate
from emp where job = 'SALESMAN';

select ename, sal, deptno
     , round(ratio_to_report (sal) over (partition by deptno), 2)  as sal_pr
from emp where job = 'SALESMAN';

select deptno, ename, sal
     , percent_rank () over (partition by deptno order by sal desc) as pr
from emp;

select deptno, ename, sal
     , round(cume_dist () over (partition by deptno order by sal desc), 2) as cd
from emp;

select ename, sal
     , ntile (4) over (order by sal desc) as NT
from emp;

select *
from (select ename, sal from emp order by sal desc)
where rownum <= 3;


select empno, sal
from emp order by sal, empno;

select empno, sal
from emp order by sal, empno 
offset 3 rows fetch next 5 rows with ties;

select empno, sal
from emp order by sal, empno offset 5 rows;

select * from emp order by sal, empno;

select * 
from emp order by sal, empno 
offset 3 row fetch next 3 row only;

select worker.empno as 사원번호
     , worker.ename as 사원명
     , manager.ename as 관리자명
from emp worker, emp manager
where manager.empno = worker.mgr;

select b.empno, b.ename, b.mgr
from emp A, emp B
where A.ename = 'JONES'
and A.empno = B.mgr;

select C.empno, C.ename, C.mgr
from emp A, emp B, emp C
where A.ename = 'JONES'
and A.empno = B.mgr
and B.empno = C.mgr;

select C.empno, C.ename, c.mgr
from emp A, emp B, emp C
where a.ename = 'SMITH'
and a.mgr = b.empno
and b.mgr = c.empno

select * from emp where ename = 'SMITH'
select * from emp where empno = 7902
select * from emp where empno = 7566

select level as LV
     , lpad (' ', (level - 1) * 2) || empno as empno
     , mgr
     , connect_by_isleaf as isleaf
from emp
start with mgr is null
connect by mgr = prior empno

select level as LV
     , lpad (' ', (level - 1) * 2) || empno as empno
     , mgr
     , connect_by_isleaf as isleaf
from emp
start with mgr is null
connect by mgr = prior empno

select level as LV
     , lpad (' ', (level - 1) * 2) || empno as EMPNO
     , MGR
     , connect_by_isleaf as isleaf
from emp
start with empno = 7876
connect by empno = prior mgr

select * from emp

select connect_by_root (empno) as root_empno
     , sys_connect_by_path (empno, ',') as path
     , empno
     , mgr
from emp
start with mgr is null
connect by mgr = prior empno;

select * from emp;
select sum(comm), count(comm) from emp;

select *
    from (select job, deptno, sal from emp)
    pivot (sum (sal) for deptno in (10, 20, 30))
order by 1;

select *
    from (select job, deptno, comm from emp)
    pivot (sum (comm) for deptno in (10, 20, 30))
order by job desc;

select * from emp;

select *
from (select job, deptno, sal from emp)
pivot (sum(sal) for deptno in (10, 20, 30))
order by 1;

select *
from (select job, deptno, sal from emp)
pivot (sum(sal) for deptno in (10, 20, 30))
order by 1;

select * from emp;

select *
from (select to_char(hiredate,'YYYY') as YYYY, job, deptno, sal from emp)
pivot (sum(sal) for deptno in (10, 20, 30))
order by 1;

select *
from (select job, deptno, sal from emp)
pivot (sum(sal) as sal for deptno in (10 as D10, 20 as D20, 30 as D30))
order by 1;

select *
from (select job, deptno, sal from emp)
pivot (sum(sal) as sal for deptno in (10 as D10, 20 as D20, 30 as D30))
order by 1;

select * from emp;

select *
from (select job, deptno, sal from emp)
pivot (sum (sal) as sal, count (*) as cnt for deptno in (10 as D10, 20 as D20, 30 as D30))
order by 1;

select *
from (select to_char (hiredate, 'YYYY') as YYYY, job, deptno, sal from emp)
pivot (sum (sal) as sal, count (*) as cnt for (deptno, job) in ((10, 'ANALYST') as D10A
                                                              , (10, 'CLERK') as D10C
                                                              , (20, 'ANALYST') as D20A
                                                              , (20, 'CLERK') as D20C))
order by 1;

select job
     , sum(case deptno when 10 then sal end) as d10_sal
     , sum(case deptno when 20 then sal end) as d20_sal
     , sum(case deptno when 30 then sal end) as d30_sal
from emp group by job order by job;

select *
from (select job, sal, deptno from emp)
pivot (sum(sal) as sal for deptno in (10 as d10, 20 as d20, 30 as d30))
order by 1;

drop table T1 purge;
create table T1 as
select job, D10_SAL, D20_SAL, D10_CNT, D20_CNT
from (select job, deptno, sal from emp where job in ('ANALYST', 'CLERK'))
pivot (sum (sal) as sal, count (*) as cnt for deptno in (10 as D10, 20 as D20));

select * from t1

select deptno, sal
from t1
unpivot (sal for deptno in (D10_SAL, D20_SAL))
order by 1,2;

select job, deptno, sal
from t1
unpivot include nulls (sal for deptno in (D10_SAL as 10, D20_SAL as 20))
order by 1, 2;

select * from t1;

select *
from t1
unpivot ((sal, cnt) for (deptno, dname)in ((D10_SAL, D10_CNT) AS (10, 'ACCOUNTING')
                                         , (D20_SAL, D20_CNT) AS (20, 'RESEARCH')))
order by 1, 2;

insert into player (player_id, player_name, team_id, position, height, weight, back_no)
            values ('2002007', '박지성', 'K07', 'MF', 178, 73, 7);
insert into player values('2002010', '이청용', 'K07', '', 'BlueDragon', '2002', 'MF', '17', NULL, NULL, '1', 180, 69);

select * from player where player_name in ('박지성', '이청용');

insert into player (player_id, player_name, team_id)
            values ((select to_char(max(to_number(player_id)) + 1) from player), '홍길동', 'K06')

select to_char(max(to_number(player_id)) + 1) from player

select * from player order by player_id desc;
select * from team;

insert into team (team_id, region_name, team_name, orig_yyyy, stadium_id)
select replace(team_id, 'K', 'A') as team_id
     , region_name
     , region_name || '올스타' as team_name
     , 2019 as orig_yyyy
     , stadium_id
from team where region_name in ('성남', '인천');

insert into team (team_id, region_name, team_name, orig_yyyy, stadium_id)
values ('T08', '성남', '성남테스트', 2023, 'B02')

insert into team (team_id, region_name, team_name, orig_yyyy, stadium_id)
select replace(team_id, 'A', 'T') as team_id
     , region_name
     , region_name || '테스트' as team_name
     , 2023 as orig_yyyy
     , stadium_id
from team where team_name in ('인천올스타', '성남올스타')

desc team
select * from team;
select * from player;

insert into player (player_id, player_name, team_id, position)
select 'A' || substr(player_id, 2) as player_id
     , player_name
     , replace(team_id, 'K', 'A') as team_id
     , position
from player where team_id in ('K04', 'K08')

select length('abcd'||chr(10)||'ef') as c0, regexp_substr ('abcd' || chr(10) || 'ef', '.$', 8, 1) as c1
from dual;

select regexp_substr('aaab', 'a{4,5}')
from dual;

select regexp_substr('ac', 'ab*c') from dual;
select regexp_substr('cdefxefcd', '(ab|cd)(ef|gh)x\2') from dual;
select regexp_substr('onexxone', '(.*)x\1+') from dual;

select * from player;
select * from team;
select * from stadium;

select A.stadium_name, A.hometeam_id, B.team_id, B.region_name, B.team_name 
from stadium A
    full outer join team B on A.hometeam_id = B.team_id
order by A.hometeam_id, B.team_id


select A.stadium_name, A.hometeam_id, B.team_id, B.region_name, B.team_name 
from stadium A
    left outer join team B on A.hometeam_id = B.team_id
union
select A.stadium_name, A.hometeam_id, B.team_id, B.region_name, B.team_name 
from stadium A
    right outer join team B on A.hometeam_id = B.team_id
order by hometeam_id, team_id    



select A.stadium_name, A.hometeam_id, B.team_id, B.region_name, B.team_name 
from stadium A
    join team B on A.hometeam_id = B.team_id
union all
select A.stadium_name, A.hometeam_id, null, null, null
from stadium A
where not exists (select 1 from team B where A.hometeam_id = B.team_id)
union all
select null, null, A.team_id, A.region_name, A.team_name
from team A
where not exists (select 1 from stadium B where A.team_id = B.hometeam_id)

select regexp_count('123123123123123', '123', 5) from dual;


desc player;
select * from player;
select * from team;
select * from stadium;

select a.hometeam_id, b.team_id
from stadium A
    left outer join team B ON A.hometeam_id = B.team_id
where a.hometeam_id is not null    

select * from player;
update player
set player_id = '1'
where player_id = '2011075'


select length(player_id), length(player_name)
from player 
where player_id = '1'

update player 
set player_id = '2011075'
where player_id = '1'

select * from player;
select extract(month from birth_date) from player where player_id = '2012123';

select * from emp;

select job
     , mgr
     , sum(sal)
     , grouping_id(job, mgr)
from emp
group by rollup(job, mgr);

select A.*
from (select empno, ename, sal, rownum as rn from emp order by sal desc) A
where rn between 6 and 10;

select A.*, rownum as rn
from (select empno, ename, sal from emp order by sal desc) A 
where rownum between 6 and 10;

select *
from (select A.*, rownum as RN
        from (select empno, ename, sal from emp order by sal desc) A)
where rn between 6 and 10;        

select A.*
from (select A.*, rownum as RN
        from (select empno, ename, sal
                from emp
               order by sal desc) A
       where rownum <= 10) A
where A.RN >= 6

select empno, ename, mgr, connect_by_isleaf
from emp
start with ename = 'JONES'
connect by mgr = prior empno;

select *
from (select A.empno, A.ename, A.job, A.mgr, A.sal, B.deptno, B.dname
        from emp A 
      join dept B on A.deptno = B.deptno)
pivot (sum (sal) as sal , count(*) as CNT for (deptno, dname) in ((10, 'ACCOUNTING'), (20, 'RESEARCH'), (30, 'SALES')));


select *
from (
        select *
        from (select A.job as JOB
                   , B.deptno as DEPTNO
                   , B.dname as DNAME
                   , sum(A.sal) as SAL
                   , count(B.dname) CNT
                from emp A 
                join dept B on A.deptno = B.deptno
              group by A.job, B.deptno, B.dname)
        pivot (sum(SAL) as SAL, sum(CNT) as CNT for (deptno, dname) in ((10, 'ACCOUNTING') as D10
                                                                      , (20, 'RESEARCH') as D20
                                                                      , (30, 'SALES') as D30))
     ) T1
unpivot ((sal, cnt) for (deptno, dname) in ((D10_SAL, D10_CNT) as (10,'ACCOUNTING')
                                          , (D20_SAL, D20_CNT) as (20, 'RESEARCH')
                                          , (D30_SAL, D30_CNT) as (30, 'SALES')))
where job = 'CLERK'

select *
        from (select A.job as JOB
                   , B.deptno as DEPTNO
                   , B.dname as DNAME
                   , sum(A.sal) as SAL
                   , count(B.deptno) CNT
                from emp A 
                join dept B on A.deptno = B.deptno
              group by A.job, B.deptno, B.dname)
pivot (sum(sal) as SAL, count(*) as CNT for deptno in (10 as D10, 20 as D20, 30 as D30))

    select Regexp_substr('ABC@EFG.COM', '[^@]+', 3, 1) as C1 From dual;

select regexp_instr('010-1234-5678', '(\d+)-(\d+)-(\d+)', 1,1,0,'i',2) from dual

select regexp_instr('1234567890', '(123)(4(56)(78))', 1, 1, 0, 'i', 1) as first
     , regexp_instr('1234567890', '(123)(4(56)(78))', 1, 1, 0, 'i', 2) as second
     , regexp_instr('1234567890', '(123)(4(56)(78))', 1, 1, 0, 'i', 3) as third
     , regexp_instr('1234567890', '(123)(4(56)(78))', 1, 1, 0, 'i', 4) as fourth
     , regexp_instr('1234567890', '(123)(4(56)(78))', 1, 1, 0, 'i', 5) as fifth
from dual

desc player;
alter table player modify (nation NULL);

select to_date('20230831') - to_date('20230905') from dual

desc player;

alter table player add (test number(4,6))

insert into player (player_id, player_name, team_id, test)
values ('1111111', '테스트', 'K05', -0.009999)

update player set test = 0.01 where player_id = '1111111';
select * from player where player_id = '1111111';

alter table player modify (test number(6,6));

update player set test = 0.999999 where player_id = '1111111';
update player set test = 1.000000 where player_id = '1111111';

select * from emp;
select * from dept;

select *
from dept A, emp B
where A.deptno = B.deptno(+)
and B.sal(+) >= 2500

select *
from dept A, emp B
where A.deptno = B.deptno(+)
and B.JOB(+) = 'SALESMAN'

select empno, ename, job, sal
, last_value (sal) over (partition by job order by sal range between current row and unbounded following) as c1
from emp
where deptno = 20

select empno, ename, job, sal
, last_value (sal) over (partition by job order by sal range unbounded following) as c1
from emp
where deptno = 20

select * 
from dept A
where exists (select 1 from emp X where x.deptno = A.deptno and rownum = 1)

select A.empno, A.ename
, nvl ((select 'Y' from emp x where x.deptno = a.deptno and rownum = 1), 'N') as YN
from emp A;

select *
from dept
where deptno in (select deptno
                    from (select deptno, avg(sal) as sal
                            from emp
                            group by deptno
                            order by sal desc)
                    where rownum <= 1);        
                         
select * from emp;
select empno, rownum from emp;

select empno, ename, mgr, sys_connect_by_path(ename, '>')
from emp
start with ename = 'SCOTT'
connect by empno = prior mgr;

select substr (max (sys_connect_by_path (ename, '>')), 2) as path
from emp
start with ename = 'SCOTT'
connect by empno = prior mgr;

select rowid
     , rownum
     , ename
     , mgr
     , empno
     , row_number() over (order by ename) as RN
from emp;

select * from emp;

select empno, ename, mgr, deptno
     , row_number() over (partition by deptno, mgr order by empno) as RN
from emp;



























































































































