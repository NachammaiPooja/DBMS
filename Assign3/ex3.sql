*****************************************************
	          AIRLINES DATASET
*****************************************************
@Z:/Airlines_dataset/air_main.sql

REM : 1) Display the flight number,departure date and time of a flight, its  route details and aircraft 
REM : name of type either Schweizer or Piper that departs during 8.00 PM and 9.00 PM

   SELECT f.flightno as flight_num,s.departs as depart_date,s.dtime as time,r.routeid as route_id,r.orig_airport as orig_airport,r.dest_airport as dest_airport,a.aname as aircraft_name
   FROM flights f
   JOIN fl_schedule s
   ON(f.flightno = s.flno)
   JOIN routes r
   ON(f.rid=r.routeid)
   JOIN aircraft a
   ON (f.aid= a.aid)
   WHERE (a.type IN ('Schweizer','Piper')) AND (s.dtime BETWEEN 2000 AND 2100);

REM : 2) For all the routes, display the flight number, origin and destination airport, if a flight is 
REM : assigned for that route.

   SELECT routeid,flightno,orig_airport,dest_airport
   FROM flights f
   JOIN routes r
   ON(f.rid=r.routeid);

REM : 3) For all aircraft with cruisingrange over 5,000 miles, find the name of the aircraft and the 
REM : average salary of all pilots certified for this aircraft.

   select aname as Aircraft_Name,AVG(salary) as AVG_emp_SAL
   FROM aircraft a
   JOIN certified c
   USING (aid)
   JOIN employee e
   USING (eid)
   WHERE cruisingrange > 5000
   GROUP BY aname;

REM : 4) Show the employee details such as id, name and salary who are not pilots and whose salary 
REM : is more than the average salary of pilots.

    SELECT eid,ename,salary
    FROM employee e
    WHERE eid NOT IN 
              (SELECT eid from certified c)
    AND salary >(select AVG(salary) 
                        FROM employee JOIN certified
                        USING(eid));

REM : 5) Find the id and name of pilots who were certified to operate some aircrafts but at least one 
REM : of that aircraft is not scheduled from any routes.

   SELECT distinct eid,ename
   FROM employee e
   JOIN certified c
   USING (eid)
   JOIN aircraft a
   USING (aid)
   WHERE aid NOT IN (SELECT f.aid from flights f);

REM : 6) Display the origin and destination of the flights having at least three departures with 
REM : maximum distance covered.

  SELECT orig_airport,dest_airport
  FROM routes JOIN flights
  ON (rid=routeid)
  WHERE distance = (SELECT max(distance)
                    from routes)
  GROUP BY orig_airport,dest_airport
  HAVING count(*) >=3;

REM : 7) Display name and salary of pilot whose salary is more than the average salary of any pilots 
REM : for each route other than flights originating from Madison airport.

    SELECT distinct eid,ename,salary
    FROM employee e
    JOIN certified c
    USING(eid)
    JOIN flights f
    USING(aid)
    JOIN routes r
    ON(rid=r.routeid)
    WHERE e.salary >ANY(SELECT AVG(salary) 
                   FROM employee e 
                   JOIN certified c
                   USING(eid)
                   JOIN flights f
                   USING(aid)
                   JOIN routes ro
                   ON(rid=ro.routeid)
                   WHERE ro.routeid=r.routeid
                   AND orig_airport<>'Madison'
                   GROUP BY(routeid));

REM : 8) Display the flight number, aircraft type, source and destination airport of the aircraft having 
REM : maximum number of flights to Honolulu


   SELECT flightno,type, orig_airport,dest_airport
   FROM aircraft
   JOIN flights using(aid)
   JOIN routes on(routeid=rid)
   WHERE aid=
    (select * FROM (
    select aid
    FROM aircraft
    JOIN flights using(aid)
    JOIN routes on(routeid=rid)
    WHERE dest_airport='Honolulu'
    group by aid
    order by count(*) desc)
    WHERE rownum=1);

REM : 9) Display the pilot(s) who are certified exclusively to pilot all aircraft in a type

SELECT distinct eid, ename,type
FROM employee
JOIN certified USING(eid)
JOIN aircraft USING(aid)
WHERE eid IN ( SELECT c.eid
               FROM certified c
               JOIN aircraft a USING(aid)
	       WHERE c.eid IN ( SELECT c1.eid
	       			FROM certified c1
				JOIN aircraft a1 USING(aid)
	       			GROUP BY c1.eid
				HAVING(count(distinct a1.type))=1)
	       GROUP BY c.eid,a.type
	       HAVING count(*)=(SELECT COUNT (a1.aid)
               FROM aircraft a1
	       WHERE a1.type=a.type)
 );

REM : 10) Name the employee(s) who is earning the maximum salary among the airport having 
REM : maximum number of departures

    SELECT distinct eid,ename,salary
    FROM employee e
    WHERE salary=(SELECT MAX(salary)
                  FROM employee e
                  JOIN certified c
                  USING(eid)
                  JOIN flights f
                  USING(aid)
    		  JOIN routes r
    		  ON(rid=r.routeid)
              	  GROUP BY(orig_airport)
                  HAVING orig_airport=(SELECT orig_airport
                                       FROM routes r JOIN flights f
                                       ON(routeid=rid)
                                       GROUP BY orig_airport
                                       HAVING count(*)=(SELECT MAX(count(*))
                					 FROM routes r JOIN flights f
                					 ON(routeid=rid)
                					 GROUP BY orig_airport)));

REM : 11) Display the departure chart as follows:
REM : flight number, departure(date,airport,time), destination airport, arrival time, aircraft name
REM : for the flights from New York airport during 15 to 19th April 2005. Make sure that the route
REM : contains at least two flights in the above specified condition

 Select f.flightNo,fl.departs,r.orig_airport,fl.dtime,r.dest_airport,fl.atime,a.aname
 FROM 
	aircraft a join flights f using (aid) 
	join routes r on(f.rid = r.routeid) 
	join fl_schedule fl on (f.flightNo = fl.flno)
 WHERE orig_airport='New York'
 AND (fl.departs BETWEEN '15-APR-05' AND '19-APR-05')
 AND (f.rid=(SELECT f1.rid from flights f1
               JOIN routes ro 
               on(f1.rid = ro.routeid)
               JOIN fl_schedule fl1 
               ON (f1.flightNo = fl1.flno)
               WHERE orig_airport='New York'
               AND (fl1.departs BETWEEN '15-APR-05' AND '19-APR-05')
               GROUP BY f1.rid
               HAVING count(flightNo)>=2));

REM : 12) A customer wants to travel from Madison to New York with no more than two changes of 
REM : flight. List the flight numbers from Madison if the customer wants to arrive in New York by 6.50 p.m.

  (select distinct f.flightNo 
from 
	(routes r join flights f on (r.routeid = f.rid) 
	 join fl_schedule fl on(f.flightNo = fl.flno)
	)
where 
	r.orig_airport = 'Madison' and 
	r.dest_airport = 'New York' and 
	fl.atime <=1850
)
union
(select distinct f.flightNo 
from 
	(routes r join flights f on (r.routeid = f.rid) 
	 join fl_schedule fl on(f.flightNo = fl.flno)
	)
	 join 
	(
	 routes rm join flights fm on (rm.routeid = fm.rid) 
	 join fl_schedule flm on(fm.flightNo = flm.flno)
	) 
	on (r.dest_airport = rm.orig_airport)
where 
	r.orig_airport = 'Madison' and 
	rm.dest_airport = 'New York' and 
	fl.atime <= flm.dtime and 
	flm.atime <=1850)
union
(select distinct f.flightNo 
from 
	(
		(routes r join flights f on (r.routeid = f.rid) 
		 join fl_schedule fl on(f.flightNo = fl.flno)
		)
		join 
		(routes rm join flights fm on (rm.routeid = fm.rid) 
		 join fl_schedule flm on(fm.flightNo = flm.flno)
		) 
		on (r.dest_airport = rm.orig_airport)
	)
	join 
	(
	  routes rm1 join flights fm1 on (rm1.routeid = fm1.rid) 
	  join fl_schedule flm1 on(fm1.flightNo = flm1.flno)
	) 
	on (rm.dest_airport = rm1.orig_airport)
where 
	r.orig_airport = 'Madison' and 
	rm1.dest_airport = 'New York' and 
	(fl.atime<=flm.dtime and flm.atime<=flm1.dtime) and 
	flm1.atime <=1850);

REM : 13) Display the id and name  of employee(s) who are not pilots.

    SELECT distinct eid, ename
    FROM employee e
    WHERE e.eid IN (SELECT e1.eid
                    FROM employee e1
             	    MINUS 
             	    SELECT c.eid 
             	    FROM certified c);

REM : 14) Display the id and name of employee(s) who pilots the aircraft from Los Angels and Detroit airport
	
SELECT distinct eid,ename
    FROM employee e
    JOIN certified c
    USING(eid)
    JOIN flights f
    USING(aid)
    JOIN routes r
    ON(rid=r.routeid)
    WHERE r.orig_airport='Los Angeles'
INTERSECT
SELECT distinct eid,ename
    FROM employee e
    JOIN certified c
    USING(eid)
    JOIN flights f
    USING(aid)
    JOIN routes r
    ON(rid=r.routeid)
    WHERE r.orig_airport='Detroit';
