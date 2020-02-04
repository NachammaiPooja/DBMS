SQL> @Z:/ex2_1.sql
SQL> REM:ASSIGNMENT-2
SQL> REM:**************
SQL> 
SQL> REM:Part - I : DML Update operations & TCL statements
SQL> REM:**************************************************
SQL> 
SQL> REM:Deleting the table
SQL>  drop table classes;

Table dropped.

SQL> 
SQL> REM:CREATION OF TABLE
SQL> REM:*****************
SQL>  create table Classes(Class varchar(20),
  2   type varchar(3),
  3   country varchar(15),
  4   numGuns number(3),
  5   bore number(3),
  6   displacement number(9),
  7   constraint class_pk PRIMARY KEY(class));

Table created.

SQL> 
SQL> REM: 1) Add first two tuples from the above sample data. List the columns explicitly in the INSERT clause. (No ordering of columns)
SQL> 
SQL> insert into classes(country,class,numGuns,type,bore,displacement) values ('USA','Iowa','9','bb','16','46000');

1 row created.

SQL> insert into classes(country,class,numGuns,type,bore,displacement) values ('Japan','Kongo',8,'bc',15,42000);

1 row created.

SQL> 
SQL> REM: 2) Populate the relation with the remaining set of tuples. This time, do not list the columns in the INSERT clause
SQL> 
SQL> insert into classes values ('Bismark','bb','Germany','8',14,32000);

1 row created.

SQL> insert into classes values ('North Carolina','bb','USA',9,16,37000);

1 row created.

SQL> insert into classes values ('Revenge','bb','Gt.Britain',8,15,29000);

1 row created.

SQL> insert into classes values ('Renown','bc','Gt.Britain',6,15,32000);

1 row created.

SQL> 
SQL> REM: 3) Display the populated relation
SQL> 
SQL>  select * from Classes;

CLASS                TYP COUNTRY            NUMGUNS       BORE DISPLACEMENT                                                                                                                                                                               
-------------------- --- --------------- ---------- ---------- ------------                                                                                                                                                                               
Iowa                 bb  USA                      9         16        46000                                                                                                                                                                               
Kongo                bc  Japan                    8         15        42000                                                                                                                                                                               
Bismark              bb  Germany                  8         14        32000                                                                                                                                                                               
North Carolina       bb  USA                      9         16        37000                                                                                                                                                                               
Revenge              bb  Gt.Britain               8         15        29000                                                                                                                                                                               
Renown               bc  Gt.Britain               6         15        32000                                                                                                                                                                               

6 rows selected.

SQL> 
SQL> REM: 4) Mark an intermediate point here in this transaction
SQL> 
SQL>  SAVEPOINT A;

Savepoint created.

SQL> 
SQL> REM:5) Change the displacement of Bismark to 34000.
SQL> 
SQL>  update Classes
  2   set Displacement=34000
  3   where Class='Bismark';

1 row updated.

SQL> 
SQL> REM: Displaying after displacement....
SQL> 
SQL>  select * from classes;

CLASS                TYP COUNTRY            NUMGUNS       BORE DISPLACEMENT                                                                                                                                                                               
-------------------- --- --------------- ---------- ---------- ------------                                                                                                                                                                               
Iowa                 bb  USA                      9         16        46000                                                                                                                                                                               
Kongo                bc  Japan                    8         15        42000                                                                                                                                                                               
Bismark              bb  Germany                  8         14        34000                                                                                                                                                                               
North Carolina       bb  USA                      9         16        37000                                                                                                                                                                               
Revenge              bb  Gt.Britain               8         15        29000                                                                                                                                                                               
Renown               bc  Gt.Britain               6         15        32000                                                                                                                                                                               

6 rows selected.

SQL> 
SQL> REM: 6) For the battleships having at least 9 number of guns or the ships with at least 15 inch bore, increase the displacement by 10%. Verify your changes to the table.
SQL> 
SQL>  update Classes
  2   set Displacement=Displacement+(0.1 * Displacement)
  3   where numGuns >=9 OR bore >=15;

5 rows updated.

SQL> 
SQL> REM: 7) Delete Kongo class of ship from Classes table.
SQL> 
SQL>  delete from classes where class='Kongo';

1 row deleted.

SQL> 
SQL> REM: 8) Display your changes to the table.
SQL> 
SQL>  select * from Classes;

CLASS                TYP COUNTRY            NUMGUNS       BORE DISPLACEMENT                                                                                                                                                                               
-------------------- --- --------------- ---------- ---------- ------------                                                                                                                                                                               
Iowa                 bb  USA                      9         16        50600                                                                                                                                                                               
Bismark              bb  Germany                  8         14        34000                                                                                                                                                                               
North Carolina       bb  USA                      9         16        40700                                                                                                                                                                               
Revenge              bb  Gt.Britain               8         15        31900                                                                                                                                                                               
Renown               bc  Gt.Britain               6         15        35200                                                                                                                                                                               

SQL> 
SQL> REM: 9) Discard the recent updates to the relation without discarding the earlier INSERT operation(s).
SQL> 
SQL>  ROLLBACK TO A;

Rollback complete.

SQL> 
SQL> REM:after rollback....
SQL> 
SQL>  select * from classes;

CLASS                TYP COUNTRY            NUMGUNS       BORE DISPLACEMENT                                                                                                                                                                               
-------------------- --- --------------- ---------- ---------- ------------                                                                                                                                                                               
Iowa                 bb  USA                      9         16        46000                                                                                                                                                                               
Kongo                bc  Japan                    8         15        42000                                                                                                                                                                               
Bismark              bb  Germany                  8         14        32000                                                                                                                                                                               
North Carolina       bb  USA                      9         16        37000                                                                                                                                                                               
Revenge              bb  Gt.Britain               8         15        29000                                                                                                                                                                               
Renown               bc  Gt.Britain               6         15        32000                                                                                                                                                                               

6 rows selected.

SQL> 
SQL> REM:10) Commit the changes.
SQL> 
SQL>  COMMIT;

Commit complete.

SQL> 
SQL> REM:    END OF FILE
SQL> REM:*********************************************************************************************
SQL> 
SQL> 
SQL> @Z:/ex2_2.sql
SQL> REM ********************************************************************
SQL> REM ASSIGNMENT-2: DML FUNDAMENTALS
SQL> REM ********************************************************************
SQL> 
SQL> Prompt ******  Creating EMPLOYEES table ....
******  Creating EMPLOYEES table ....
SQL> 
SQL> REM: Droping the table
SQL> 
SQL> drop table employees;

Table dropped.

SQL> 
SQL> Prompt ******  Creating EMPLOYEES table ....
******  Creating EMPLOYEES table ....
SQL> 
SQL> CREATE TABLE employees
  2  	 ( employee_id	  NUMBER(6)
  3  	 , first_name	  VARCHAR2(20)
  4  	 , last_name	  VARCHAR2(25)
  5  	      CONSTRAINT     emp_last_name_nn  NOT NULL
  6  	 , email	  VARCHAR2(25)
  7  	     CONSTRAINT     emp_email_nn  NOT NULL
  8  	 , phone_number   VARCHAR2(20)
  9  	 , hire_date	  DATE
 10  	     CONSTRAINT     emp_hire_date_nn  NOT NULL
 11  	 , job_id	  VARCHAR2(10)
 12  	     CONSTRAINT     emp_job_nn	NOT NULL
 13  	 , salary	  NUMBER(8,2)
 14  	 , commission_pct NUMBER(2,2)
 15  	 , manager_id	  NUMBER(6)
 16  	 , department_id  NUMBER(4)
 17  	 , CONSTRAINT	  emp_salary_min
 18  			  CHECK (salary > 0)
 19  	 , CONSTRAINT	  emp_email_uk
 20  			  UNIQUE (email)
 21  	 ) ;

Table created.

SQL> 
SQL> ALTER TABLE employees
  2  ADD ( CONSTRAINT	  emp_emp_id_pk
  3  			  PRIMARY KEY (employee_id)
  4  	 , CONSTRAINT	  emp_manager_fk
  5  			  FOREIGN KEY (manager_id)
  6  			   REFERENCES employees
  7  	 ) ;

Table altered.

SQL> 
SQL> REM ***************************insert data into the EMPLOYEES table
SQL> 
SQL> Prompt ******  Populating EMPLOYEES table ....
******  Populating EMPLOYEES table ....
SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 100
  3  	     , 'Steven'
  4  	     , 'King'
  5  	     , 'SKING'
  6  	     , '515.123.4567'
  7  	     , TO_DATE('17-JUN-1987', 'dd-MON-yyyy')
  8  	     , 'AD_PRES'
  9  	     , 24000
 10  	     , NULL
 11  	     , NULL
 12  	     , 90
 13  	     );

1 row created.

SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 101
  3  	     , 'Neena'
  4  	     , 'Kochhar'
  5  	     , 'NKOCHHAR'
  6  	     , '515.123.4568'
  7  	     , TO_DATE('21-SEP-1989', 'dd-MON-yyyy')
  8  	     , 'AD_VP'
  9  	     , 17000
 10  	     , NULL
 11  	     , 100
 12  	     , 90
 13  	     );

1 row created.

SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 102
  3  	     , 'Lex'
  4  	     , 'De Haan'
  5  	     , 'LDEHAAN'
  6  	     , '515.123.4569'
  7  	     , TO_DATE('13-JAN-1993', 'dd-MON-yyyy')
  8  	     , 'AD_VP'
  9  	     , 17000
 10  	     , NULL
 11  	     , 100
 12  	     , 90
 13  	     );

1 row created.

SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 103
  3  	     , 'Alexander'
  4  	     , 'Hunold'
  5  	     , 'AHUNOLD'
  6  	     , '590.423.4567'
  7  	     , TO_DATE('03-JAN-1990', 'dd-MON-yyyy')
  8  	     , 'IT_PROG'
  9  	     , 9000
 10  	     , NULL
 11  	     , 102
 12  	     , 60
 13  	     );

1 row created.

SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 104
  3  	     , 'Bruce'
  4  	     , 'Ernst'
  5  	     , 'BERNST'
  6  	     , '590.423.4568'
  7  	     , TO_DATE('21-MAY-1991', 'dd-MON-yyyy')
  8  	     , 'IT_PROG'
  9  	     , 6000
 10  	     , NULL
 11  	     , 103
 12  	     , 60
 13  	     );

1 row created.

SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 105
  3  	     , 'David'
  4  	     , 'Austin'
  5  	     , 'DAUSTIN'
  6  	     , '590.423.4569'
  7  	     , TO_DATE('25-JUN-1997', 'dd-MON-yyyy')
  8  	     , 'IT_PROG'
  9  	     , 4800
 10  	     , NULL
 11  	     , 103
 12  	     , 60
 13  	     );

1 row created.

SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 106
  3  	     , 'Valli'
  4  	     , 'Pataballa'
  5  	     , 'VPATABAL'
  6  	     , '590.423.4560'
  7  	     , TO_DATE('05-FEB-1998', 'dd-MON-yyyy')
  8  	     , 'IT_PROG'
  9  	     , 4800
 10  	     , NULL
 11  	     , 103
 12  	     , 60
 13  	     );

1 row created.

SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 107
  3  	     , 'Diana'
  4  	     , 'Lorentz'
  5  	     , 'DLORENTZ'
  6  	     , '590.423.5567'
  7  	     , TO_DATE('07-FEB-1999', 'dd-MON-yyyy')
  8  	     , 'IT_PROG'
  9  	     , 4200
 10  	     , NULL
 11  	     , 103
 12  	     , 60
 13  	     );

1 row created.

SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 124
  3  	     , 'Kevin'
  4  	     , 'Mourgos'
  5  	     , 'KMOURGOS'
  6  	     , '650.123.5234'
  7  	     , TO_DATE('16-NOV-1999', 'dd-MON-yyyy')
  8  	     , 'ST_MAN'
  9  	     , 5800
 10  	     , NULL
 11  	     , 100
 12  	     , 50
 13  	     );

1 row created.

SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 141
  3  	     , 'Trenna'
  4  	     , 'Rajs'
  5  	     , 'TRAJS'
  6  	     , '650.121.8009'
  7  	     , TO_DATE('17-OCT-1995', 'dd-MON-yyyy')
  8  	     , 'ST_CLERK'
  9  	     , 3500
 10  	     , NULL
 11  	     , 124
 12  	     , 50
 13  	     );

1 row created.

SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 142
  3  	     , 'Curtis'
  4  	     , 'Davies'
  5  	     , 'CDAVIES'
  6  	     , '650.121.2994'
  7  	     , TO_DATE('29-JAN-1997', 'dd-MON-yyyy')
  8  	     , 'ST_CLERK'
  9  	     , 3100
 10  	     , NULL
 11  	     , 124
 12  	     , 50
 13  	     );

1 row created.

SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 143
  3  	     , 'Randall'
  4  	     , 'Matos'
  5  	     , 'RMATOS'
  6  	     , '650.121.2874'
  7  	     , TO_DATE('15-MAR-1998', 'dd-MON-yyyy')
  8  	     , 'ST_CLERK'
  9  	     , 2600
 10  	     , NULL
 11  	     , 124
 12  	     , 50
 13  	     );

1 row created.

SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 144
  3  	     , 'Peter'
  4  	     , 'Vargas'
  5  	     , 'PVARGAS'
  6  	     , '650.121.2004'
  7  	     , TO_DATE('09-JUL-1998', 'dd-MON-yyyy')
  8  	     , 'ST_CLERK'
  9  	     , 2500
 10  	     , NULL
 11  	     , 124
 12  	     , 50
 13  	     );

1 row created.

SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 149
  3  	     , 'Eleni'
  4  	     , 'Zlotkey'
  5  	     , 'EZLOTKEY'
  6  	     , '011.44.1344.429018'
  7  	     , TO_DATE('29-JAN-2000', 'dd-MON-yyyy')
  8  	     , 'SA_MAN'
  9  	     , 10500
 10  	     , .2
 11  	     , 100
 12  	     , 80
 13  	     );

1 row created.

SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 174
  3  	     , 'Ellen'
  4  	     , 'Abel'
  5  	     , 'EABEL'
  6  	     , '011.44.1644.429267'
  7  	     , TO_DATE('11-MAY-1996', 'dd-MON-yyyy')
  8  	     , 'SA_REP'
  9  	     , 11000
 10  	     , .30
 11  	     , 149
 12  	     , 80
 13  	     );

1 row created.

SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 176
  3  	     , 'Jonathon'
  4  	     , 'Taylor'
  5  	     , 'JTAYLOR'
  6  	     , '011.44.1644.429265'
  7  	     , TO_DATE('24-MAR-1998', 'dd-MON-yyyy')
  8  	     , 'SA_REP'
  9  	     , 8600
 10  	     , .20
 11  	     , 149
 12  	     , 80
 13  	     );

1 row created.

SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 178
  3  	     , 'Kimberely'
  4  	     , 'Grant'
  5  	     , 'KGRANT'
  6  	     , '011.44.1644.429263'
  7  	     , TO_DATE('24-MAY-1999', 'dd-MON-yyyy')
  8  	     , 'SA_REP'
  9  	     , 7000
 10  	     , .15
 11  	     , 149
 12  	     , NULL
 13  	     );

1 row created.

SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 200
  3  	     , 'Jennifer'
  4  	     , 'Whalen'
  5  	     , 'JWHALEN'
  6  	     , '515.123.4444'
  7  	     , TO_DATE('17-SEP-1987', 'dd-MON-yyyy')
  8  	     , 'AD_ASST'
  9  	     , 4400
 10  	     , NULL
 11  	     , 101
 12  	     , 10
 13  	     );

1 row created.

SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 201
  3  	     , 'Michael'
  4  	     , 'Hartstein'
  5  	     , 'MHARTSTE'
  6  	     , '515.123.5555'
  7  	     , TO_DATE('17-FEB-1996', 'dd-MON-yyyy')
  8  	     , 'MK_MAN'
  9  	     , 13000
 10  	     , NULL
 11  	     , 100
 12  	     , 20
 13  	     );

1 row created.

SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 202
  3  	     , 'Pat'
  4  	     , 'Fay'
  5  	     , 'PFAY'
  6  	     , '603.123.6666'
  7  	     , TO_DATE('17-AUG-1997', 'dd-MON-yyyy')
  8  	     , 'MK_REP'
  9  	     , 6000
 10  	     , NULL
 11  	     , 201
 12  	     , 20
 13  	     );

1 row created.

SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 205
  3  	     , 'Shelley'
  4  	     , 'Higgins'
  5  	     , 'SHIGGINS'
  6  	     , '515.123.8080'
  7  	     , TO_DATE('07-JUN-1994', 'dd-MON-yyyy')
  8  	     , 'AC_MGR'
  9  	     , 12000
 10  	     , NULL
 11  	     , 101
 12  	     , 110
 13  	     );

1 row created.

SQL> 
SQL> INSERT INTO employees VALUES
  2  	     ( 206
  3  	     , 'William'
  4  	     , 'Gietz'
  5  	     , 'WGIETZ'
  6  	     , '515.123.8181'
  7  	     , TO_DATE('07-JUN-1994', 'dd-MON-yyyy')
  8  	     , 'AC_ACCOUNT'
  9  	     , 8300
 10  	     , NULL
 11  	     , 205
 12  	     , 110
 13  	     );

1 row created.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> REM:END OF insert data into the EMPLOYEES table
SQL> REM:*******************************************************************************************************
SQL> 
SQL> REM :DISPLAYING after insertion......
SQL> 
SQL>  select * from employees;

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID                                                                         
----------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------                                                                         
        100 Steven               King                      SKING                     515.123.4567         17-JUN-87 AD_PRES         24000                                      90                                                                         
        101 Neena                Kochhar                   NKOCHHAR                  515.123.4568         21-SEP-89 AD_VP           17000                       100            90                                                                         
        102 Lex                  De Haan                   LDEHAAN                   515.123.4569         13-JAN-93 AD_VP           17000                       100            90                                                                         
        103 Alexander            Hunold                    AHUNOLD                   590.423.4567         03-JAN-90 IT_PROG          9000                       102            60                                                                         
        104 Bruce                Ernst                     BERNST                    590.423.4568         21-MAY-91 IT_PROG          6000                       103            60                                                                         
        105 David                Austin                    DAUSTIN                   590.423.4569         25-JUN-97 IT_PROG          4800                       103            60                                                                         
        106 Valli                Pataballa                 VPATABAL                  590.423.4560         05-FEB-98 IT_PROG          4800                       103            60                                                                         
        107 Diana                Lorentz                   DLORENTZ                  590.423.5567         07-FEB-99 IT_PROG          4200                       103            60                                                                         
        124 Kevin                Mourgos                   KMOURGOS                  650.123.5234         16-NOV-99 ST_MAN           5800                       100            50                                                                         
        141 Trenna               Rajs                      TRAJS                     650.121.8009         17-OCT-95 ST_CLERK         3500                       124            50                                                                         
        142 Curtis               Davies                    CDAVIES                   650.121.2994         29-JAN-97 ST_CLERK         3100                       124            50                                                                         

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID                                                                         
----------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------                                                                         
        143 Randall              Matos                     RMATOS                    650.121.2874         15-MAR-98 ST_CLERK         2600                       124            50                                                                         
        144 Peter                Vargas                    PVARGAS                   650.121.2004         09-JUL-98 ST_CLERK         2500                       124            50                                                                         
        149 Eleni                Zlotkey                   EZLOTKEY                  011.44.1344.429018   29-JAN-00 SA_MAN          10500             .2        100            80                                                                         
        174 Ellen                Abel                      EABEL                     011.44.1644.429267   11-MAY-96 SA_REP          11000             .3        149            80                                                                         
        176 Jonathon             Taylor                    JTAYLOR                   011.44.1644.429265   24-MAR-98 SA_REP           8600             .2        149            80                                                                         
        178 Kimberely            Grant                     KGRANT                    011.44.1644.429263   24-MAY-99 SA_REP           7000            .15        149                                                                                       
        200 Jennifer             Whalen                    JWHALEN                   515.123.4444         17-SEP-87 AD_ASST          4400                       101            10                                                                         
        201 Michael              Hartstein                 MHARTSTE                  515.123.5555         17-FEB-96 MK_MAN          13000                       100            20                                                                         
        202 Pat                  Fay                       PFAY                      603.123.6666         17-AUG-97 MK_REP           6000                       201            20                                                                         
        205 Shelley              Higgins                   SHIGGINS                  515.123.8080         07-JUN-94 AC_MGR          12000                       101           110                                                                         
        206 William              Gietz                     WGIETZ                    515.123.8181         07-JUN-94 AC_ACCOUNT       8300                       205           110                                                                         

22 rows selected.

SQL> 
SQL> REM : 11) Display firsy name, job id and salary of all the employees.
SQL> 
SQL>  SELECT first_name,job_id,salary FROM employees;

FIRST_NAME           JOB_ID         SALARY                                                                                                                                                                                                                
-------------------- ---------- ----------                                                                                                                                                                                                                
Steven               AD_PRES         24000                                                                                                                                                                                                                
Neena                AD_VP           17000                                                                                                                                                                                                                
Lex                  AD_VP           17000                                                                                                                                                                                                                
Alexander            IT_PROG          9000                                                                                                                                                                                                                
Bruce                IT_PROG          6000                                                                                                                                                                                                                
David                IT_PROG          4800                                                                                                                                                                                                                
Valli                IT_PROG          4800                                                                                                                                                                                                                
Diana                IT_PROG          4200                                                                                                                                                                                                                
Kevin                ST_MAN           5800                                                                                                                                                                                                                
Trenna               ST_CLERK         3500                                                                                                                                                                                                                
Curtis               ST_CLERK         3100                                                                                                                                                                                                                

FIRST_NAME           JOB_ID         SALARY                                                                                                                                                                                                                
-------------------- ---------- ----------                                                                                                                                                                                                                
Randall              ST_CLERK         2600                                                                                                                                                                                                                
Peter                ST_CLERK         2500                                                                                                                                                                                                                
Eleni                SA_MAN          10500                                                                                                                                                                                                                
Ellen                SA_REP          11000                                                                                                                                                                                                                
Jonathon             SA_REP           8600                                                                                                                                                                                                                
Kimberely            SA_REP           7000                                                                                                                                                                                                                
Jennifer             AD_ASST          4400                                                                                                                                                                                                                
Michael              MK_MAN          13000                                                                                                                                                                                                                
Pat                  MK_REP           6000                                                                                                                                                                                                                
Shelley              AC_MGR          12000                                                                                                                                                                                                                
William              AC_ACCOUNT       8300                                                                                                                                                                                                                

22 rows selected.

SQL> 
SQL> 
SQL> REM : 12) Display the id, name(first & last), salary and annual salary of all the employees. Sort the employees by first name. Label the columns as shown below:(EMPLOYEE_ID, FULL NAME, MONTHLY SAL, ANNUAL SALARY)
SQL> 
SQL>  SELECT employee_id,concat(first_name,(concat(' ',last_name))) as full_name,salary as monthly_sal,salary*12 as Annual_salary
  2   FROM employees order by first_name;

EMPLOYEE_ID FULL_NAME                                      MONTHLY_SAL ANNUAL_SALARY                                                                                                                                                                      
----------- ---------------------------------------------- ----------- -------------                                                                                                                                                                      
        103 Alexander Hunold                                      9000        108000                                                                                                                                                                      
        104 Bruce Ernst                                           6000         72000                                                                                                                                                                      
        142 Curtis Davies                                         3100         37200                                                                                                                                                                      
        105 David Austin                                          4800         57600                                                                                                                                                                      
        107 Diana Lorentz                                         4200         50400                                                                                                                                                                      
        149 Eleni Zlotkey                                        10500        126000                                                                                                                                                                      
        174 Ellen Abel                                           11000        132000                                                                                                                                                                      
        200 Jennifer Whalen                                       4400         52800                                                                                                                                                                      
        176 Jonathon Taylor                                       8600        103200                                                                                                                                                                      
        124 Kevin Mourgos                                         5800         69600                                                                                                                                                                      
        178 Kimberely Grant                                       7000         84000                                                                                                                                                                      

EMPLOYEE_ID FULL_NAME                                      MONTHLY_SAL ANNUAL_SALARY                                                                                                                                                                      
----------- ---------------------------------------------- ----------- -------------                                                                                                                                                                      
        102 Lex De Haan                                          17000        204000                                                                                                                                                                      
        201 Michael Hartstein                                    13000        156000                                                                                                                                                                      
        101 Neena Kochhar                                        17000        204000                                                                                                                                                                      
        202 Pat Fay                                               6000         72000                                                                                                                                                                      
        144 Peter Vargas                                          2500         30000                                                                                                                                                                      
        143 Randall Matos                                         2600         31200                                                                                                                                                                      
        205 Shelley Higgins                                      12000        144000                                                                                                                                                                      
        100 Steven King                                          24000        288000                                                                                                                                                                      
        141 Trenna Rajs                                           3500         42000                                                                                                                                                                      
        106 Valli Pataballa                                       4800         57600                                                                                                                                                                      
        206 William Gietz                                         8300         99600                                                                                                                                                                      

22 rows selected.

SQL> 
SQL> 
SQL> REM: 13) List the different jobs in which the employees are working for
SQL> 
SQL>  SELECT distinct job_id FROM employees;

JOB_ID                                                                                                                                                                                                                                                    
----------                                                                                                                                                                                                                                                
IT_PROG                                                                                                                                                                                                                                                   
AC_MGR                                                                                                                                                                                                                                                    
AC_ACCOUNT                                                                                                                                                                                                                                                
ST_MAN                                                                                                                                                                                                                                                    
AD_ASST                                                                                                                                                                                                                                                   
AD_VP                                                                                                                                                                                                                                                     
SA_MAN                                                                                                                                                                                                                                                    
MK_MAN                                                                                                                                                                                                                                                    
AD_PRES                                                                                                                                                                                                                                                   
SA_REP                                                                                                                                                                                                                                                    
MK_REP                                                                                                                                                                                                                                                    

JOB_ID                                                                                                                                                                                                                                                    
----------                                                                                                                                                                                                                                                
ST_CLERK                                                                                                                                                                                                                                                  

12 rows selected.

SQL> 
SQL> 
SQL> REM: 14) Display the id, first name, job id, salary and commission of employees who are earning commissions
SQL> 
SQL>  SELECT employee_id,first_name,job_id,salary,commission_pct FROM employees
  2   WHERE commission_pct is not NULL;

EMPLOYEE_ID FIRST_NAME           JOB_ID         SALARY COMMISSION_PCT                                                                                                                                                                                     
----------- -------------------- ---------- ---------- --------------                                                                                                                                                                                     
        149 Eleni                SA_MAN          10500             .2                                                                                                                                                                                     
        174 Ellen                SA_REP          11000             .3                                                                                                                                                                                     
        176 Jonathon             SA_REP           8600             .2                                                                                                                                                                                     
        178 Kimberely            SA_REP           7000            .15                                                                                                                                                                                     

SQL> 
SQL> 
SQL> REM: 15) Display the details (id, first name, job id, salary and dept id) of employees who are MANAGERS.
SQL> 
SQL>  SELECT employee_id,first_name,job_id,salary,manager_id FROM employees
  2   WHERE employee_id in (select manager_id from employees);

EMPLOYEE_ID FIRST_NAME           JOB_ID         SALARY MANAGER_ID                                                                                                                                                                                         
----------- -------------------- ---------- ---------- ----------                                                                                                                                                                                         
        100 Steven               AD_PRES         24000                                                                                                                                                                                                    
        102 Lex                  AD_VP           17000        100                                                                                                                                                                                         
        103 Alexander            IT_PROG          9000        102                                                                                                                                                                                         
        124 Kevin                ST_MAN           5800        100                                                                                                                                                                                         
        149 Eleni                SA_MAN          10500        100                                                                                                                                                                                         
        101 Neena                AD_VP           17000        100                                                                                                                                                                                         
        201 Michael              MK_MAN          13000        100                                                                                                                                                                                         
        205 Shelley              AC_MGR          12000        101                                                                                                                                                                                         

8 rows selected.

SQL> 
SQL> 
SQL> REM: 16) Display the details of employees other than sales representatives (id, first name, hire date, job id, salary and dept id) who are hired after �01�May�1999� or whose salary is at least 10000.
SQL> 
SQL>  SELECT employee_id,first_name,hire_date,job_id,salary,department_id FROM employees
  2   WHERE  job_id <> 'SA_REP' AND (hire_date>('01-May-1999') OR salary >=10000);

EMPLOYEE_ID FIRST_NAME           HIRE_DATE JOB_ID         SALARY DEPARTMENT_ID                                                                                                                                                                            
----------- -------------------- --------- ---------- ---------- -------------                                                                                                                                                                            
        100 Steven               17-JUN-87 AD_PRES         24000            90                                                                                                                                                                            
        101 Neena                21-SEP-89 AD_VP           17000            90                                                                                                                                                                            
        102 Lex                  13-JAN-93 AD_VP           17000            90                                                                                                                                                                            
        124 Kevin                16-NOV-99 ST_MAN           5800            50                                                                                                                                                                            
        149 Eleni                29-JAN-00 SA_MAN          10500            80                                                                                                                                                                            
        201 Michael              17-FEB-96 MK_MAN          13000            20                                                                                                                                                                            
        205 Shelley              07-JUN-94 AC_MGR          12000           110                                                                                                                                                                            

7 rows selected.

SQL> 
SQL> 
SQL> REM: 17) Display the employee details (first name, salary, hire date and dept id) whose salary falls in the range of 5000 to 15000 and his/her name begins with any of characters (A,J,K,S). Sort the output by first name.
SQL> 
SQL> 
SQL>  SELECT first_name,salary,hire_date,department_id FROM employees
  2   WHERE upper(substr(first_name,1,1)) in ('A','J','K','S') AND
  3   salary between 5000 and 15000 order by first_name;

FIRST_NAME               SALARY HIRE_DATE DEPARTMENT_ID                                                                                                                                                                                                   
-------------------- ---------- --------- -------------                                                                                                                                                                                                   
Alexander                  9000 03-JAN-90            60                                                                                                                                                                                                   
Jonathon                   8600 24-MAR-98            80                                                                                                                                                                                                   
Kevin                      5800 16-NOV-99            50                                                                                                                                                                                                   
Kimberely                  7000 24-MAY-99                                                                                                                                                                                                                 
Shelley                   12000 07-JUN-94           110                                                                                                                                                                                                   

SQL> 
SQL> REM: 17) Other Method
SQL>  SELECT first_name,salary,hire_date,department_id
  2   FROM employees
  3   where (SALARY BETWEEN 5000 AND 15000) AND ((FIRST_NAME LIKE 'A%') OR (FIRST_NAME LIKE 'J%') OR (FIRST_NAME LIKE 'K%') OR (FIRST_NAME LIKE 'S%'))
  4   ORDER BY first_name;

FIRST_NAME               SALARY HIRE_DATE DEPARTMENT_ID                                                                                                                                                                                                   
-------------------- ---------- --------- -------------                                                                                                                                                                                                   
Alexander                  9000 03-JAN-90            60                                                                                                                                                                                                   
Jonathon                   8600 24-MAR-98            80                                                                                                                                                                                                   
Kevin                      5800 16-NOV-99            50                                                                                                                                                                                                   
Kimberely                  7000 24-MAY-99                                                                                                                                                                                                                 
Shelley                   12000 07-JUN-94           110                                                                                                                                                                                                   

SQL> 
SQL> 
SQL> REM: 18) Display the experience of employees in no. of years and months who were hired after 1998. Label the columns as: (EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, EXP�YRS, EXP�MONTHS)
SQL> 
SQL>  SELECT employee_id,first_name,hire_date,(extract(year from SYSDATE)-extract(year from hire_date)) as Exp_year,floor(mod(months_between(SYSDATE,hire_date),12)) as EXP_month
  2   FROM employees
  3   WHERE extract(year from hire_date) > 1998;

EMPLOYEE_ID FIRST_NAME           HIRE_DATE   EXP_YEAR  EXP_MONTH                                                                                                                                                                                          
----------- -------------------- --------- ---------- ----------                                                                                                                                                                                          
        107 Diana                07-FEB-99         21         11                                                                                                                                                                                          
        124 Kevin                16-NOV-99         21          2                                                                                                                                                                                          
        149 Eleni                29-JAN-00         20         11                                                                                                                                                                                          
        178 Kimberely            24-MAY-99         21          8                                                                                                                                                                                          

SQL> 
SQL> REM: 19) Display the total number of departments.
SQL> 
SQL>  SELECT count(DISTINCT(department_id)) as Total_Num_Dept
  2   FROM employees;

TOTAL_NUM_DEPT                                                                                                                                                                                                                                            
--------------                                                                                                                                                                                                                                            
             7                                                                                                                                                                                                                                            

SQL> 
SQL> REM: 20) Show the number of employees hired by year�wise. Sort the result by year�wise.
SQL> 
SQL>  SELECT extract(year from hire_date) as HIRE_YEAR,count(*) as NUM_EMP FROM employees group by extract(year from hire_date)
  2   order by HIRE_YEAR;

 HIRE_YEAR    NUM_EMP                                                                                                                                                                                                                                     
---------- ----------                                                                                                                                                                                                                                     
      1987          2                                                                                                                                                                                                                                     
      1989          1                                                                                                                                                                                                                                     
      1990          1                                                                                                                                                                                                                                     
      1991          1                                                                                                                                                                                                                                     
      1993          1                                                                                                                                                                                                                                     
      1994          2                                                                                                                                                                                                                                     
      1995          1                                                                                                                                                                                                                                     
      1996          2                                                                                                                                                                                                                                     
      1997          3                                                                                                                                                                                                                                     
      1998          4                                                                                                                                                                                                                                     
      1999          3                                                                                                                                                                                                                                     

 HIRE_YEAR    NUM_EMP                                                                                                                                                                                                                                     
---------- ----------                                                                                                                                                                                                                                     
      2000          1                                                                                                                                                                                                                                     

12 rows selected.

SQL> 
SQL> REM : 21)
SQL> REM : Display the minimum, maximum and average salary, number of employees for each department. Exclude the employee(s) who are not in any department. Include the
SQL> REM : department(s) with at least 2 employees and the average salary is more than 10000. Sort the result by minimum salary in descending order
SQL> 
SQL>  SELECT department_id,min(salary) as MIN_SALARY,round(avg(salary),2) as AVERAGE_SALARY,max(salary) as MAX_SALARY,count(*) as NUM_EMP
  2   FROM employees
  3   WHERE department_id is NOT NULL
  4   GROUP BY department_id
  5   HAVING (count(*)>=2) AND avg(salary)> 10000
  6   ORDER BY MIN_SALARY DESC;

DEPARTMENT_ID MIN_SALARY AVERAGE_SALARY MAX_SALARY    NUM_EMP                                                                                                                                                                                             
------------- ---------- -------------- ---------- ----------                                                                                                                                                                                             
           90      17000       19333.33      24000          3                                                                                                                                                                                             
           80       8600       10033.33      11000          3                                                                                                                                                                                             
          110       8300          10150      12000          2                                                                                                                                                                                             

SQL> 
SQL> REM:    END OF FILE
SQL> REM:*********************************************************************************************
SQL> 
SQL> 
SQL> spool off
