SQL> @Z:/ex1.sql
SQL> REM : Deleting table based on hierarchy
SQL> REM : *********************************
SQL> 
SQL> drop table sungby;

Table dropped.

SQL> 
SQL> drop table artist;

Table dropped.

SQL> 
SQL> drop table song;

Table dropped.

SQL> 
SQL> drop table album;

Table dropped.

SQL> 
SQL> drop table musician;

Table dropped.

SQL> 
SQL> drop table studio;

Table dropped.

SQL> 
SQL> Rem:Creating the Tables
SQL> Rem:********************
SQL> 
SQL> Rem:a)Create Musician Table
SQL> Rem:------------------------
> 
SQL> create table Musician(m_ID varchar2(5),
  2  m_Name varchar(20),
  3  Birthplace varchar(15),
  4  CONSTRAINT m_ID_pk PRIMARY KEY(m_ID));

Table created.

SQL> 
SQL> desc Musician
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 M_ID                                                                                NOT NULL VARCHAR2(5)
 M_NAME                                                                                       VARCHAR2(20)
 BIRTHPLACE                                                                                   VARCHAR2(15)

SQL> 
SQL> REM: Entering datas into Musician table....
SQL> 
SQL> 	     insert into musician values('M001','Anirudh','chennai');

1 row created.

SQL> 	     insert into musician values('M002','AR.Rahman','chennai');

1 row created.

SQL> 	     insert into musician values('M003','Harris Jayaraj','Trichy');

1 row created.

SQL> 
SQL> REM : Displaying the Musician table...
SQL> 	     select * from Musician;

M_ID  M_NAME               BIRTHPLACE                                                                                                                 
----- -------------------- ---------------                                                                                                            
M001  Anirudh              chennai                                                                                                                    
M002  AR.Rahman            chennai                                                                                                                    
M003  Harris Jayaraj       Trichy                                                                                                                     

SQL> 
SQL> Rem:f)Create Studio Table
SQL> Rem:----------------------
> 
SQL> create table Studio(Stud_Name varchar(20),
  2  Stud_addr varchar2(20),
  3  phone number(10),
  4  CONSTRAINT Stud_Name_pk PRIMARY KEY(Stud_Name));

Table created.

SQL> 
SQL> desc Studio
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 STUD_NAME                                                                           NOT NULL VARCHAR2(20)
 STUD_ADDR                                                                                    VARCHAR2(20)
 PHONE                                                                                        NUMBER(10)

SQL> 
SQL> REM: Entering datas into studio table...
SQL> 
SQL> 	     insert into studio values('AGS','Nungambakkam','8466522201');

1 row created.

SQL> 	     insert into studio values('Le studio','Vadapalani','7896452123');

1 row created.

SQL> 	     insert into studio values('Lakshman studio','Teynampet','9564723654');

1 row created.

SQL> 
SQL> REM : Displaying the Studio table...
SQL> 	     select * from Studio;

STUD_NAME            STUD_ADDR                 PHONE                                                                                                  
-------------------- -------------------- ----------                                                                                                  
AGS                  Nungambakkam         8466522201                                                                                                  
Le studio            Vadapalani           7896452123                                                                                                  
Lakshman studio      Teynampet            9564723654                                                                                                  

SQL> 
SQL> 
SQL> Rem:b)Create Album Table
SQL> Rem:---------------------
> 
SQL> create table Album(a_Name varchar(20),
  2  a_ID varchar2(6),
  3  yr_rel number(4),
  4  num_track number(3) constraint num_not_null NOT NULL,
  5  Std_Name varchar(20),
  6  a_genre varchar(20),
  7  m_ID varchar(20),
  8  CONSTRAINT a_ID_pk PRIMARY KEY(a_ID),
  9  CONSTRAINT m_ID_fk FOREIGN KEY(m_ID) REFERENCES Musician(m_ID),
 10  CONSTRAINT std_name_fk FOREIGN KEY(Std_Name) REFERENCES Studio(Stud_Name),
 11  CONSTRAINT alb_yr_check check(yr_rel >= 1945),
 12  constraint genre_check check( a_genre in('CAR', 'DIV', 'MOV', 'POP')));

Table created.

SQL> 
SQL> desc Album;
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 A_NAME                                                                                       VARCHAR2(20)
 A_ID                                                                                NOT NULL VARCHAR2(6)
 YR_REL                                                                                       NUMBER(4)
 NUM_TRACK                                                                           NOT NULL NUMBER(3)
 STD_NAME                                                                                     VARCHAR2(20)
 A_GENRE                                                                                      VARCHAR2(20)
 M_ID                                                                                         VARCHAR2(20)

SQL> 
SQL> REM: Entering datas into Album table...
SQL> 
SQL> 	     insert into album values('YJHD','A001','2012','4','Le studio','POP','M001');

1 row created.

SQL> 	     insert into album values('NRT','A002','2015','4','Lakshman studio','MOV','M002');

1 row created.

SQL> 	     insert into album values('Bigil','A003','2016','1','AGS','DIV','M003');

1 row created.

SQL> 
SQL> REM: year check constraint violation...
SQL> 	     insert into album values('K3g','A004','1943','2','Le studio','POP','M002');
	insert into album values('K3g','A004','1943','2','Le studio','POP','M002')
*
ERROR at line 1:
ORA-02290: check constraint (1096.ALB_YR_CHECK) violated 


SQL> 	     insert into album values('K3g','A004','1947','2','Le studio','NOV','M002');
	insert into album values('K3g','A004','1947','2','Le studio','NOV','M002')
*
ERROR at line 1:
ORA-02290: check constraint (1096.GENRE_CHECK) violated 


SQL> 
SQL> REM :Album genre constraint violation...
SQL> 	     insert into album values('VTV','A005','1999','4','AGS','FOLK','M001');
        insert into album values('VTV','A005','1999','4','AGS','FOLK','M001')
*
ERROR at line 1:
ORA-02290: check constraint (1096.GENRE_CHECK) violated 


SQL> 
SQL> REM :Number of tracks not null violation....
SQL> 	     insert into album values('Three','A005','2012','','AGS','MOV','M001');
        insert into album values('Three','A005','2012','','AGS','MOV','M001')
                                                       *
ERROR at line 1:
ORA-01400: cannot insert NULL into ("1096"."ALBUM"."NUM_TRACK") 


SQL> 
SQL> REM : Displaying the Album table...
SQL> 	     select * from Album;

A_NAME               A_ID       YR_REL  NUM_TRACK STD_NAME             A_GENRE              M_ID                                                      
-------------------- ------ ---------- ---------- -------------------- -------------------- --------------------                                      
YJHD                 A001         2012          4 Le studio            POP                  M001                                                      
NRT                  A002         2015          4 Lakshman studio      MOV                  M002                                                      
Bigil                A003         2016          1 AGS                  DIV                  M003                                                      

SQL> 
SQL> Rem:c)Create Song Table
SQL> Rem:--------------------
> 
SQL> create table Song(a_ID varchar(5),
  2  track_num number(3),
  3  s_Name varchar(20),
  4  s_length number(5),
  5  s_genre varchar(20),
  6  CONSTRAINT song_pk PRIMARY KEY(a_ID,track_num),
  7  CONSTRAINT a_ID_fk FOREIGN KEY(a_ID) REFERENCES Album(a_ID),
  8  CONSTRAINT song_genre_check check(s_genre in('PHI','REL','LOV','DEV','PAT')),
  9  constraint s_chk check((S_length>7 AND s_genre='PAT') OR s_genre<>'PAT'));

Table created.

SQL> 
SQL> desc Song
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 A_ID                                                                                NOT NULL VARCHAR2(5)
 TRACK_NUM                                                                           NOT NULL NUMBER(3)
 S_NAME                                                                                       VARCHAR2(20)
 S_LENGTH                                                                                     NUMBER(5)
 S_GENRE                                                                                      VARCHAR2(20)

SQL> 
SQL> REM: Entering datas into Song table...
SQL> 
SQL> 	     insert into song values('A001',11,'Mercy','05','REL');

1 row created.

SQL> 	     insert into song values('A002',4,'High Hopes','08','PHI');

1 row created.

SQL> 	     insert into song values('A003',2,'NPM','13','LOV');

1 row created.

SQL> 	     insert into song values('A002',11,'Rare','28','DEV');

1 row created.

SQL> 
SQL> REM: Genre check constraint violation...
SQL> 	     insert into song values('A001','14','Hello','09','ERO');
	insert into song values('A001','14','Hello','09','ERO')
*
ERROR at line 1:
ORA-02290: check constraint (1096.SONG_GENRE_CHECK) violated 


SQL> 
SQL> REM: Genre PAT length check constraint violation...
SQL> 	     insert into song values('A001',17,'Jana','05','PAT');
	insert into song values('A001',17,'Jana','05','PAT')
*
ERROR at line 1:
ORA-02290: check constraint (1096.S_CHK) violated 


SQL> 
SQL> REM : Displaying the Song table...
SQL> 	     select * from Song;

A_ID   TRACK_NUM S_NAME                 S_LENGTH S_GENRE                                                                                              
----- ---------- -------------------- ---------- --------------------                                                                                 
A001          11 Mercy                         5 REL                                                                                                  
A002           4 High Hopes                    8 PHI                                                                                                  
A003           2 NPM                          13 LOV                                                                                                  
A002          11 Rare                         28 DEV                                                                                                  

SQL> 
SQL> Rem:d)Create Artist Table
SQL> Rem:----------------------
> 
SQL> create table Artist(art_ID varchar(5),
  2  art_Name varchar2(25),
  3  CONSTRAINT art_ID_pk PRIMARY KEY(art_ID),
  4  constraint name_uq1 unique(art_Name));

Table created.

SQL> 
SQL> desc Artist
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 ART_ID                                                                              NOT NULL VARCHAR2(5)
 ART_NAME                                                                                     VARCHAR2(25)

SQL> 
SQL> REM: Entering datas into Artist table...
SQL> 
SQL> 
SQL> 	     insert into artist values('a001','Arjith');

1 row created.

SQL> 	     insert into artist values('a002','Neetu');

1 row created.

SQL> 	     insert into artist values('a003','Pooja');

1 row created.

SQL> 
SQL> REM: Unique constraint violation...
SQL> 	     insert into artist values('a004','Arjith');
	insert into artist values('a004','Arjith')
*
ERROR at line 1:
ORA-00001: unique constraint (1096.NAME_UQ1) violated 


SQL> 
SQL> REM : Displaying the Artist table...
SQL> 	     select * from Artist;

ART_I ART_NAME                                                                                                                                        
----- -------------------------                                                                                                                       
a001  Arjith                                                                                                                                          
a002  Neetu                                                                                                                                           
a003  Pooja                                                                                                                                           

SQL> 
SQL> Rem:e)Create Sungby Table
SQL> Rem:---------------------
> 
SQL> create table Sungby(a_ID varchar(5),
  2  track_num number(3),
  3  art_ID varchar(5),
  4  rec_date date,
  5  CONSTRAINT sungby_pk PRIMARY KEY(a_ID,track_num,art_ID),
  6  CONSTRAINT a_ID_track_num_fk FOREIGN KEY(a_ID,track_num) REFERENCES Song(a_ID,track_num),
  7  CONSTRAINT art_ID_fk FOREIGN KEY(art_ID) REFERENCES Artist(art_ID));

Table created.

SQL> 
SQL> desc Sungby
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 A_ID                                                                                NOT NULL VARCHAR2(5)
 TRACK_NUM                                                                           NOT NULL NUMBER(3)
 ART_ID                                                                              NOT NULL VARCHAR2(5)
 REC_DATE                                                                                     DATE

SQL> 
SQL> REM: Entering datas into sungby table
SQL> 
SQL> 	     insert into sungby values('A001','11','a001','05FEB2015');

1 row created.

SQL> 	     insert into sungby values('A002',4,'a002','03MAY2018');

1 row created.

SQL> 	     insert into sungby values('A003',2,'a003','08JUN2012');

1 row created.

SQL> 	     insert into sungby values('A002','2','a001','08JAN2015');
	insert into sungby values('A002','2','a001','08JAN2015')
*
ERROR at line 1:
ORA-02291: integrity constraint (1096.A_ID_TRACK_NUM_FK) violated - parent key not found 


SQL> 
SQL> REM : Displaying the sungby table...
SQL> 	     select * from sungby;

A_ID   TRACK_NUM ART_I REC_DATE                                                                                                                       
----- ---------- ----- ---------                                                                                                                      
A001          11 a001  05-FEB-15                                                                                                                      
A002           4 a002  03-MAY-18                                                                                                                      
A003           2 a003  08-JUN-12                                                                                                                      

SQL> 
SQL> REM: Altering the Tables
SQL> Rem:**********************
SQL> 
SQL> 
SQL> REM : 10) It is necessary to represent the gender of an artist in the table.
SQL> 
SQL> REM : Altering artist table to add gender...
SQL> 
SQL> 	      alter table artist add gender varchar2(1);

Table altered.

SQL> 	      desc artist;
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 ART_ID                                                                              NOT NULL VARCHAR2(5)
 ART_NAME                                                                                     VARCHAR2(25)
 GENDER                                                                                       VARCHAR2(1)

SQL> 
SQL> 	      insert into artist values('a004','Anirudh','M');

1 row created.

SQL> 	      select * from artist;

ART_I ART_NAME                  G                                                                                                                     
----- ------------------------- -                                                                                                                     
a001  Arjith                                                                                                                                          
a002  Neetu                                                                                                                                           
a003  Pooja                                                                                                                                           
a004  Anirudh                   M                                                                                                                     

SQL> 
SQL> REM : 11)The first few words of the lyrics constitute the song name. The song name do not accommodate some of the words (in lyrics).
SQL> 
SQL> REM : Altering song table to modify song name length...
SQL> 
SQL> 	     alter table song modify s_Name varchar(30);

Table altered.

SQL> 	     desc song;
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 A_ID                                                                                NOT NULL VARCHAR2(5)
 TRACK_NUM                                                                           NOT NULL NUMBER(3)
 S_NAME                                                                                       VARCHAR2(30)
 S_LENGTH                                                                                     NUMBER(5)
 S_GENRE                                                                                      VARCHAR2(20)

SQL> 
SQL> 	     insert into song values('A003',4,'Nenjukul peithidum maamazhai','20','LOV');

1 row created.

SQL> 
SQL> REM : 12)The phone number of each studio should be different.
SQL> 
SQL> REM : Altering studio table to add unique constraints for phone...
SQL> 
SQL> 	     alter table studio add unique (phone);

Table altered.

SQL> 	     desc studio;
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 STUD_NAME                                                                           NOT NULL VARCHAR2(20)
 STUD_ADDR                                                                                    VARCHAR2(20)
 PHONE                                                                                        NUMBER(10)

SQL> 
SQL> 	     REM: unique constraint violation modified phone number ...
SQL> 	     insert into studio values('Ramayan','KK Nagar','7896452123');
	insert into studio values('Ramayan','KK Nagar','7896452123')
*
ERROR at line 1:
ORA-00001: unique constraint (1096.SYS_C0075381) violated 


SQL> 	     insert into studio values('Shivan','Adayar','9444647800');

1 row created.

SQL> 
SQL> REM : 13)An artist who sings a song for a particular track of an album can not be recorded without the record_date.
SQL> 
SQL> 
SQL> REM : Altering sungby table to add not null constraint to recorded_date...
SQL> 
SQL> 	     alter table sungby modify rec_date date not null;

Table altered.

SQL> 	     desc sungby;
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 A_ID                                                                                NOT NULL VARCHAR2(5)
 TRACK_NUM                                                                           NOT NULL NUMBER(3)
 ART_ID                                                                              NOT NULL VARCHAR2(5)
 REC_DATE                                                                            NOT NULL DATE

SQL> 	     REM : NOT NULL constraint violation...
SQL> 
SQL> 	     insert into sungby values('A001','11','a001','');
        insert into sungby values('A001','11','a001','')
                                                     *
ERROR at line 1:
ORA-01400: cannot insert NULL into ("1096"."SUNGBY"."REC_DATE") 


SQL> 	     insert into sungby values('A002','11','a003','28FEB2015');

1 row created.

SQL> 
SQL> REM : 14)It was decided to include the genre NAT for nature songs.
SQL> 
SQL> REM : Altering song table to add NAT to the gen_check constraint...
SQL> 
SQL> 	     alter table song drop constraint gen_check;
	alter table song drop constraint gen_check
	                                 *
ERROR at line 1:
ORA-02443: Cannot drop constraint  - nonexistent constraint 


SQL> 	     alter table song add constraint song_genre_check check( s_genre in('PHI', 'REL', 'LOV', 'PAT','NAT'));
        alter table song add constraint song_genre_check check( s_genre in('PHI', 'REL', 'LOV', 'PAT','NAT'))
                                        *
ERROR at line 1:
ORA-02264: name already used by an existing constraint 


SQL> 
SQL> 	     REM : Check constraint violation....
SQL> 		     insert into song values('A002','4','Fida','08','HOP');
		insert into song values('A002','4','Fida','08','HOP')
*
ERROR at line 1:
ORA-02290: check constraint (1096.SONG_GENRE_CHECK) violated 


SQL> 
SQL> 	     REM : Inserting NAT genre after modifying check contraint...
SQL> 		     insert into song values('A002','11','Fida','08','NAT');
		insert into song values('A002','11','Fida','08','NAT')
*
ERROR at line 1:
ORA-02290: check constraint (1096.SONG_GENRE_CHECK) violated 


SQL> 
SQL> REM : 15)Due to typo­error, there may be a possibility of false information. Hence while deleting the song information, make sure that all the corresponding information are also deleted.
SQL> 
SQL> REM : Altering sungby table to add on delete cascade to reference files...
SQL> 
SQL> 
SQL> 	     REM : Trying to delete child error...
SQL> 		     delete from song where a_ID = 'A002';
		delete from song where a_ID = 'A002'
*
ERROR at line 1:
ORA-02292: integrity constraint (1096.A_ID_TRACK_NUM_FK) violated - child record found 


SQL> 
SQL> 	     alter table sungby drop constraint a_ID_track_num_fk;

Table altered.

SQL> 	     alter table sungby add CONSTRAINT a_ID_track_num_fk FOREIGN KEY(a_ID,track_num) REFERENCES Song(a_ID,track_num) on delete cascade;

Table altered.

SQL> 
SQL> REM: Deleting information
SQL> 
SQL> 	     REM : Tables before deleting....
SQL> 
SQL> 		     select * from song where a_ID = 'A002';

A_ID   TRACK_NUM S_NAME                           S_LENGTH S_GENRE                                                                                    
----- ---------- ------------------------------ ---------- --------------------                                                                       
A002           4 High Hopes                              8 PHI                                                                                        
A002          11 Rare                                   28 DEV                                                                                        

SQL> 		     select * from sungby where a_ID = 'A002';

A_ID   TRACK_NUM ART_I REC_DATE                                                                                                                       
----- ---------- ----- ---------                                                                                                                      
A002           4 a002  03-MAY-18                                                                                                                      
A002          11 a003  28-FEB-15                                                                                                                      

SQL> 	     REM : Delete command...
SQL> 
SQL> 		     delete from song where a_ID = 'A002';

2 rows deleted.

SQL> 	     REM : Tables after deleting...
SQL> 
SQL> 	     select * from song;

A_ID   TRACK_NUM S_NAME                           S_LENGTH S_GENRE                                                                                    
----- ---------- ------------------------------ ---------- --------------------                                                                       
A001          11 Mercy                                   5 REL                                                                                        
A003           2 NPM                                    13 LOV                                                                                        
A003           4 Nenjukul peithidum maamazhai           20 LOV                                                                                        

SQL> 	     select * from sungby;

A_ID   TRACK_NUM ART_I REC_DATE                                                                                                                       
----- ---------- ----- ---------                                                                                                                      
A001          11 a001  05-FEB-15                                                                                                                      
A003           2 a003  08-JUN-12                                                                                                                      

SQL> 
SQL> REM : END OF FILE
SQL> REM : *************************************************************************************************************
SQL> spool off
