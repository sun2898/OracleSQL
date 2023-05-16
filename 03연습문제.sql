/*
1.   ��� ����� �����ȣ, �̸�, �Ի���, �޿��� ����ϼ���.
2.   ��� ����� �̸��� ���� �ٿ� ����ϼ���. �� ��Ī�� name���� �ϼ���.
3.   50�� �μ� ����� ��� ������ ����ϼ���.
4.   50�� �μ� ����� �̸�, �μ���ȣ, �������̵� ����ϼ���.
5.   ��� ����� �̸�, �޿� �׸��� 300�޷� �λ�� �޿��� ����ϼ���.
6.   �޿��� 10000���� ū ����� �̸��� �޿��� ����ϼ���.
7.   ���ʽ��� �޴� ����� �̸��� ����, ���ʽ����� ����ϼ���.
8.   2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����ϼ���.(BETWEEN ������ ���)
9.   2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����ϼ���.(LIKE ������ ���)
10. ��� ����� �̸��� �޿��� �޿��� ���� ������� ���� ��������� ����ϼ���.
11. �� ���Ǹ� 60�� �μ��� ����� ���ؼ��� �����ϼ���. (�÷�: department_id)
12. �������̵� IT_PROG �̰ų�, SA_MAN�� ����� �̸��� �������̵� ����ϼ���.
13. Steven King ����� ������ ��Steven King ����� �޿��� 24000�޷� �Դϴ١� �������� ����ϼ���.
14. �Ŵ���(MAN) ������ �ش��ϴ� ����� �̸��� �������̵� ����ϼ���. (�÷�:job_id)
15. �Ŵ���(MAN) ������ �ش��ϴ� ����� �̸��� �������̵� �������̵� ������� ����ϼ���.
*/

SELECT * FROM employees;
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY FROM EMPLOYEES;

SELECT FIRST_NAME || ' ' || LAST_NAME AS NAME FROM EMPLOYEES;

SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 50;

SELECT FIRST_NAME, DEPARTMENT_ID, JOB_ID FROM EMPLOYEES WHERE DEPARTMENT_ID = 50;

SELECT FIRST_NAME, SALARY, SALARY+300 FROM EMPLOYEES;

SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE SALARY > 10000;

SELECT FIRST_NAME, JOB_ID, COMMISSION_PCT FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL;

SELECT FIRST_NAME, HIRE_DATE, SALARY FROM EMPLOYEES WHERE HIRE_DATE BETWEEN '03/01/01' AND '03/12/12';

SELECT FIRST_NAME, HIRE_DATE, SALARY FROM EMPLOYEES WHERE HIRE_DATE LIKE '03%';

SELECT FIRST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC;

SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID = 60 ORDER BY SALARY DESC;

SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG' OR JOB_ID = 'SA_MAN';
SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES WHERE JOB_ID IN('IT_PROG', 'SA_MAN');

SELECT FIRST_NAME || ' ' || LAST_NAME || ' ����� �޿��� ' || SALARY || '�޷� �Դϴ�.' 
FROM EMPLOYEES WHERE FIRST_NAME = 'Steven' AND LAST_NAME = 'King';

SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES WHERE JOB_ID LIKE '%MAN';

SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES WHERE JOB_ID LIKE '%MAN' ORDER BY JOB_ID;



