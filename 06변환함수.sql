--형변환 함수
--자동형변환
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = '30';
SELECT SYSDATE - 5, SYSDATE - '5' FROM DUAL;

--강제형변환
--TO_CHAR(날짜, 날짜포맷)
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS') FROM DUAL; --2023-05-16 11:16:51
SELECT TO_CHAR(SYSDATE, 'YY/MM/DD HH24/MI/SS') FROM DUAL; --23/05/16 11/17/26
SELECT TO_CHAR(SYSDATE, 'YYYY"년"MM"월"DD"일"') FROM DUAL; --2023년05월16일

--TO_CHAR(숫자, 숫자포맷)
SELECT TO_CHAR(200000, '$999,999,999') FROM DUAL;
SELECT TO_CHAR(200000, '999999.999') FROM DUAL;
SELECT TO_CHAR( SALARY * 1300, 'L999,999,999') FROM EMPLOYEES ORDER BY SALARY DESC; --지역화폐단위
SELECT FIRST_NAME, TO_CHAR( SALARY * 1300, 'L0999,999,999') FROM EMPLOYEES; -- 자리수를 0으로 채움

--TO_NUMBER(문자, 숫자포맷)
SELECT '3.14' + 2000 AS 자동형변환 FROM DUAL; --자동형변환
SELECT TO_NUMBER('3.14') + 2000 AS 명시적형변환 FROM DUAL; --명시적형변환
SELECT TO_NUMBER('$3,300', '$999,999') + 2000 AS 명시적형변환 FROM DUAL;

--TO_DATE(문자, 날짜포맷)
SELECT SYSDATE - '2023-05-16' FROM DUAL;
SELECT SYSDATE - TO_DATE('2023-05-16', 'YYYY-MM-DD') FROM DUAL;
SELECT SYSDATE - TO_DATE('2023/05/16 11:31:23', 'YYYY/MM/DD HH:MI:SS') FROM DUAL;

--YYYY년MM월DD일
SELECT TO_CHAR(TO_DATE('20050105', 'YYYYMMDD'), 'YYYY"년"MM"월"DD"일"') FROM DUAL;

--현재날짜와 일수 차이
SELECT SYSDATE - TO_DATE('2005년01월05일', 'YYYY"년"MM"월"DD"일') FROM DUAL;

-----------------------------------------------------------------------------------
--NVL(컬럼, NULL인 경우)
SELECT NVL(NULL, 0) FROM DUAL;
SELECT FIRST_NAME, COMMISSION_PCT * 100 FROM EMPLOYEES;
SELECT FIRST_NAME, NVL(COMMISSION_PCT, 0) * 100 FROM EMPLOYEES;

--NVL2(컬럼, NULL이 아닌경우, NULL인 경우)
SELECT NVL2(NULL, 'NULL이 아닙니다', 'NULL입니다.') FROM DUAL;
SELECT FIRST_NAME,
       SALARY, 
       NVL2(COMMISSION_PCT, SALARY + (SALARY * COMMISSION_PCT), SALARY) AS 급여 FROM EMPLOYEES; --총 월급 얼마인가

--DECODE() : ELSE IF문을 대체하는 함수
SELECT DECODE('F', 'A', 'A입니다.', 
                   'B', 'B입니다.', 
                   'C', 'C입니다.', 
                   'ABC가 아닙니다.') FROM DUAL;

SELECT JOB_ID, DECODE(JOB_ID, 'IT_PROG', SALARY * 0.3,
                      'FI_MGR', SALARY * 0.3,
                      SALARY) 
FROM EMPLOYEES;
--CASE WHEN THEN ELSE
--1ST
SELECT JOB_ID,
       CASE JOB_ID WHEN 'IT_PROG' THEN SALARY * 0.3
                   WHEN 'FI_MGR' THEN SALARY * 0.2
                   ELSE SALARY
       END
       
FROM EMPLOYEES;
--2ND (대소비교 OR 다른컬럼과 비교가능)
SELECT JOB_ID,
       CASE WHEN JOB_ID = 'IT_PROG' THEN SALARY * 0.3
            WHEN JOB_ID = 'FI_MGR' THEN SALARY * 0.2
            ELSE SALARY
       END
FROM EMPLOYEES;

--COALESCE(A,B) : NVL과 유사
SELECT COALESCE( COMMISSION_PCT, 0) FROM EMPLOYEES;

--연습문제-----------------------------------------------------------------------
SELECT * FROM EMPLOYEES;

--문제1
SELECT EMPLOYEE_ID AS 사원번호, 
       FIRST_NAME || ' ' || LAST_NAME AS 사원명,
       HIRE_DATE AS 입사일자,
       TRUNC((SYSDATE-HIRE_DATE)/365) AS 근속년수
FROM EMPLOYEES WHERE (SYSDATE-HIRE_DATE) / 365 > 10 ORDER BY 근속년수 DESC;
--WHERE절로 먼저 해당 조건에 맞는 DB를 선별 한 후 SELECT 실행한다.

--문제2
SELECT FIRST_NAME, 
       MANAGER_ID,
       DECODE(MANAGER_ID, '100', '사원',
                          '120', '주임',
                          '121', '대리',
                          '122', '과장',
                          '임원') AS 직급
FROM EMPLOYEES WHERE DEPARTMENT_ID = 50;

