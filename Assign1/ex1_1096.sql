REM : Deleting table based on hierarchy
REM : *********************************

drop table sungby;

drop table artist;

drop table song;

drop table album;

drop table musician;

drop table studio;

Rem:Creating the Tables
Rem:********************

Rem:a)Create Musician Table
Rem:------------------------

create table Musician(m_ID varchar2(5),
m_Name varchar(20) constraint Name_null NOT NULL,
Birthplace varchar(15),
CONSTRAINT m_ID_pk PRIMARY KEY(m_ID));

desc Musician

REM: Entering datas into Musician table....

	insert into musician values('M001','Anirudh','chennai');
	insert into musician values('M002','AR.Rahman','chennai');
	insert into musician values('M003','Harris Jayaraj','Trichy');

REM: Musician id Primary key constraint violation...
	insert into musician values('M001','Ani','chennai');
REM : Musician name Not Null constraint violation...
	insert into musician values('M004','','trichy');

REM : Displaying the Musician table...	
	select * from Musician;

Rem:f)Create Studio Table
Rem:----------------------

create table Studio(Stud_Name varchar(20),
Stud_addr varchar2(20),
phone number(10),
CONSTRAINT Stud_Name_pk PRIMARY KEY(Stud_Name));

desc Studio

REM: Entering datas into studio table...

	insert into studio values('AGS','Nungambakkam','8466522201');
	insert into studio values('Le studio','Vadapalani','7896452123');
	insert into studio values('Lakshman studio','Teynampet','9564723654');

REM : studio name Primary key constraint violation...
	insert into studio values('AGS','Vadapalani','7896452123');

REM : Displaying the Studio table...
	select * from Studio;


Rem:b)Create Album Table
Rem:---------------------

create table Album(a_Name varchar(20),
a_ID varchar2(6),
yr_rel number(4),
num_track number(3),
Std_Name varchar(20),
a_genre varchar(20),
m_ID varchar(20),
CONSTRAINT a_ID_pk PRIMARY KEY(a_ID),
CONSTRAINT m_ID_fk FOREIGN KEY(m_ID) REFERENCES Musician(m_ID),
CONSTRAINT std_name_fk FOREIGN KEY(Std_Name) REFERENCES Studio(Stud_Name),
CONSTRAINT alb_yr_check check(yr_rel >= 1945),
constraint genre_check check( a_genre in('CAR', 'DIV', 'MOV', 'POP')));

desc Album;

REM: Entering datas into Album table...

	insert into album values('YJHD','A001','2012','4','Le studio','POP','M001');
        insert into album values('NRT','A002','2015','4','Lakshman studio','MOV','M002');
	insert into album values('Bigil','A003','2016','1','AGS','DIV','M003');

REM: Not Null constraint violation...
	insert into album values('Bigil','A003','2016','','AGS','DIV','M003');

REM : Foriegn key constraint violation...
	insert into album values('Bigil','A003','2016','1','AGS','DIV','M004');
	
REM: year check constraint violation...
	insert into album values('Maya','A004','1943','2','Le studio','POP','M002');
	insert into album values('Maya','A004','1947','2','Le studio','NOV','M002');

REM : Displaying the Album table...
	select * from Album;

Rem:c)Create Song Table
Rem:--------------------

create table Song(a_ID varchar(5),
track_num number(3),
s_Name varchar(20) constraint sname_null NOT NULL,
s_length number(5),
s_genre varchar(20),
CONSTRAINT song_pk PRIMARY KEY(a_ID,track_num),
CONSTRAINT a_ID_fk FOREIGN KEY(a_ID) REFERENCES Album(a_ID),
CONSTRAINT song_genre_check check(s_genre in('PHI','REL','LOV','DEV','PAT')),
constraint s_chk check((S_length>7 AND s_genre='PAT') OR s_genre<>'PAT'));

desc Song

REM: Entering datas into Song table...

	insert into song values('A001',11,'Mercy','05','REL');
	insert into song values('A002',4,'High Hopes','08','PHI');
        insert into song values('A003',2,'NPM','13','LOV');
        insert into song values('A002',11,'Rare','28','DEV');       

REM: Genre check constraint violation...
	insert into song values('A001','14','Hello','09','ERO');

REM: Genre PAT length check constraint violation...
	insert into song values('A001',17,'Jana','05','PAT');

REM : Displaying the Song table...
	select * from Song;

Rem:d)Create Artist Table
Rem:----------------------

create table Artist(art_ID varchar(5),
art_Name varchar2(25),
CONSTRAINT art_ID_pk PRIMARY KEY(art_ID),
constraint name_uq1 unique(art_Name));

desc Artist

REM: Entering datas into Artist table...


	insert into artist values('a001','Arjith');
	insert into artist values('a002','Neetu');
	insert into artist values('a003','Pooja');

REM: Unique constraint violation...
	insert into artist values('a004','Arjith');

REM: Primary key constraint violation...

	insert into artist values('a002','Pooja');
	

REM : Displaying the Artist table...
	select * from Artist;

Rem:e)Create Sungby Table
Rem:---------------------

create table Sungby(a_ID varchar(5),
track_num number(3),
art_ID varchar(5),
rec_date date,
CONSTRAINT sungby_pk PRIMARY KEY(a_ID,track_num,art_ID),
CONSTRAINT a_ID_track_num_fk FOREIGN KEY(a_ID,track_num) REFERENCES Song(a_ID,track_num),
CONSTRAINT art_ID_fk FOREIGN KEY(art_ID) REFERENCES Artist(art_ID));

desc Sungby

REM: Entering datas into sungby table

	insert into sungby values('A001','11','a001','05FEB2015');
	insert into sungby values('A002',4,'a002','03MAY2018');
	insert into sungby values('A003',2,'a003','08JUN2012');
	insert into sungby values('A002','a001',2,'08JAN2015');
	
REM : composite key violation...

        insert into sungby values('A001','11','a001','05FEB2015');

REM : Foreign key constraint violation...
	insert into sungby values('A005','11','a001','05FEB2015');
	
REM : Displaying the sungby table...
	select * from sungby;

REM: Altering the Tables
Rem:**********************


REM : 10) It is necessary to represent the gender of an artist in the table.

REM : Altering artist table to add gender...

         alter table artist add gender varchar2(1);
	 desc artist;       
 
         insert into artist values('a004','Anirudh','M');
	 select * from artist;

REM : 11)The first few words of the lyrics constitute the song name. The song name do not accommodate some of the words (in lyrics).

REM : Altering song table to modify song name length...

	alter table song modify s_Name varchar(30);
	desc song;
        
        insert into song values('A003',4,'Nenjukul peithidum maamazhai','20','LOV');

REM : 12)The phone number of each studio should be different.

REM : Altering studio table to add unique constraints for phone...

	alter table studio add unique (phone);
	desc studio;
       
        REM: unique constraint violation modified phone number ...
	insert into studio values('Ramayan','KK Nagar','7896452123');
	insert into studio values('Shivan','Adayar','9444647800');

REM : 13)An artist who sings a song for a particular track of an album can not be recorded without the record_date.


REM : Altering sungby table to add not null constraint to recorded_date...

	alter table sungby modify rec_date date not null;
	desc sungby;
	REM : NOT NULL constraint violation...

        insert into sungby values('A001','11','a001','');
        insert into sungby values('A002','11','a003','28FEB2015');

REM : 14)It was decided to include the genre NAT for nature songs.

REM : Altering song table to add NAT to the gen_check constraint...

	alter table song drop constraint gen_check;
        alter table song add constraint song_genre_check check( s_genre in('PHI', 'REL', 'LOV', 'PAT','NAT'));
                             
	REM : Check constraint violation....
		insert into song values('A002','4','Fida','08','HOP');           
            
	REM : Inserting NAT genre after modifying check contraint...
		insert into song values('A002','11','Fida','08','NAT');

REM : 15)Due to typo�error, there may be a possibility of false information. Hence while deleting the song information, make sure that all the corresponding information are also deleted.

REM : Altering sungby table to add on delete cascade to reference files... 


	REM : Trying to delete child error...
		delete from song where a_ID = 'A002';

	alter table sungby drop constraint a_ID_track_num_fk;
	alter table sungby add CONSTRAINT a_ID_track_num_fk FOREIGN KEY(a_ID,track_num) REFERENCES Song(a_ID,track_num) on delete cascade;
  
REM: Deleting information

	REM : Tables before deleting....

		select * from song where a_ID = 'A002';
		select * from sungby where a_ID = 'A002';
	REM : Delete command...
	
		delete from song where a_ID = 'A002';
	REM : Tables after deleting...

	select * from song;
	select * from sungby;   

REM : END OF FILE
REM : *************************************************************************************************************                          
