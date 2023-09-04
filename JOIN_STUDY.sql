DROP TABLE T1 PURGE;
DROP TABLE T2 PURGE;
DROP TABLE T3 PURGE;
DROP TABLE T4 PURGE;

CREATE TABLE T1 (C1 NUMBER);
CREATE TABLE T2 (C1 NUMBER);
CREATE TABLE T3 (C1 NUMBER);
CREATE TABLE T4 (C1 NUMBER);

INSERT INTO T1 VALUES (1);
INSERT INTO T1 VALUES (2);
INSERT INTO T1 VALUES (3);

INSERT INTO T2 VALUES (1);
INSERT INTO T2 VALUES (2);
INSERT INTO T2 VALUES (4);

INSERT INTO T3 VALUES (1);
INSERT INTO T3 VALUES (3);
INSERT INTO T3 VALUES (5);

INSERT INTO T4 VALUES (1);
INSERT INTO T4 VALUES (4);
INSERT INTO T4 VALUES (5);

COMMIT;

select * from t1;
select * from t2;

----------------------------------------
-- T1을 기준으로 OUTER JOIN--
----------------------------------------
-- ORACLE SYNTAX
SELECT a.c1 AS a, b.c1 AS b
FROM t1 a, t2 b
WHERE b.c1(+) = a.c1
ORDER BY a.c1;
-- ANSI SYNTAX
SELECT a.c1 AS a, b.c1 AS b
FROM t1 a
    LEFT OUTER JOIN t2 b ON b.c1 = a.c1
ORDER BY a.c1;

----------------------------------------
-- T2를 기준으로 OUTER JOIN--
----------------------------------------
-- ORACLE SYNTAX
SELECT a.c1 AS a, b.c1 AS b
FROM t1 a, t2 b
WHERE b.c1 = a.c1(+)
ORDER BY a.c1;
-- ANSI SYNTAX
SELECT a.c1 AS a, b.c1 AS b
FROM t1 a
    RIGHT OUTER JOIN t2 b ON b.c1 = a.c1
ORDER BY a.c1;

----------------------------------------
-- T1에 일반조건 추가
----------------------------------------
-- ORACLE SYNTAX
SELECT a.c1 AS a, b.c1 AS b
FROM t1 a, t2 b
WHERE a.c1 > 1 AND b.c1(+) = a.c1
ORDER BY a.c1;
-- ANSI SYNTAX
SELECT a.c1 AS a, b.c1 AS b
FROM t1 a
    LEFT OUTER JOIN t2 b ON b.c1 = a.c1
WHERE a.c1 > 1 
ORDER BY a.c1;
-- 바로 위의 SQL에서 일반조건을 ON절로 바꾸면
SELECT a.c1 AS a, b.c1 AS b
FROM t1 a
    LEFT OUTER JOIN t2 b ON a.c1 > 1 AND b.c1 = a.c1
ORDER BY a.c1;



SELECT a.c1 AS a, b.c1 AS b
FROM t1 a, t2 b
WHERE b.c1(+) = a.c1 AND b.c1 > 1
ORDER BY a.c1;

select a.c1 as a, b.c1 as b
from t1 a
    join t2 b on a.c1 = b.c1
where b.c1 > 1
order by a.c1;

select *
from t1 a left outer join t2 b on a.c1 = b.c1
where b.c1 > 1 order by a.c1;

SELECT a.c1 AS a, b.c1 AS b
FROM t1 a, t2 b
WHERE b.c1(+) = a.c1 AND b.c1(+) > 1
ORDER BY a.c1;

SELECT a.c1 AS a, b.c1 AS b
FROM t1 a, t2 b
WHERE b.c1(+) = a.c1 AND b.c1(+) IN (1, 4)
ORDER BY a.c1;




































































