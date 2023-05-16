--���ڿ� �Լ�
--LOWER(), INITCAP(), UPPER()
SELECT LOWER('HELLO'), INITCAP('HELLO'), UPPER('HELLO') FROM DUAL; --DUAL�� �������̺�
SELECT LOWER(FIRST_NAME), INITCAP(FIRST_NAME), UPPER(FIRST_NAME) FROM EMPLOYEES;
--�Լ��� WHERE������ ����ȴ�. (���� ���� �ٲ� ���� �ƴ�)
SELECT FIRST_NAME FROM EMPLOYEES WHERE UPPER(FIRST_NAME) = 'STEVEN';

--LENGTH():���� / INSTR():����ã��
SELECT FIRST_NAME, LENGTH(FIRST_NAME), INSTR(FIRST_NAME, 'e') from EMPLOYEES;

--SUBSTR():���ڿ��ڸ��� / CONCAT():���ڿ���ġ��
SELECT FIRST_NAME, SUBSTR(FIRST_NAME, 1, 3) FROM EMPLOYEES; -- 1��°���� 3���ڸ� �ڸ�
SELECT FIRST_NAME, CONCAT(FIRST_NAME, LAST_NAME), FIRST_NAME || LAST_NAME FROM EMPLOYEES;

--LPAD():���� ä��� / RPAD():������ ä���
SELECT LPAD('HELLO', 10, '*') FROM DUAL;
SELECT LPAD(SALARY, 10, '*'), RPAD(SALARY, 10, '-') FROM EMPLOYEES;

--LTRIM():�������� / RTRIM():���������� / TRIM():��������
SELECT LTRIM('     HELLO') FROM DUAL;
SELECT FIRST_NAME, LTRIM(FIRST_NAME, 'A') FROM EMPLOYEES;
SELECT RTRIM('   HELLO ') AS RESULT FROM DUAL;
SELECT TRIM(' HELLO  ') AS RESULT FROM DUAL;

--REPLACE():���ڿ�����
SELECT REPLACE('HELLO WORLD', 'HELLO', 'BYE') FROM DUAL;
SELECT REPLACE('HELLO WORLD ~!', ' ', '') AS RESULT FROM DUAL; --��� ���� ����
--��ø
SELECT REPLACE(REPLACE('HELLO WORLD ~!', 'HELLO', 'BYE'), ' ', '') AS RESULT FROM DUAL;

---------------------------------��������----------------------------------------------------
/*���� 1.
EMPLOYEES ���̺� ���� �̸�, �Ի����� �÷����� �����ؼ� �̸������� �������� ��� �մϴ�. 
���� 1) �̸� �÷��� first_name, last_name�� �ٿ��� ����մϴ�.
���� 2) �Ի����� �÷��� xx/xx/xx�� ����Ǿ� �ֽ��ϴ�. xxxxxx���·� �����ؼ� ����մϴ�.
*/
SELECT CONCAT(FIRST_NAME, LAST_NAME) AS �̸�, REPLACE(HIRE_DATE, '/', '') AS �Ի����� FROM EMPLOYEES;

/*���� 2.
EMPLOYEES ���̺� ���� phone_numbe�÷��� ###.###.####���·� ����Ǿ� �ִ�
���⼭ ó�� �� �ڸ� ���� ��� ���� ������ȣ (02)�� �ٿ� ��ȭ ��ȣ�� ����ϵ��� ������ �ۼ��ϼ���
*/

SELECT CONCAT('(02)', SUBSTR(PHONE_NUMBER, 4, LENGTH(PHONE_NUMBER)-4)) FROM EMPLOYEES;

/*���� 3.
EMPLOYEES ���̺��� JOB_ID�� it_prog�� ����� �̸�(first_name)�� �޿�(salary)�� ����ϼ���. 
���� 1) ���ϱ� ���� ���� �ҹ��ڷ� �Է��ؾ� �մϴ�.(��Ʈ : lower �̿�)
���� 2) �̸��� �� 3���ڱ��� ����ϰ� �������� *�� ����մϴ�.
�� ���� �� ��Ī�� name�Դϴ�.(��Ʈ : rpad�� substr �Ǵ� substr �׸��� length �̿�)
���� 3) �޿��� ��ü 10�ڸ��� ����ϵ� ������ �ڸ��� *�� ����մϴ�.
�� ���� �� ��Ī�� salary�Դϴ�.(��Ʈ : lpad �̿�)
*/
SELECT RPAD(SUBSTR(FIRST_NAME, 1, 3),LENGTH(FIRST_NAME),'*') AS name,
       lpad(salary, 10, '*') AS salary 
FROM EMPLOYEES WHERE LOWER(JOB_ID) = 'it_prog';
