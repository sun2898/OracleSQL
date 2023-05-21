-----------JOIN ��������---------------------------------------------------------
/*����  1.
-EMPLOYEES ���̺��, DEPARTMENTS ���̺���  DEPARTMENT_ID��  ����Ǿ�  �ֽ��ϴ�. 
-EMPLOYEES, DEPARTMENTS ���̺���  �������  �̿��ؼ�
���� INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER ���� �ϼ���. (�޶����� ���� ���� Ȯ��)
*/
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
--INNER JOIN = 106��
SELECT * FROM EMPLOYEES E INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
--LEFT OUTER JOIN = 107��
SELECT * FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
--RIGHT OUTER JOIN = 122��
SELECT * FROM EMPLOYEES E RIGHT OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
--FULL OUTER JOIN = 123��
SELECT * FROM EMPLOYEES E FULL OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

/*
����  2.
-EMPLOYEES, DEPARTMENTS ���̺���  INNER JOIN�ϼ���
����)employee_id��  200��  �����  �̸�, department_id��  ����ϼ��� 
����)�̸�  �÷���  first_name��  last_name��  ���ļ�  ����մϴ�
*/
SELECT FIRST_NAME || ' ' || LAST_NAME AS �̸�, E.DEPARTMENT_ID
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE EMPLOYEE_ID = 200;

/*
����  3.
-EMPLOYEES, JOBS���̺���  INNER JOIN�ϼ���
����) ���  �����  �̸���  �������̵�, ����  Ÿ��Ʋ��  ����ϰ�, �̸�  ��������  ��������  ���� 
HINT) �  �÷�����  ����  �����  �ִ���  Ȯ��
*/
SELECT * FROM JOBS;

SELECT FIRST_NAME || ' ' || LAST_NAME AS �̸�, E.JOB_ID, JOB_TITLE
FROM EMPLOYEES E INNER JOIN JOBS J ON E.JOB_ID = J.JOB_ID
ORDER BY �̸� ASC;

/*
����  4.
--JOBS���̺��  JOB_HISTORY���̺���  LEFT_OUTER JOIN �ϼ���.
*/

SELECT * FROM JOBS J LEFT OUTER JOIN JOB_HISTORY JH ON J.JOB_ID = JH.JOB_ID;

/*
����  5.
--Steven King��  �μ�����  ����ϼ���.
*/

SELECT DEPARTMENT_NAME FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE FIRST_NAME = 'Steven' AND LAST_NAME = 'King';

/*����  6.
--EMPLOYEES ���̺��  DEPARTMENTS ���̺���  Cartesian Product(Cross join)ó���ϼ���
*/
SELECT * FROM EMPLOYEES E CROSS JOIN DEPARTMENTS D; -- 2889��

/*����  7.
--EMPLOYEES ���̺��  DEPARTMENTS ���̺���  �μ���ȣ��  �����ϰ�  SA_MAN �������  �����ȣ, �̸�, 
�޿�, �μ���, �ٹ�����  ����ϼ���. (Alias��  ���)
*/
SELECT EMPLOYEE_ID, 
       FIRST_NAME || ' ' || LAST_NAME AS �̸�, 
       SALARY AS �޿�, 
       DEPARTMENT_NAME AS �μ���,
       STREET_ADDRESS AS �ٹ���
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                 LEFT JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE E.JOB_ID = 'SA_MAN';
       
/*
����  8.
-- employees, jobs ���̺���  ����  �����ϰ�  job_title��  'Stock Manager', 'Stock Clerk'��  ����  ������ 
����ϼ���.
*/
SELECT E.*,
       JOB_TITLE
FROM EMPLOYEES E LEFT JOIN JOBS J ON E.JOB_ID = J.JOB_ID
WHERE JOB_TITLE IN ('Stock Manager', 'Stock Clerk');

WHERE JOB_TITLE = 'Stock Manager' OR JOB_TITLE = 'Stock Clerk';


/*
����  9.
-- departments ���̺���  ������  ����  �μ���  ã��  ����ϼ���. LEFT OUTER JOIN ���
*/
SELECT DEPARTMENT_NAME
FROM DEPARTMENTS D LEFT JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE EMPLOYEE_ID IS NULL;

/*
����  10. 
-join��  �̿��ؼ�  �����  �̸���  ��  �����  �Ŵ���  �̸���  ����ϼ��� 
��Ʈ) EMPLOYEES ���̺��  EMPLOYEES ���̺���  �����ϼ���.
*/
SELECT E1.EMPLOYEE_ID,
       E1.FIRST_NAME || ' ' || E1.LAST_NAME AS ����̸�,
       E2.FIRST_NAME || ' ' || E2.LAST_NAME AS �Ŵ����̸�
FROM EMPLOYEES E1 LEFT JOIN EMPLOYEES E2 ON E1.MANAGER_ID = E2.EMPLOYEE_ID
ORDER BY E1.EMPLOYEE_ID;

/*
����  11. 
--EMPLOYEES ���̺���  left join�Ͽ�  ������(�Ŵ���)��, �Ŵ�����  �̸�, �Ŵ�����  �޿�  ����  ����ϼ��� 
--�Ŵ���  ���̵�  ����  �����  �����ϰ�  �޿���  ��������  ����ϼ���
*/
SELECT E1.FIRST_NAME || ' ' || E1.LAST_NAME AS ����̸�,
       E1.SALARY AS ����޿�,
       E2.EMPLOYEE_ID AS �Ŵ������̵�,
       E2.FIRST_NAME || ' ' || E2.LAST_NAME AS �Ŵ����̸�,
       E2.SALARY AS �Ŵ����޿�
FROM EMPLOYEES E1 LEFT JOIN EMPLOYEES E2 ON E1.MANAGER_ID = E2.EMPLOYEE_ID
WHERE E1.MANAGER_ID IS NOT NULL
ORDER BY E1.SALARY DESC;


       




