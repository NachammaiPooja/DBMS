REM ********************************************************************
REM ASSIGNMENT-2: DML FUNDAMENTALS
REM ********************************************************************

Prompt ******  Creating EMPLOYEES table ....

REM: Droping the table

drop table employees;

Prompt ******  Creating EMPLOYEES table ....

CREATE TABLE employees
    ( employee_id    NUMBER(6)
    , first_name     VARCHAR2(20)
    , last_name      VARCHAR2(25)
	 CONSTRAINT     emp_last_name_nn  NOT NULL
    , email          VARCHAR2(25)
	CONSTRAINT     emp_email_nn  NOT NULL
    , phone_number   VARCHAR2(20)
    , hire_date      DATE
	CONSTRAINT     emp_hire_date_nn  NOT NULL
    , job_id         VARCHAR2(10)
	CONSTRAINT     emp_job_nn  NOT NULL
    , salary         NUMBER(8,2)
    , commission_pct NUMBER(2,2)
    , manager_id     NUMBER(6)
    , department_id  NUMBER(4)
    , CONSTRAINT     emp_salary_min
                     CHECK (salary > 0) 
    , CONSTRAINT     emp_email_uk
                     UNIQUE (email)
    ) ;

ALTER TABLE employees
ADD ( CONSTRAINT     emp_emp_id_pk
                     PRIMARY KEY (employee_id)
    , CONSTRAINT     emp_manager_fk
                     FOREIGN KEY (manager_id)
                      REFERENCES employees
    ) ;

REM ***************************insert data into the EMPLOYEES table

Prompt ******  Populating EMPLOYEES table ....

INSERT INTO employees VALUES 
        ( 100
        , 'Steven'
        , 'King'
        , 'SKING'
        , '515.123.4567'
        , TO_DATE('17-JUN-1987', 'dd-MON-yyyy')
        , 'AD_PRES'
        , 24000
        , NULL
        , NULL
        , 90
        );

INSERT INTO employees VALUES 
        ( 101
        , 'Neena'
        , 'Kochhar'
        , 'NKOCHHAR'
        , '515.123.4568'
        , TO_DATE('21-SEP-1989', 'dd-MON-yyyy')
        , 'AD_VP'
        , 17000
        , NULL
        , 100
        , 90
        );

INSERT INTO employees VALUES 
        ( 102
        , 'Lex'
        , 'De Haan'
        , 'LDEHAAN'
        , '515.123.4569'
        , TO_DATE('13-JAN-1993', 'dd-MON-yyyy')
        , 'AD_VP'
        , 17000
        , NULL
        , 100
        , 90
        );

INSERT INTO employees VALUES 
        ( 103
        , 'Alexander'
        , 'Hunold'
        , 'AHUNOLD'
        , '590.423.4567'
        , TO_DATE('03-JAN-1990', 'dd-MON-yyyy')
        , 'IT_PROG'
        , 9000
        , NULL
        , 102
        , 60
        );

INSERT INTO employees VALUES 
        ( 104
        , 'Bruce'
        , 'Ernst'
        , 'BERNST'
        , '590.423.4568'
        , TO_DATE('21-MAY-1991', 'dd-MON-yyyy')
        , 'IT_PROG'
        , 6000
        , NULL
        , 103
        , 60
        );

INSERT INTO employees VALUES 
        ( 105
        , 'David'
        , 'Austin'
        , 'DAUSTIN'
        , '590.423.4569'
        , TO_DATE('25-JUN-1997', 'dd-MON-yyyy')
        , 'IT_PROG'
        , 4800
        , NULL
        , 103
        , 60
        );

INSERT INTO employees VALUES 
        ( 106
        , 'Valli'
        , 'Pataballa'
        , 'VPATABAL'
        , '590.423.4560'
        , TO_DATE('05-FEB-1998', 'dd-MON-yyyy')
        , 'IT_PROG'
        , 4800
        , NULL
        , 103
        , 60
        );

INSERT INTO employees VALUES 
        ( 107
        , 'Diana'
        , 'Lorentz'
        , 'DLORENTZ'
        , '590.423.5567'
        , TO_DATE('07-FEB-1999', 'dd-MON-yyyy')
        , 'IT_PROG'
        , 4200
        , NULL
        , 103
        , 60
        );

INSERT INTO employees VALUES 
        ( 124
        , 'Kevin'
        , 'Mourgos'
        , 'KMOURGOS'
        , '650.123.5234'
        , TO_DATE('16-NOV-1999', 'dd-MON-yyyy')
        , 'ST_MAN'
        , 5800
        , NULL
        , 100
        , 50
        );

INSERT INTO employees VALUES 
        ( 141
        , 'Trenna'
        , 'Rajs'
        , 'TRAJS'
        , '650.121.8009'
        , TO_DATE('17-OCT-1995', 'dd-MON-yyyy')
        , 'ST_CLERK'
        , 3500
        , NULL
        , 124
        , 50
        );

INSERT INTO employees VALUES 
        ( 142
        , 'Curtis'
        , 'Davies'
        , 'CDAVIES'
        , '650.121.2994'
        , TO_DATE('29-JAN-1997', 'dd-MON-yyyy')
        , 'ST_CLERK'
        , 3100
        , NULL
        , 124
        , 50
        );

INSERT INTO employees VALUES 
        ( 143
        , 'Randall'
        , 'Matos'
        , 'RMATOS'
        , '650.121.2874'
        , TO_DATE('15-MAR-1998', 'dd-MON-yyyy')
        , 'ST_CLERK'
        , 2600
        , NULL
        , 124
        , 50
        );

INSERT INTO employees VALUES 
        ( 144
        , 'Peter'
        , 'Vargas'
        , 'PVARGAS'
        , '650.121.2004'
        , TO_DATE('09-JUL-1998', 'dd-MON-yyyy')
        , 'ST_CLERK'
        , 2500
        , NULL
        , 124
        , 50
        );

INSERT INTO employees VALUES 
        ( 149
        , 'Eleni'
        , 'Zlotkey'
        , 'EZLOTKEY'
        , '011.44.1344.429018'
        , TO_DATE('29-JAN-2000', 'dd-MON-yyyy')
        , 'SA_MAN'
        , 10500
        , .2
        , 100
        , 80
        );

INSERT INTO employees VALUES 
        ( 174
        , 'Ellen'
        , 'Abel'
        , 'EABEL'
        , '011.44.1644.429267'
        , TO_DATE('11-MAY-1996', 'dd-MON-yyyy')
        , 'SA_REP'
        , 11000
        , .30
        , 149
        , 80
        );

INSERT INTO employees VALUES 
        ( 176
        , 'Jonathon'
        , 'Taylor'
        , 'JTAYLOR'
        , '011.44.1644.429265'
        , TO_DATE('24-MAR-1998', 'dd-MON-yyyy')
        , 'SA_REP'
        , 8600
        , .20
        , 149
        , 80
        );

INSERT INTO employees VALUES 
        ( 178
        , 'Kimberely'
        , 'Grant'
        , 'KGRANT'
        , '011.44.1644.429263'
        , TO_DATE('24-MAY-1999', 'dd-MON-yyyy')
        , 'SA_REP'
        , 7000
        , .15
        , 149
        , NULL
        );

INSERT INTO employees VALUES 
        ( 200
        , 'Jennifer'
        , 'Whalen'
        , 'JWHALEN'
        , '515.123.4444'
        , TO_DATE('17-SEP-1987', 'dd-MON-yyyy')
        , 'AD_ASST'
        , 4400
        , NULL
        , 101
        , 10
        );

INSERT INTO employees VALUES 
        ( 201
        , 'Michael'
        , 'Hartstein'
        , 'MHARTSTE'
        , '515.123.5555'
        , TO_DATE('17-FEB-1996', 'dd-MON-yyyy')
        , 'MK_MAN'
        , 13000
        , NULL
        , 100
        , 20
        );

INSERT INTO employees VALUES 
        ( 202
        , 'Pat'
        , 'Fay'
        , 'PFAY'
        , '603.123.6666'
        , TO_DATE('17-AUG-1997', 'dd-MON-yyyy')
        , 'MK_REP'
        , 6000
        , NULL
        , 201
        , 20
        );

INSERT INTO employees VALUES 
        ( 205
        , 'Shelley'
        , 'Higgins'
        , 'SHIGGINS'
        , '515.123.8080'
        , TO_DATE('07-JUN-1994', 'dd-MON-yyyy')
        , 'AC_MGR'
        , 12000
        , NULL
        , 101
        , 110
        );

INSERT INTO employees VALUES 
        ( 206
        , 'William'
        , 'Gietz'
        , 'WGIETZ'
        , '515.123.8181'
        , TO_DATE('07-JUN-1994', 'dd-MON-yyyy')
        , 'AC_ACCOUNT'
        , 8300
        , NULL
        , 205
        , 110
        );

COMMIT;

REM:END OF insert data into the EMPLOYEES table
REM:*******************************************************************************************************

REM :DISPLAYING after insertion......

 select * from employees;

REM : 11) Display firsy name, job id and salary of all the employees.

 SELECT first_name,job_id,salary FROM employees;


REM : 12) Display the id, name(first & last), salary and annual salary of all the employees. Sort the employees by first name. Label the columns as shown below:(EMPLOYEE_ID, FULL NAME, MONTHLY SAL, ANNUAL SALARY)
 
 SELECT employee_id,concat(first_name,(concat(' ',last_name))) as full_name,salary as monthly_sal,salary*12 as Annual_salary
 FROM employees order by first_name;


REM: 13) List the different jobs in which the employees are working for

 SELECT distinct job_id FROM employees;


REM: 14) Display the id, first name, job id, salary and commission of employees who are earning commissions

 SELECT employee_id,first_name,job_id,salary,commission_pct FROM employees
 WHERE commission_pct is not NULL;


REM: 15) Display the details (id, first name, job id, salary and dept id) of employees who are MANAGERS.

 SELECT employee_id,first_name,job_id,salary,manager_id FROM employees 
 WHERE employee_id in (select manager_id from employees);


REM: 16) Display the details of employees other than sales representatives (id, first name, hire date, job id, salary and dept id) who are hired after �01�May�1999� or whose salary is at least 10000.

 SELECT employee_id,first_name,hire_date,job_id,salary,department_id FROM employees 
 WHERE  job_id <> 'SA_REP' AND (hire_date>('01-May-1999') OR salary >=10000);


REM: 17) Display the employee details (first name, salary, hire date and dept id) whose salary falls in the range of 5000 to 15000 and his/her name begins with any of characters (A,J,K,S). Sort the output by first name.


 SELECT first_name,salary,hire_date,department_id FROM employees 
 WHERE upper(substr(first_name,1,1)) in ('A','J','K','S') AND 
 salary between 5000 and 15000 order by first_name;

REM: 17) Other Method
 SELECT first_name,salary,hire_date,department_id
 FROM employees
 where (SALARY BETWEEN 5000 AND 15000) AND ((FIRST_NAME LIKE 'A%') OR (FIRST_NAME LIKE 'J%') OR (FIRST_NAME LIKE 'K%') OR (FIRST_NAME LIKE 'S%'))
 ORDER BY first_name;


REM: 18) Display the experience of employees in no. of years and months who were hired after 1998. Label the columns as: (EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, EXP�YRS, EXP�MONTHS)

 SELECT employee_id,first_name,hire_date,(extract(year from SYSDATE)-extract(year from hire_date)) as Exp_year,floor(mod(months_between(SYSDATE,hire_date),12)) as EXP_month
 FROM employees
 WHERE extract(year from hire_date) > 1998;

REM: 19) Display the total number of departments.

 SELECT count(DISTINCT(department_id)) as Total_Num_Dept
 FROM employees;

REM: 20) Show the number of employees hired by year�wise. Sort the result by year�wise.

 SELECT extract(year from hire_date) as HIRE_YEAR,count(*) as NUM_EMP FROM employees group by extract(year from hire_date)
 order by HIRE_YEAR;

REM : 21)
REM : Display the minimum, maximum and average salary, number of employees for each department. Exclude the employee(s) who are not in any department. Include the 
REM : department(s) with at least 2 employees and the average salary is more than 10000. Sort the result by minimum salary in descending order

 SELECT department_id,min(salary) as MIN_SALARY,round(avg(salary),2) as AVERAGE_SALARY,max(salary) as MAX_SALARY,count(*) as NUM_EMP
 FROM employees
 WHERE department_id is NOT NULL
 GROUP BY department_id
 HAVING (count(*)>=2) AND avg(salary)> 10000
 ORDER BY MIN_SALARY DESC;

REM:    END OF FILE
REM:*********************************************************************************************
