--숫자함수
--ROUND(): 반올림
SELECT ROUND(45.523, 2), ROUND(45.523), ROUND(45.523, -1) FROM DUAL; -- 45.52 / 46 / 50
--TRUNC(): 절삭
SELECT TRUNC(45.523, 2), TRUNC(45.523), TRUNC(45.523, -1) FROM DUAL; --45.52 / 45 / 40
--CEIL():올림, FLOOR():내림
SELECT CEIL(3.14), FLOOR(3.14) FROM DUAL; -- 4 / 3
--MOD() : 나머지
SELECT 5 / 3 AS 몫, MOD(5, 3) AS 나머지 FROM DUAL;
--------------------------------------------------------------------
SELECT SYSDATE FROM DUAL; --년/월/일
SELECT SYSTIMESTAMP FROM DUAL; -- 시,분,초,밀리세컨을 포함한 상세한 시간타입

--날짜의 연산 = 기준이 일수
SELECT SYSDATE + 10 FROM DUAL; -- +10일
SELECT SYSDATE - 10 FROM DUAL; -- -10일
SELECT (SYSDATE - HIRE_DATE) / 7 AS WEEK FROM EMPLOYEES;
SELECT (SYSDATE - HIRE_DATE) / 365 AS YEAR FROM EMPLOYEES;
SELECT TRUNC( (SYSDATE - HIRE_DATE) / 365 ) * 12 AS MONTH FROM EMPLOYEES;

--날짜의 반올림(SYSDATE:23/05/16 AM 10:30)
SELECT ROUND(SYSDATE) FROM DUAL;
SELECT ROUND(SYSDATE, 'DAY') FROM DUAL; -- 해당주의 일요일로
SELECT ROUND(SYSDATE, 'MONTH') FROM DUAL; -- 23/06/01
SELECT ROUND(SYSDATE, 'YEAR') FROM DUAL; -- 23/01/01
--날짜의 절삭(SYSDATE:23/05/16 AM 10:30)
SELECT TRUNC(SYSDATE) FROM DUAL;
SELECT TRUNC(SYSDATE, 'DAY') FROM DUAL; -- 해당주의 일요일
SELECT TRUNC(SYSDATE, 'MONTH') FROM DUAL; -- 23/05/01
SELECT TRUNC(SYSDATE, 'YEAR') FROM DUAL; -- 23/01/01









