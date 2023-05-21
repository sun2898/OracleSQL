--����  1.----------------------------------------------------------------------
--EMPLOYEES ���̺���  ���  �������  ��ձ޿�����  ����  �������  �����͸�  ���  �ϼ���  ( AVG(�÷�) ���) 
SELECT *
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);
--EMPLOYEES ���̺���  ���  �������  ��ձ޿�����  ����  �������  ����  ����ϼ���
SELECT COUNT(*) AS ������
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);
--EMPLOYEES ���̺���  job_id��  IT_PFOG��  �������  ��ձ޿�����  ����  �������  �����͸�  ����ϼ���
SELECT *
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG');

--����  2.----------------------------------------------------------------------
--DEPARTMENTS���̺���  manager_id��  100��  �����  department_id�� 
--EMPLOYEES���̺���  department_id��  ��ġ�ϴ�  ���  �����  ������  �˻��ϼ���.
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE MANAGER_ID = 100;

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE MANAGER_ID = 100);

--����  3.----------------------------------------------------------------------
--EMPLOYEES���̺���  ��Pat����  manager_id����  ����  manager_id��  ����  ���  �����  �����͸�  ����ϼ��� 
SELECT *
FROM EMPLOYEES
WHERE MANAGER_ID > (SELECT MANAGER_ID FROM EMPLOYEES WHERE FIRST_NAME = 'Pat');

--EMPLOYEES���̺���  ��James��(2��)����  manager_id��  ����  ���  �����  �����͸�  ����ϼ���.

SELECT *
FROM EMPLOYEES
WHERE MANAGER_ID = ANY (SELECT MANAGER_ID FROM EMPLOYEES WHERE FIRST_NAME = 'James');

/*����  4.
-EMPLOYEES���̺� ���� first_name�������� �������� �����ϰ�, 41~50��° �������� �� ��ȣ, �̸��� ����ϼ��� */
SELECT *
FROM (SELECT ROWNUM AS RN,
       FIRST_NAME
      FROM (SELECT *
            FROM EMPLOYEES
            ORDER BY FIRST_NAME DESC)
      )      
WHERE RN BETWEEN 41 AND 50; 

/*����  5.
-EMPLOYEES���̺���  hire_date��������  ��������  �����ϰ�, 31~40��°  ��������  ��  ��ȣ, ���id, �̸�, ��ȣ, 
�Ի�����  ����ϼ���. */
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

--����  6-----------------------------------------------------------------------
--employees���̺�  departments���̺���  left �����ϼ���
--����) �������̵�, �̸�(��, �̸�), �μ����̵�, �μ���  ��  ����մϴ�. 
--����) �������̵�  ����  ��������  ����
SELECT EMPLOYEE_ID AS �������̵�,
       FIRST_NAME || ', ' || LAST_NAME AS �̸�,
       D.DEPARTMENT_ID AS �μ����̵�,
       D.DEPARTMENT_NAME AS �μ���
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY EMPLOYEE_ID ASC;

--����  7-----------------------------------------------------------------------
--����  6��  �����  (��Į��  ����)��  �����ϰ�  ��ȸ�ϼ���
SELECT EMPLOYEE_ID AS �������̵�,
       FIRST_NAME || ', ' || LAST_NAME AS �̸�,
       E.DEPARTMENT_ID AS �μ����̵�,
       (SELECT DEPARTMENT_NAME FROM DEPARTMENTS D WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID) AS �μ���
FROM EMPLOYEES E
ORDER BY EMPLOYEE_ID ASC;

--����  8-----------------------------------------------------------------------
--departments���̺�  locations���̺���  left �����ϼ���
--����) �μ����̵�, �μ��̸�, �Ŵ������̵�, �����̼Ǿ��̵�, ��Ʈ��_��巹��, ����Ʈ  �ڵ�, ��Ƽ  ��  ����մϴ� 
--����) �μ����̵�  ����  ��������  ����
SELECT DEPARTMENT_ID,
       DEPARTMENT_NAME,
       MANAGER_ID,
       L.LOCATION_ID,
       STREET_ADDRESS,
       POSTAL_CODE,
       CITY
FROM DEPARTMENTS D LEFT JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
ORDER BY DEPARTMENT_ID ASC;

--����  9-----------------------------------------------------------------------.
--����  8��  �����  (��Į��  ����)��  �����ϰ�  ��ȸ�ϼ���
SELECT DEPARTMENT_ID,
       DEPARTMENT_NAME,
       MANAGER_ID,
       LOCATION_ID,
       (SELECT STREET_ADDRESS FROM LOCATIONS L WHERE L.LOCATION_ID = D.LOCATION_ID) AS STREET_ADDRESS,
       (SELECT POSTAL_CODE FROM LOCATIONS L WHERE L.LOCATION_ID = D.LOCATION_ID) AS POSTAL_CODE,
       (SELECT CITY FROM LOCATIONS L WHERE L.LOCATION_ID = D.LOCATION_ID) AS CITY
FROM DEPARTMENTS D
ORDER BY DEPARTMENT_ID ASC;

--����  10-----------------------------------------------------------------------
--locations���̺�  countries ���̺���  left �����ϼ���
--����) �����̼Ǿ��̵�, �ּ�, ��Ƽ, country_id, country_name ��  ����մϴ� 
--����) country_name����  ��������  ����
SELECT LOCATION_ID,
       STREET_ADDRESS,
       CITY,
       L.COUNTRY_ID,
       COUNTRY_NAME
FROM LOCATIONS L LEFT JOIN COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID
ORDER BY COUNTRY_NAME ASC;

--����  11-----------------------------------------------------------------------
--����  10��  �����  (��Į��  ����)��  �����ϰ�  ��ȸ�ϼ���
SELECT LOCATION_ID,
       STREET_ADDRESS,
       CITY,
       COUNTRY_ID,
       (SELECT COUNTRY_NAME FROM COUNTRIES C WHERE C.COUNTRY_ID = L.COUNTRY_ID) AS COUNTRY_NAME
FROM LOCATIONS L
ORDER BY COUNTRY_NAME ASC;
--------------------------------------------------------------------------------
--���� 12
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
--���� 13
SELECT LAST_NAME,
       JOB_ID,
       D.DEPARTMENT_ID,
       DEPARTMENT_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE JOB_ID = 'SA_MAN';
--------------------------------------------------------------------------------
--���� 13-teacher

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
--���� 14
SELECT D.DEPARTMENT_ID,
       DEPARTMENT_NAME,
       D.MANAGER_ID,
       COUNT(*) AS �ο���
              
FROM DEPARTMENTS D JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID,
       DEPARTMENT_NAME,
       D.MANAGER_ID
ORDER BY �ο��� DESC;

--���� 14-teacher
SELECT D.DEPARTMENT_ID,
       D.DEPARTMENT_NAME,
       D.MANAGER_ID,
       E.�ο���
FROM DEPARTMENTS D
JOIN (SELECT DEPARTMENT_ID,
             COUNT(*) AS �ο���
      FROM EMPLOYEES
      GROUP BY DEPARTMENT_ID) E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
ORDER BY �ο��� DESC;
--------------------------------------------------------------------------------

--���� 15
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

--���� 16
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























