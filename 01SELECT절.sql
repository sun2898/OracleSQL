-- 오라클 주석문 : 하이픈 두개
/*
여러줄 주석
오라크클은 대소문자 구분하지 않는다
*/
SELECT * FROM EMPLOYEES;
SELECT FIRST_NAME, EMAIL, hire_date FROM employees;

SELECT * FROM departments;

--연산
--컬럼을 조회하는 위치에서 * / + -
SELECT FIRST_NAME, SALARY, SALARY + SALARY * 0.1 FROM EMPLOYEES;

--NULL값 확인
SELECT FIRST_NAME, COMMISSION_PCT FROM EMPLOYEES;

-- 엘리어스 as
SELECT FIRST_NAME AS 이름, 
       LAST_NAME AS 성, 
       SALARY 급여, 
       SALARY + SALARY * 0.1 총급여 
FROM EMPLOYEES;

-- 문자열의 연결 ||
-- 오라클은 문자를 ''로 표현한다.
SELECT FIRST_NAME || ' ' || LAST_NAME || '''s salary $' || SALARY AS 급여내역 FROM EMPLOYEES;

--DISTINCT 중복행 제거
SELECT DISTINCT FIRST_NAME, DEPARTMENT_ID FROM employees;
SELECT DISTINCT DEPARTMENT_ID FROM employees;

--ROWID(데이터의 주소), ROWNUM(조회된 순서)
SELECT ROWNUM, ROWID, EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES;












