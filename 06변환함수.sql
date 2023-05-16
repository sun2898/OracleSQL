--����ȯ �Լ�
--�ڵ�����ȯ
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = '30';
SELECT SYSDATE - 5, SYSDATE - '5' FROM DUAL;

--��������ȯ
--TO_CHAR(��¥, ��¥����)
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS') FROM DUAL; --2023-05-16 11:16:51
SELECT TO_CHAR(SYSDATE, 'YY/MM/DD HH24/MI/SS') FROM DUAL; --23/05/16 11/17/26
SELECT TO_CHAR(SYSDATE, 'YYYY"��"MM"��"DD"��"') FROM DUAL; --2023��05��16��

--TO_CHAR(����, ��������)
SELECT TO_CHAR(200000, '$999,999,999') FROM DUAL;
SELECT TO_CHAR(200000, '999999.999') FROM DUAL;
SELECT TO_CHAR( SALARY * 1300, 'L999,999,999') FROM EMPLOYEES ORDER BY SALARY DESC; --����ȭ�����
SELECT FIRST_NAME, TO_CHAR( SALARY * 1300, 'L0999,999,999') FROM EMPLOYEES; -- �ڸ����� 0���� ä��

--TO_NUMBER(����, ��������)
SELECT '3.14' + 2000 AS �ڵ�����ȯ FROM DUAL; --�ڵ�����ȯ
SELECT TO_NUMBER('3.14') + 2000 AS ���������ȯ FROM DUAL; --���������ȯ
SELECT TO_NUMBER('$3,300', '$999,999') + 2000 AS ���������ȯ FROM DUAL;

--TO_DATE(����, ��¥����)
SELECT SYSDATE - '2023-05-16' FROM DUAL;
SELECT SYSDATE - TO_DATE('2023-05-16', 'YYYY-MM-DD') FROM DUAL;
SELECT SYSDATE - TO_DATE('2023/05/16 11:31:23', 'YYYY/MM/DD HH:MI:SS') FROM DUAL;

--YYYY��MM��DD��
SELECT TO_CHAR(TO_DATE('20050105', 'YYYYMMDD'), 'YYYY"��"MM"��"DD"��"') FROM DUAL;

--���糯¥�� �ϼ� ����
SELECT SYSDATE - TO_DATE('2005��01��05��', 'YYYY"��"MM"��"DD"��') FROM DUAL;

-----------------------------------------------------------------------------------
--NVL(�÷�, NULL�� ���)
SELECT NVL(NULL, 0) FROM DUAL;
SELECT FIRST_NAME, COMMISSION_PCT * 100 FROM EMPLOYEES;
SELECT FIRST_NAME, NVL(COMMISSION_PCT, 0) * 100 FROM EMPLOYEES;

--NVL2(�÷�, NULL�� �ƴѰ��, NULL�� ���)
SELECT NVL2(NULL, 'NULL�� �ƴմϴ�', 'NULL�Դϴ�.') FROM DUAL;
SELECT FIRST_NAME,
       SALARY, 
       NVL2(COMMISSION_PCT, SALARY + (SALARY * COMMISSION_PCT), SALARY) AS �޿� FROM EMPLOYEES; --�� ���� ���ΰ�

--DECODE() : ELSE IF���� ��ü�ϴ� �Լ�
SELECT DECODE('F', 'A', 'A�Դϴ�.', 
                   'B', 'B�Դϴ�.', 
                   'C', 'C�Դϴ�.', 
                   'ABC�� �ƴմϴ�.') FROM DUAL;

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
--2ND (��Һ� OR �ٸ��÷��� �񱳰���)
SELECT JOB_ID,
       CASE WHEN JOB_ID = 'IT_PROG' THEN SALARY * 0.3
            WHEN JOB_ID = 'FI_MGR' THEN SALARY * 0.2
            ELSE SALARY
       END
FROM EMPLOYEES;

--COALESCE(A,B) : NVL�� ����
SELECT COALESCE( COMMISSION_PCT, 0) FROM EMPLOYEES;

--��������-----------------------------------------------------------------------
SELECT * FROM EMPLOYEES;

--����1
SELECT EMPLOYEE_ID AS �����ȣ, 
       FIRST_NAME || ' ' || LAST_NAME AS �����,
       HIRE_DATE AS �Ի�����,
       TRUNC((SYSDATE-HIRE_DATE)/365) AS �ټӳ��
FROM EMPLOYEES WHERE (SYSDATE-HIRE_DATE) / 365 > 10 ORDER BY �ټӳ�� DESC;
--WHERE���� ���� �ش� ���ǿ� �´� DB�� ���� �� �� SELECT �����Ѵ�.

--����2
SELECT FIRST_NAME, 
       MANAGER_ID,
       DECODE(MANAGER_ID, '100', '���',
                          '120', '����',
                          '121', '�븮',
                          '122', '����',
                          '�ӿ�') AS ����
FROM EMPLOYEES WHERE DEPARTMENT_ID = 50;

