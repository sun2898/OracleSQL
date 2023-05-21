--문제  1.----------------------------------------------------------------------
--EMPLOYEES 테이블에서  모든  사원들의  평균급여보다  높은  사원들을  데이터를  출력  하세요  ( AVG(컬럼) 사용) 
SELECT *
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);
--EMPLOYEES 테이블에서  모든  사원들의  평균급여보다  높은  사원들의  수를  출력하세요
SELECT COUNT(*) AS 고연봉자
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);
--EMPLOYEES 테이블에서  job_id가  IT_PFOG인  사원들의  평균급여보다  높은  사원들을  데이터를  출력하세요
SELECT *
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG');

--문제  2.----------------------------------------------------------------------
--DEPARTMENTS테이블에서  manager_id가  100인  사람의  department_id와 
--EMPLOYEES테이블에서  department_id가  일치하는  모든  사원의  정보를  검색하세요.
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE MANAGER_ID = 100;

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE MANAGER_ID = 100);

--문제  3.----------------------------------------------------------------------
--EMPLOYEES테이블에서  “Pat”의  manager_id보다  높은  manager_id를  갖는  모든  사원의  데이터를  출력하세요 
SELECT *
FROM EMPLOYEES
WHERE MANAGER_ID > (SELECT MANAGER_ID FROM EMPLOYEES WHERE FIRST_NAME = 'Pat');

--EMPLOYEES테이블에서  “James”(2명)들의  manager_id와  같은  모든  사원의  데이터를  출력하세요.

SELECT *
FROM EMPLOYEES
WHERE MANAGER_ID = ANY (SELECT MANAGER_ID FROM EMPLOYEES WHERE FIRST_NAME = 'James');

/*문제  4.
-EMPLOYEES테이블 에서 first_name기준으로 내림차순 정렬하고, 41~50번째 데이터의 행 번호, 이름을 출력하세요 */
SELECT *
FROM (SELECT ROWNUM AS RN,
       FIRST_NAME
      FROM (SELECT *
            FROM EMPLOYEES
            ORDER BY FIRST_NAME DESC)
      )      
WHERE RN BETWEEN 41 AND 50; 

/*문제  5.
-EMPLOYEES테이블에서  hire_date기준으로  오름차순  정렬하고, 31~40번째  데이터의  행  번호, 사원id, 이름, 번호, 
입사일을  출력하세요. */
SELECT *
FROM (SELECT ROWNUM AS RN,
             EMPLOYEE_ID,
             FIRST_NAME,
             PHONE_NUMBER,
             HIRE_DATE
      FROM (SELECT *
            FROM EMPLOYEES
            ORDER BY HIRE_DATE ASC)
      )
WHERE RN >= 31 AND RN <= 40;

--문제  6-----------------------------------------------------------------------
--employees테이블  departments테이블을  left 조인하세요
--조건) 직원아이디, 이름(성, 이름), 부서아이디, 부서명  만  출력합니다. 
--조건) 직원아이디  기준  오름차순  정렬
SELECT EMPLOYEE_ID AS 직원아이디,
       FIRST_NAME || ', ' || LAST_NAME AS 이름,
       D.DEPARTMENT_ID AS 부서아이디,
       D.DEPARTMENT_NAME AS 부서명
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY EMPLOYEE_ID ASC;

--문제  7-----------------------------------------------------------------------
--문제  6의  결과를  (스칼라  쿼리)로  동일하게  조회하세요
SELECT EMPLOYEE_ID AS 직원아이디,
       FIRST_NAME || ', ' || LAST_NAME AS 이름,
       E.DEPARTMENT_ID AS 부서아이디,
       (SELECT DEPARTMENT_NAME FROM DEPARTMENTS D WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID) AS 부서명
FROM EMPLOYEES E
ORDER BY EMPLOYEE_ID ASC;

--문제  8-----------------------------------------------------------------------
--departments테이블  locations테이블을  left 조인하세요
--조건) 부서아이디, 부서이름, 매니저아이디, 로케이션아이디, 스트릿_어드레스, 포스트  코드, 시티  만  출력합니다 
--조건) 부서아이디  기준  오름차순  정렬
SELECT DEPARTMENT_ID,
       DEPARTMENT_NAME,
       MANAGER_ID,
       L.LOCATION_ID,
       STREET_ADDRESS,
       POSTAL_CODE,
       CITY
FROM DEPARTMENTS D LEFT JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
ORDER BY DEPARTMENT_ID ASC;

--문제  9-----------------------------------------------------------------------.
--문제  8의  결과를  (스칼라  쿼리)로  동일하게  조회하세요
SELECT DEPARTMENT_ID,
       DEPARTMENT_NAME,
       MANAGER_ID,
       LOCATION_ID,
       (SELECT STREET_ADDRESS FROM LOCATIONS L WHERE L.LOCATION_ID = D.LOCATION_ID) AS STREET_ADDRESS,
       (SELECT POSTAL_CODE FROM LOCATIONS L WHERE L.LOCATION_ID = D.LOCATION_ID) AS POSTAL_CODE,
       (SELECT CITY FROM LOCATIONS L WHERE L.LOCATION_ID = D.LOCATION_ID) AS CITY
FROM DEPARTMENTS D
ORDER BY DEPARTMENT_ID ASC;

--문제  10-----------------------------------------------------------------------
--locations테이블  countries 테이블을  left 조인하세요
--조건) 로케이션아이디, 주소, 시티, country_id, country_name 만  출력합니다 
--조건) country_name기준  오름차순  정렬
SELECT LOCATION_ID,
       STREET_ADDRESS,
       CITY,
       L.COUNTRY_ID,
       COUNTRY_NAME
FROM LOCATIONS L LEFT JOIN COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID
ORDER BY COUNTRY_NAME ASC;

--문제  11-----------------------------------------------------------------------
--문제  10의  결과를  (스칼라  쿼리)로  동일하게  조회하세요
SELECT LOCATION_ID,
       STREET_ADDRESS,
       CITY,
       COUNTRY_ID,
       (SELECT COUNTRY_NAME FROM COUNTRIES C WHERE C.COUNTRY_ID = L.COUNTRY_ID) AS COUNTRY_NAME
FROM LOCATIONS L
ORDER BY COUNTRY_NAME ASC;
--------------------------------------------------------------------------------
--문제 12
SELECT *
FROM (SELECT ROWNUM AS RN,
             A.*             
       FROM (SELECT EMPLOYEE_ID,
                    FIRST_NAME,
                    PHONE_NUMBER,
                    HIRE_DATE,
                    D.DEPARTMENT_ID,
                    DEPARTMENT_NAME
             FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
             ORDER BY HIRE_DATE ASC) A
      )
WHERE RN BETWEEN 1 AND 10;
--------------------------------------------------------------------------------
--문제 13
SELECT LAST_NAME,
       JOB_ID,
       D.DEPARTMENT_ID,
       DEPARTMENT_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE JOB_ID = 'SA_MAN';
--------------------------------------------------------------------------------
--문제 13-teacher

SELECT E.LAST_NAME,
       E.JOB_ID,
       D.DEPARTMENT_ID,
       D.DEPARTMENT_NAME
FROM (SELECT * 
      FROM EMPLOYEES 
      WHERE JOB_ID = 'SA_MAN') E
JOIN DEPARTMENTS D 
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
--------------------------------------------------------------------------------
--문제 14
SELECT D.DEPARTMENT_ID,
       DEPARTMENT_NAME,
       D.MANAGER_ID,
       COUNT(*) AS 인원수
              
FROM DEPARTMENTS D JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID,
       DEPARTMENT_NAME,
       D.MANAGER_ID
ORDER BY 인원수 DESC;

--문제 14-teacher
SELECT D.DEPARTMENT_ID,
       D.DEPARTMENT_NAME,
       D.MANAGER_ID,
       E.인원수
FROM DEPARTMENTS D
JOIN (SELECT DEPARTMENT_ID,
             COUNT(*) AS 인원수
      FROM EMPLOYEES
      GROUP BY DEPARTMENT_ID) E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
ORDER BY 인원수 DESC;
--------------------------------------------------------------------------------

--문제 15
SELECT DEPARTMENT_ID,
               DEPARTMENT_NAME,
               MANAGER_ID,
               L.LOCATION_ID,
               STREET_ADDRESS,
               POSTAL_CODE,
               NVL((SELECT TRUNC(AVG(SALARY)) FROM EMPLOYEES E WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
                ), 0) AS SALARY
        FROM DEPARTMENTS D LEFT JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
        GROUP BY DEPARTMENT_ID,
                 DEPARTMENT_NAME,
                 MANAGER_ID,
                 L.LOCATION_ID,
                 STREET_ADDRESS,
                 POSTAL_CODE;
--15 - teacher
SELECT D.*,
       STREET_ADDRESS,
       POSTAL_CODE,
       NVL(E.SALARY, 0) AS SALARY
FROM DEPARTMENTS D
LEFT JOIN (SELECT DEPARTMENT_ID,
                  TRUNC(AVG(SALARY)) AS SALARY
           FROM EMPLOYEES
           GROUP BY DEPARTMENT_ID) E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
LEFT JOIN LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID;

--문제 16
SELECT ROWNUM,
       A.*
FROM (SELECT DEPARTMENT_ID,
               DEPARTMENT_NAME,
               MANAGER_ID,
               L.LOCATION_ID,
               STREET_ADDRESS,
               POSTAL_CODE,
               NVL((SELECT TRUNC(AVG(SALARY)) FROM EMPLOYEES E WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
                ), 0) AS SALARY
        FROM DEPARTMENTS D LEFT JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
        GROUP BY DEPARTMENT_ID,DEPARTMENT_NAME,
               MANAGER_ID,
               L.LOCATION_ID,
               STREET_ADDRESS,
               POSTAL_CODE
        ORDER BY DEPARTMENT_ID DESC
     ) A
WHERE ROWNUM BETWEEN 1 AND 10;

--16-teacher
SELECT *
FROM (SELECT ROWNUM RN,
             X.*
      FROM(SELECT D.*,
                  STREET_ADDRESS,
                  POSTAL_CODE,
                  NVL(E.SALARY, 0) AS SALARY
           FROM DEPARTMENTS D
           LEFT JOIN (SELECT DEPARTMENT_ID,
                             TRUNC(AVG(SALARY)) AS SALARY
                      FROM EMPLOYEES
                      GROUP BY DEPARTMENT_ID) E
           ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
           LEFT JOIN LOCATIONS L
           ON D.LOCATION_ID = L.LOCATION_ID
           ORDER BY D.DEPARTMENT_ID
           ) X
      )
WHERE RN BETWEEN 1 AND 10;























