REM:ASSIGNMENT-2
REM:**************

REM:Part - I : DML Update operations & TCL statements
REM:**************************************************

REM:Deleting the table 
 drop table classes;
 
REM:CREATION OF TABLE
REM:*****************
 create table Classes(Class varchar(20),
 type varchar(3),
 country varchar(15),
 numGuns number(3),
 bore number(3),
 displacement number(9),
 constraint class_pk PRIMARY KEY(class));

REM: 1) Add first two tuples from the above sample data. List the columns explicitly in the INSERT clause. (No ordering of columns)

insert into classes(country,class,numGuns,type,bore,displacement) values ('USA','Iowa','9','bb','16','46000');
insert into classes(country,class,numGuns,type,bore,displacement) values ('Japan','Kongo',8,'bc',15,42000);

REM: 2) Populate the relation with the remaining set of tuples. This time, do not list the columns in the INSERT clause

insert into classes values ('Bismark','bb','Germany','8',14,32000);
insert into classes values ('North Carolina','bb','USA',9,16,37000);
insert into classes values ('Revenge','bb','Gt.Britain',8,15,29000);
insert into classes values ('Renown','bc','Gt.Britain',6,15,32000);

REM: 3) Display the populated relation

 select * from Classes;

REM: 4) Mark an intermediate point here in this transaction

 SAVEPOINT A;

REM:5) Change the displacement of Bismark to 34000.
 
 update Classes
 set Displacement=34000
 where Class='Bismark';

REM: Displaying after displacement....
 
 select * from classes;

REM: 6) For the battleships having at least 9 number of guns or the ships with at least 15 inch bore, increase the displacement by 10%. Verify your changes to the table.

 update Classes
 set Displacement=Displacement+(0.1 * Displacement)
 where numGuns >=9 OR bore >=15;

REM: 7) Delete Kongo class of ship from Classes table.

 delete from classes where class='Kongo';

REM: 8) Display your changes to the table.
 
 select * from Classes;

REM: 9) Discard the recent updates to the relation without discarding the earlier INSERT operation(s).
  
 ROLLBACK TO A;

REM:after rollback....

 select * from classes;

REM:10) Commit the changes.

 COMMIT;

REM:    END OF FILE
REM:*********************************************************************************************

