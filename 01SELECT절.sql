-- ����Ŭ �ּ��� : ������ �ΰ�
/*
������ �ּ�
����ũŬ�� ��ҹ��� �������� �ʴ´�
*/
SELECT * FROM EMPLOYEES;
SELECT FIRST_NAME, EMAIL, hire_date FROM employees;

SELECT * FROM departments;

--����
--�÷��� ��ȸ�ϴ� ��ġ���� * / + -
SELECT FIRST_NAME, SALARY, SALARY + SALARY * 0.1 FROM EMPLOYEES;

--NULL�� Ȯ��
SELECT FIRST_NAME, COMMISSION_PCT FROM EMPLOYEES;

-- ����� as
SELECT FIRST_NAME AS �̸�, 
       LAST_NAME AS ��, 
       SALARY �޿�, 
       SALARY + SALARY * 0.1 �ѱ޿� 
FROM EMPLOYEES;

-- ���ڿ��� ���� ||
-- ����Ŭ�� ���ڸ� ''�� ǥ���Ѵ�.
SELECT FIRST_NAME || ' ' || LAST_NAME || '''s salary $' || SALARY AS �޿����� FROM EMPLOYEES;

--DISTINCT �ߺ��� ����
SELECT DISTINCT FIRST_NAME, DEPARTMENT_ID FROM employees;
SELECT DISTINCT DEPARTMENT_ID FROM employees;

--ROWID(�������� �ּ�), ROWNUM(��ȸ�� ����)
SELECT ROWNUM, ROWID, EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES;












