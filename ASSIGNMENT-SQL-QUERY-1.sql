

USE sqlassignment;

-- Creatint tables and Inserting values.

CREATE TABLE STUDIES (
						PNAME VARCHAR (40) PRIMARY KEY,
						INSTITUTE VARCHAR(30),
						COURSE VARCHAR(30),
						COURSE_FEE INT
						);

INSERT INTO STUDIES VALUES ('ANAND','SABHARI','PGDCA',4500),
						   ('ALTAF','COIT','DCA',7200),
						   ('JULIANA','BDPS','MCA',22000),
						   ('KAMALA','PRAGATHI','DCA',5000),
						   ('MARY','SABHARI','PGDCA',4500),
						   ('NELSON','PRAGATHI','DAP',6200),
						   ('PATTRICK','PRAGATHI','DCAP',5200),
						   ('QADIR','APPLE','HDCA',14000),
						   ('RAMESH','SABHARI','PGDCA',4500),
						   ('REBECCA','BRILLIANT','DCAP',11000),
						   ('REMITHA','BDPS','DCS',6000),
						   ('REVATHI','SABHARI','DAP',5000),
						   ('VIJAYA','BDPS','DCA',48000)  


SELECT * FROM STUDIES;



CREATE TABLE SOFTWARE (
						PNAME VARCHAR(30),
						TITLE VARCHAR(30),
						DEVELOPIN VARCHAR(30),
						SCOST DECIMAL(8,2),
						DCOST BIGINT,
						SOLD INT
						);

INSERT INTO SOFTWARE VALUES ('MARY','README','CPP',300,1200,84),
							('ANAND','PARACHUTES','BASIC',399.95,6000,43),
							('ANAND','VIDEOTITLING','PASCAL',7500,16000,9),
							('JULIANA','INVENTORY','COBOL',3000,3500,0),
							('KAMALA','PAYROLL PKG','DBASE',9000,20000,7),
							('MARY','FINANCIL ACCT.','ORACLE',18000,85000,4),
							('MARY','CODE GENERATOR','C',4500,20000,23),
							('PATTRICK','README','CPP',300,1200,84),
							('QADIR','BOMBS AWAY','ASSEMBLY',750,3000,11),
							('QADIR','VACCINES','C',1900,3100,21),
							('RAMESH','HOTEL MGMT','DBASE',13000,35000,4),
							('RAMESH','DEAD LEE','PASCAL',599.95,4500,73),
							('REMITHA','PC UTILITIES','C',725,5000,51),
							('REMITHA','TSR HELP PKG','ASSEMBLY',2500,6000,7),
							('REVATHI','HOSPITAL MGMT','PASCAL',1100,75000,2),
							('VIJAYA','TSR EDITOR','C',900,700,6);


SELECT * FROM SOFTWARE;



CREATE TABLE PROGRAMMER (
							PNAME VARCHAR(30),
							DOB DATE,DOJ DATE,
							GENDER VARCHAR(1),
							PROF1 VARCHAR(30),
							PROF2 VARCHAR(30),
							SALARY BIGINT
							)


INSERT INTO PROGRAMMER VALUES      ('ANAND','12-APR-1966','21-APR-92','M','PASCAL','BASIC',3200),
								   ('ALTAF','02-JUL-1964','13-NOV-1990','M','CLIPPER','COBOL',2800 ),
								   ('JULIANA','31-JAN-1960','21-APR-1990','F','COBOL','DBASE',3000),
								   ('KAMALA','30-OCT-1968','02-JAN-1992','F','C','DBASE',2900),
								   ('MARY','24-JUN-1970','01-FEB-1991','F','CPP','ORACLE',4500),
								   ('NELSON','11-SEP-1985','11-OCT-1989','M','COBOL','DBASE',2500),
								   ('PATTRICK','10-NOV-1965','21-APR-1990','M','PASCAL','CLIPPER',2800),
								   ('QADIR','31-AUG-1965','21-APR-1991','M','ASSEMBLY','C',3000),
								   ('RAMESH','03-MAY-1967','28-FEB-1991','M','PASCAL','DBASE',3200),
								   ('REBECCA','01-JAN-1967','01-DEC-1990','F','BASIC','COBOL',2500),
								   ('REMITHA','19-APR-1970','20-APR-1993','F','C','ASSEMBLY',3600),
								   ('REVATHI','02-DEC-1969','02-JAN-1992','F','PASCAL','BASIC',3700),
								   ('VIJAYA','14-DEC-1965','02-MAY-1992','F','FOXPRO','C',3500)



SELECT * FROM PROGRAMMER;


SELECT * FROM STUDIES;
SELECT * FROM SOFTWARE;
SELECT * FROM PROGRAMMER;



                    ---------------- QUESTION AND ANSWERE-----------------


-- 1. Find out the selling cost AVG for packages developed in Pascal. 

SELECT AVG(SCOST) AVG_PASCAL FROM SOFTWARE GROUP BY DEVELOPIN HAVING DEVELOPIN = 'PASCAL';

-- 2. Display Names, Ages of all Programmers. 

SELECT PNAME, DATEDIFF(YEAR ,DOB,GETDATE()) AGE FROM PROGRAMMER;

-- 3. Display the Names of those who have done the DAP Course. 

SELECT PNAME FROM STUDIES WHERE COURSE = 'DAP';

-- 4. Display the Names and Date of Births of all Programmers Born in January. 

SELECT PNAME, DOB FROM PROGRAMMER WHERE  MONTH(DOB) = 1;

-- 5. What is the Highest Number of copies sold by a Package? 

SELECT SOLD Highest_Number,TITLE FROM SOFTWARE 
WHERE SOLD = (SELECT MAX(SOLD) FROM SOFTWARE);

-- 6. Display lowest course Fee. 

SELECT MIN(COURSE_FEE) lowest_course_Fee FROM STUDIES;

-- 7. How many programmers done the PGDCA Course? 

SELECT COUNT(PNAME) NO_OF_P FROM STUDIES WHERE COURSE = 'PGDCA';

-- 8. How much revenue has been earned thru sales of Packages Developed in C.

SELECT SUM((SCOST*SOLD-DCOST)) REVENUE_of_c FROM SOFTWARE WHERE DEVELOPIN = 'C';

-- 9. Display the Details of the Software Developed by Ramesh. 

SELECT PNAME,TITLE FROM SOFTWARE WHERE PNAME = 'RAMESH';

-- 10. How many Programmers Studied at Sabhari? 

SELECT COUNT(PNAME) TOTAL_NO FROM STUDIES WHERE INSTITUTE = 'SABHARI';

-- 11. Display details of Packages whose sales crossed the 2000 Mark. 

SELECT TITLE,SUM(SCOST*SOLD) TOTAL_SELLING_PRICE 
		FROM SOFTWARE GROUP BY TITLE 
		HAVING SUM(SCOST*SOLD) > 2000;

-- 12. Display the Details of Packages for which Development Cost have been recovered. 

SELECT TITLE,COUNT(TITLE) NO_OF_SOFTWARE,
		SUM(SCOST*SOLD) TOTAL_SELLING_PRICE,
		SUM(DCOST) TOTAL_DEVELOPMENT_COST
		FROM SOFTWARE GROUP BY  TITLE 
		HAVING SUM(SCOST*SOLD) > SUM(DCOST);

-- 13. What is the cost of the costliest software development in Basic? 

SELECT SCOST,DCOST FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE WHERE DEVELOPIN = 'BASIC' );  

-- 14. How many Packages Developed in DBASE? 

SELECT COUNT(TITLE) NO_OF_PACKAGE FROM SOFTWARE WHERE DEVELOPIN = 'DBASE';

-- 15. How many programmers studied in Pragathi? 

SELECT COUNT(PNAME) TOTAL_NO FROM STUDIES WHERE INSTITUTE = 'PRAGATHI';

-- 16. How many Programmers Paid 5000 to 10000 for their course? 

SELECT * FROM STUDIES WHERE COURSE_FEE BETWEEN 5000 AND 10000;

-- 17. What is AVG Course Fee 

SELECT AVG(COURSE_FEE) AVG_Course FROM STUDIES;

-- 18. Display the details of the Programmers Knowing C.

SELECT PNAME FROM PROGRAMMER WHERE PROF1 = 'C' OR PROF2 = 'C';

-- 19. How many Programmers know either COBOL or PASCAL. 

SELECT COUNT(PNAME) NO_OF_PROGRAMMER FROM PROGRAMMER 
		WHERE PROF1 = 'COBOL'OR PROF1 = 'PASCAL' OR PROF2 = 'COBOL' OR PROF2 = 'PASCAL';

-- 20. How many Programmers Don’t know PASCAL and C 

SELECT COUNT(PNAME) NO_OF_PROGRAMMER FROM PROGRAMMER 
		WHERE PROF1 <> 'C'AND PROF1 <> 'PASCAL' AND PROF2 <> 'C' AND PROF2 <> 'PASCAL';

-- 21. How old is the Oldest Male Programmer. 

SELECT MAX(AGE) Oldest_Male_Programmer FROM 
		(SELECT PNAME, DATEDIFF(YEAR ,DOB,GETDATE()) AGE FROM PROGRAMMER) AGE_OF_PROGRAMMER ;

-- 22. What is the AVG age of Female Programmers? 


SELECT AVG(AGE) AVG_age_of_Female_Programmers FROM 
		(SELECT PNAME,GENDER ,DATEDIFF(YEAR ,DOB,GETDATE()) AGE FROM PROGRAMMER) AGE_OF_PROGRAMMER 
		WHERE GENDER = 'F';

-- 23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order. 

SELECT * FROM 
		(SELECT PNAME,GENDER ,DATEDIFF(YEAR ,DOJ,GETDATE()) EXPERIANCE FROM PROGRAMMER) EXPERIANCE_OF_PROGRAMMER
		ORDER BY EXPERIANCE DESC;

-- 24. Who are the Programmers who celebrate their Birthday’s During the Current Month? 

SELECT PNAME,DOB FROM PROGRAMMER WHERE MONTH(DOB) = MONTH(GETDATE());

-- 25. How many Female Programmers are there? 

SELECT COUNT(PNAME) NO_OF_FEMALE_PROG FROM PROGRAMMER WHERE GENDER = 'F';

-- 26. What are the Languages studied by Male Programmers. 

SELECT PNAME,PROF1,PROF2,GENDER FROM PROGRAMMER WHERE GENDER = 'M';

-- 27. What is the AVG Salary? 

SELECT AVG(SALARY) AVG_SALARY FROM PROGRAMMER;

-- 28. How many people draw salary 2000 to 4000? 

SELECT COUNT(PNAME) NO_OF_PROG FROM PROGRAMMER WHERE SALARY BETWEEN 2000 AND 4000;

-- 29. Display the details of those who don’t know Clipper, COBOL or PASCAL. 

SELECT * FROM PROGRAMMER
		WHERE PROF1 NOT IN ('CLIPPER','COBOL','PASCAL') 
		AND  PROF2 NOT IN ('CLIPPER','COBOL','PASCAL'); 

-- 30. Display the Cost of Package Developed By each Programmer. 

SELECT PNAME,SUM(DCOST)TOTAL_DEVOPLED_COST FROM SOFTWARE GROUP BY PNAME;

-- 31. Display the sales values of the Packages Developed by the each Programmer. 

SELECT PNAME, SUM(SCOST*SOLD) TOTAL_SELLING_COST FROM SOFTWARE GROUP BY PNAME;

-- 32. Display the Number of Packages sold by Each Programmer. 

SELECT PNAME,COUNT(TITLE) NO_OF_PKG,SUM(SOLD) SOLD 
		FROM SOFTWARE GROUP BY PNAME;

-- 33. Display the sales cost of the packages Developed by each Programmer Language wise.

SELECT DEVELOPIN, SUM(SCOST) TOTAL_SELL_COST FROM SOFTWARE GROUP BY  DEVELOPIN;

-- 34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy. 

SELECT DEVELOPIN, AVG(DCOST) AVG_Development_Cost,
				  AVG(SCOST) AVG_SELL_Cost,
				  AVG((SCOST-DCOST)) AVG_PRICE
				  FROM SOFTWARE GROUP BY  DEVELOPIN;

-- 35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her. 

SELECT PNAME ,MIN(DCOST) cheapest_Packages,	
              MAX(DCOST) costliest_Packages 
	          FROM SOFTWARE GROUP BY PNAME;

-- 36. Display each institute name with number of Courses, Average Cost per Course. 

SELECT INSTITUTE ,COUNT(COURSE) NO_OF_COURSE,
		AVG(COURSE_FEE) AVGFEE 
		FROM STUDIES GROUP BY INSTITUTE;

-- 37. Display each institute Name with Number of Students. 

SELECT INSTITUTE ,COUNT(PNAME) NO_OF_STUDENT FROM STUDIES GROUP BY INSTITUTE;

-- 38. Display Names of Male and Female Programmers. Gender also. 

SELECT PNAME, GENDER FROM PROGRAMMER;

-- 39. Display the Name of Programmers and Their Packages. 

SELECT P.PNAME,S.TITLE FROM PROGRAMMER P JOIN SOFTWARE S 
	   ON P.PNAME = S.PNAME ORDER BY S.PNAME;

-- 40. Display the Number of Packages in Each Language Except C and C++. 

SELECT DEVELOPIN PROGRAMING_LANGUGES,COUNT(TITLE) NO_OF_PKG 
		FROM  SOFTWARE GROUP BY DEVELOPIN
		HAVING (DEVELOPIN <> 'C' AND DEVELOPIN <> 'C++');

-- 41. Display the Number of Packages in Each Language for which  
--     Development Cost is less than 1000.

SELECT DEVELOPIN PROGRAMING_LANGUGES,
		COUNT(TITLE) NO_OF_PKG 
		FROM  SOFTWARE WHERE DCOST < 1000 GROUP BY DEVELOPIN;

-- 42. Display AVG Difference between SCOST, DCOST for Each Package. 

SELECT TITLE ,AVG(SCOST*SOLD - DCOST) AVG_DIFF_E_PKG
		FROM SOFTWARE GROUP BY TITLE;

-- 43. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer 
--     for Those Whose Cost has not yet been Recovered. 

SELECT TITLE ,(DCOST -SCOST*SOLD) AMOUNT_RECOV,
		SUM(SCOST*SOLD) TOTAL_SCOST,
		SUM(DCOST) TOTAL_DCOST
		FROM SOFTWARE  WHERE (SCOST*SOLD - DCOST) < 0 GROUP BY TITLE,SCOST,SOLD,DCOST;

-- 44. Display Highest, Lowest and Average Salaries for those earning more than 2000. 

SELECT MAX(SALARY)Highest_Salaries,
		MIN(SALARY) Lowest_Salaries,
		AVG(SALARY) Average_Salaries 
		FROM PROGRAMMER WHERE SALARY > 2000;

-- 45. Who is the Highest Paid C Programmers? 

SELECT PNAME, SALARY,PROF1,PROF2 FROM PROGRAMMER
		WHERE SALARY = (SELECT MAX(SALARY) FROM PROGRAMMER 
						WHERE PROF1 = 'C' OR PROF2 = 'C'); 

-- 46. Who is the Highest Paid Female COBOL Programmer? 

SELECT PNAME, SALARY,GENDER FROM PROGRAMMER
		WHERE GENDER = 'F' AND SALARY = (SELECT MAX(SALARY) FROM PROGRAMMER 
										 WHERE PROF1 = 'COBOL' OR PROF2 = 'COBOL');

-- 47. Display the names of the highest paid programmers for each Language.

WITH PRO_LANG AS (
					SELECT PNAME,PROF1 LANG,SALARY FROM PROGRAMMER 
					UNION  
					SELECT PNAME,PROF2,SALARY FROM PROGRAMMER
					)
SELECT P.PNAME,S.LANG,S.MAX_SALARY FROM PROGRAMMER P,
(SELECT MAX(SALARY) MAX_SALARY,LANG FROM PRO_LANG GROUP BY LANG) S
WHERE (P.SALARY = S.MAX_SALARY AND (P.PROF1 = S.LANG OR P.PROF2 =S.LANG)) ORDER BY LANG;

----- ALTERNATIVE TO JUST CHECK;

WITH PRO_LANG AS (
					SELECT PNAME,PROF1 LANG,SALARY FROM PROGRAMMER 
					UNION  
					SELECT PNAME,PROF2,SALARY FROM PROGRAMMER
					)
SELECT P.PNAME,P.PROF1,P.PROF2,S.LANG,S.MAX_SALARY FROM PROGRAMMER P,(SELECT MAX(SALARY) MAX_SALARY,LANG FROM PRO_LANG GROUP BY LANG) S
WHERE (P.SALARY = S.MAX_SALARY AND (P.PROF1 = S.LANG OR P.PROF2 =S.LANG)) ORDER BY LANG;

-- 48. Who is the least experienced Programmer. 

WITH LEAST_EXP AS (SELECT DOJ DOJ, DATEDIFF(YY,DOJ,GETDATE()) EXPERIANCE,PNAME FROM PROGRAMMER)
     SELECT PNAME FROM LEAST_EXP WHERE EXPERIANCE = (SELECT MIN(EXPERIANCE) FROM LEAST_EXP); 

-- 49. Who is the most experienced male programmer knowing PASCAL. 

WITH MAX_EXP AS (SELECT PNAME,PROF1,PROF2,DOJ DOJ, DATEDIFF(YY,DOJ,GETDATE()) EXPERIANCE 
				         FROM PROGRAMMER WHERE PROF1= 'PASCAL' OR PROF2= 'PASCAL')
( SELECT PNAME FROM MAX_EXP 
   WHERE (EXPERIANCE = (SELECT MAX(EXPERIANCE) FROM MAX_EXP) 
   AND (PROF1= 'PASCAL' OR PROF2= 'PASCAL')
											)
											     );
SELECT * FROM PROGRAMMER
SELECT * FROM SOFTWARE

-- 50. Which Language is known by only one Programmer?

WITH PRO_LANG AS (
					SELECT PNAME,PROF1 LANG,SALARY FROM PROGRAMMER 
					UNION  
					SELECT PNAME,PROF2,SALARY FROM PROGRAMMER
					)
SELECT COUNT(PNAME) NO_OF_PRO,LANG FROM PRO_LANG GROUP BY LANG HAVING COUNT(PNAME)<2;

-- 51. Who is the Above Programmer Referred in 50? 

WITH PRO_LANG AS (
					SELECT PNAME,PROF1 LANG,SALARY FROM PROGRAMMER 
					UNION  
					SELECT PNAME,PROF2,SALARY FROM PROGRAMMER
					)
SELECT PNAME,LANG FROM PRO_LANG 
WHERE LANG IN (SELECT LANG FROM PRO_LANG GROUP BY LANG HAVING COUNT(PNAME)<2);

-- 52. Who is the Youngest Programmer knowing DBASE? 

WITH PRO_LANG_DBO AS (
					SELECT PNAME,PROF1 LANG,SALARY,DATEDIFF(YEAR,DOB,GETDATE()) AGE FROM PROGRAMMER 
					UNION  
					SELECT PNAME,PROF2,SALARY,DATEDIFF(YEAR,DOB,GETDATE()) AGE FROM PROGRAMMER
					)
SELECT PNAME,LANG,AGE FROM PRO_LANG_DBO WHERE ( AGE = (SELECT MIN(AGE) FROM PRO_LANG_DBO) AND LANG = 'DBASE');

-- 53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE? 

WITH PRO_LANG AS (
					SELECT PNAME,PROF1 LANG,GENDER,SALARY FROM PROGRAMMER 
					UNION  
					SELECT PNAME,PROF2,GENDER,SALARY FROM PROGRAMMER
					)
SELECT * FROM PRO_LANG WHERE (LANG NOT IN ('C','C++','ORACLE ','DBASE') AND GENDER = 'F' AND SALARY > 3000); 

-- 54. Which Institute has most number of Students? 

SELECT * FROM STUDIES

WITH C AS (SELECT COUNT(PNAME) NO_OF_STD,INSTITUTE FROM STUDIES GROUP BY INSTITUTE)
	SELECT NO_OF_STD,INSTITUTE FROM C WHERE NO_OF_STD = (SELECT MAX(NO_OF_STD) FROM C);

-- 55. What is the Costliest course? 

SELECT COURSE,COURSE_FEE FROM STUDIES WHERE COURSE_FEE = (SELECT MAX(COURSE_FEE) FROM STUDIES );

-- 56. Which course has been done by the most of the Students? 

WITH C AS (SELECT COUNT(PNAME) NO_OF_STD,COURSE FROM STUDIES GROUP BY COURSE)
	SELECT NO_OF_STD,COURSE FROM C WHERE NO_OF_STD = (SELECT MAX(NO_OF_STD) FROM C);

-- 57. Which Institute conducts costliest course. 

SELECT INSTITUTE,COURSE_FEE FROM STUDIES WHERE COURSE_FEE = (SELECT MAX(COURSE_FEE) FROM STUDIES); 

-- 58. Display the name of the Institute and Course, which has below AVG course fee. 

SELECT INSTITUTE,COURSE,COURSE_FEE FROM STUDIES WHERE COURSE_FEE < (SELECT AVG(COURSE_FEE) FROM STUDIES);

-- 59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee, 

SELECT INSTITUTE,COURSE,COURSE_FEE FROM STUDIES 
WHERE COURSE_FEE < (SELECT AVG(COURSE_FEE)+1000 FROM STUDIES) 
  AND COURSE_FEE > (SELECT AVG(COURSE_FEE)-1000 FROM STUDIES);

-- 60. Which package has the Highest Development cost? 

SELECT TITLE,DCOST FROM SOFTWARE WHERE DCOST = ( SELECT MAX(DCOST) FROM  SOFTWARE) ; 

-- 61. Which course has below AVG number of Students? 

WITH NOOFSTU AS (SELECT CAST(COUNT(PNAME) AS FLOAT ) NO_OF_STD,COURSE FROM STUDIES GROUP BY COURSE)
 SELECT * FROM NOOFSTU WHERE NO_OF_STD < (SELECT CAST(AVG(NO_OF_STD) AS DECIMAL(10,2)) FROM NOOFSTU);

-- 62. Which Package has the lowest selling cost?

SELECT TITLE,SCOST FROM SOFTWARE WHERE SCOST = (SELECT MIN(SCOST) FROM SOFTWARE);

-- 63. Who Developed the Package that has sold the least number of copies? 

SELECT PNAME,TITLE,DEVELOPIN,SOLD FROM SOFTWARE WHERE SOLD = (SELECT MIN(SOLD) FROM SOFTWARE);

-- 64. Which language has used to develop the package, which has the highest sales amount? 

WITH SALES_AMOUNT AS (SELECT DEVELOPIN,TITLE,(SCOST*SOLD) SALES_AM FROM SOFTWARE)
SELECT * FROM SALES_AMOUNT WHERE SALES_AM = (SELECT MAX(SALES_AM) FROM SALES_AMOUNT);

-- 65. How many copies of package that has the least difference between development 
--     and selling cost where sold. 

WITH DIFERENCE AS (SELECT TITLE,ABS(DCOST-SCOST) DIFF_AM,SOLD FROM SOFTWARE)
SELECT * FROM DIFERENCE WHERE DIFF_AM = (SELECT MIN((DIFF_AM)) FROM DIFERENCE);

-- 66. Which is the costliest package developed in PASCAL. 

SELECT TITLE,DEVELOPIN,DCOST FROM SOFTWARE
WHERE ( DEVELOPIN = 'PASCAL' AND DCOST = (SELECT MAX(DCOST) FROM SOFTWARE WHERE  DEVELOPIN = 'PASCAL'));

-- 67. Which language was used to develop the most number of Packages. 

WITH COUNTPKG AS (SELECT COUNT(TITLE) NO_OF_CNT,DEVELOPIN FROM SOFTWARE GROUP BY DEVELOPIN)
SELECT * FROM COUNTPKG WHERE NO_OF_CNT = (SELECT MAX(NO_OF_CNT) FROM COUNTPKG) ;

-- 68. Which programmer has developed the highest number of Packages?

WITH COUNTPRO AS (SELECT COUNT(PNAME) NO_OF_CNT,PNAME FROM SOFTWARE GROUP BY PNAME)
SELECT * FROM COUNTPRO WHERE NO_OF_CNT = (SELECT MAX(NO_OF_CNT) FROM COUNTPRO) ;

-- 69. Who is the Author of the Costliest Package? 

SELECT PNAME,TITLE,DEVELOPIN FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE);

-- 70. Display the names of the packages, which have sold less than the AVG number of copies.

SELECT TITLE FROM SOFTWARE WHERE SOLD < (SELECT AVG(SOLD) FROM SOFTWARE);

-- 71. Who are the authors of the Packages, which have recovered more than double the Development cost? 

WITH RECOVERED AS (SELECT PNAME,TITLE,DCOST,(SCOST*SOLD) SALES_AM FROM SOFTWARE)
SELECT DISTINCT PNAME FROM RECOVERED WHERE SALES_AM > 2*(DCOST) ;

-- 72. Display the programmer Name and the cheapest packages developed by them in each language. 

WITH CH_PKG AS (SELECT MIN(DCOST) DCOST,DEVELOPIN FROM SOFTWARE GROUP BY DEVELOPIN)
		SELECT S.TITLE,C.DCOST,C.DEVELOPIN FROM SOFTWARE S,CH_PKG C 
		WHERE S.DCOST = C.DCOST AND S.DEVELOPIN = C.DEVELOPIN  ;

-- 73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package. 

 WITH PRO_DEVE AS (SELECT PNAME,MIN(SCOST*SOLD) MIN_SAL,MAX(SCOST*SOLD) MAX_SAL FROM SOFTWARE GROUP BY PNAME)
SELECT P.PNAME,S.SALE_AM,S.DEVELOPIN FROM PRO_DEVE P,(SELECT PNAME,DEVELOPIN,SCOST*SOLD SALE_AM FROM SOFTWARE) S 
WHERE (P.PNAME = S.PNAME AND S.SALE_AM = P.MAX_SAL) OR (S.SALE_AM = P.MIN_SAL AND S.PNAME = P.PNAME) ;
 
-- 74. Who is the youngest male Programmer born in 1965? 

SELECT TOP 1 * FROM (SELECT PNAME,GENDER,DOB,DATEDIFF(YEAR,DOB,GETDATE()) AGE FROM PROGRAMMER) AGE_PRO
				WHERE YEAR(DOB) = '1965' AND GENDER = 'M' ORDER BY DOB ASC;

-- 75. Who is the oldest Female Programmer who joined in 1992?

SELECT  TOP 1 * FROM (SELECT PNAME,GENDER,DOB,DOJ,DATEDIFF(YEAR,DOB,GETDATE()) AGE FROM PROGRAMMER) AGE_PRO
				WHERE YEAR(DOJ) = '1992' AND GENDER = 'F' ORDER BY DOB DESC;


-- 76. In which year was the most number of Programmers born. 

WITH PROBYDOB AS (SELECT COUNT(PNAME) NO_PRO,YEAR(DOB) YEAR FROM PROGRAMMER GROUP BY YEAR(DOB))
		SELECT * FROM PROBYDOB PRO WHERE PRO.NO_PRO = (SELECT MAX(NO_PRO) FROM PROBYDOB ) ;

-- 77. In which month did most number of programmers join? 

WITH PROBYDOB AS (SELECT COUNT(PNAME) NO_PRO,MONTH(DOJ) MONTH FROM PROGRAMMER GROUP BY MONTH(DOJ))
		SELECT * FROM PROBYDOB PRO WHERE PRO.NO_PRO = (SELECT MAX(NO_PRO) FROM PROBYDOB ) ;

-- 78. In which language are most of the programmer’s proficient. 


WITH NOPROLANG AS
(SELECT COUNT(LANG) NOPRO,LANG FROM 
(SELECT PNAME,PROF1 LANG FROM PROGRAMMER
					UNION 
SELECT PNAME, PROF2 FROM PROGRAMMER) PRO_LANG GROUP BY LANG 
)
SELECT * FROM NOPROLANG WHERE NOPRO = (SELECT MAX(NOPRO) FROM NOPROLANG);  


-- 79. Who are the male programmers earning below the AVG salary of Female Programmers? 

SELECT PNAME,SALARY,GENDER FROM PROGRAMMER WHERE SALARY < (SELECT AVG(SALARY) FROM PROGRAMMER);

-- 80. Who are the Female Programmers earning more than the Highest Paid? 


SELECT PNAME,SALARY,GENDER FROM PROGRAMMER 
WHERE (SALARY = (SELECT MAX(SALARY) FROM PROGRAMMER)) AND GENDER = 'F';


-- 81. Which language has been stated as the proficiency by most of the Programmers? 


WITH NOPROLANG AS
(SELECT COUNT(LANG) NOPRO,LANG FROM 
(SELECT PNAME,PROF1 LANG FROM PROGRAMMER
					UNION 
SELECT PNAME, PROF2 FROM PROGRAMMER) PRO_LANG GROUP BY LANG 
)
SELECT * FROM NOPROLANG WHERE NOPRO = (SELECT MAX(NOPRO) FROM NOPROLANG);  


-- 82. Display the details of those who are drawing the same salary.


SELECT PNAME,SALARY FROM PROGRAMMER WHERE SALARY IN (SELECT SALARY FROM PROGRAMMER 
										     GROUP BY SALARY HAVING COUNT(SALARY)>1)
			ORDER BY SALARY ASC;


-- 83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-. 


 SELECT P.PNAME,P.GENDER,P.SALARY,S.TITLE FROM PROGRAMMER P 
 JOIN 
 SOFTWARE S ON P.PNAME = S.PNAME WHERE (P.GENDER = 'M' AND P.SALARY > 3000); 


-- 84. Display the details of the packages developed in Pascal by the Female Programmers. 

SELECT TITLE,S.PNAME,P.GENDER FROM SOFTWARE S JOIN PROGRAMMER P ON P.PNAME = S.PNAME  
WHERE S.DEVELOPIN = 'PASCAL' AND P.GENDER = 'F';


-- 85. Display the details of the Programmers who joined before 1990. 

SELECT * FROM PROGRAMMER WHERE YEAR(DOJ) <1990;

-- 86. Display the details of the Software Developed in C By female programmers of Pragathi. 


SELECT S.PNAME,S.DEVELOPIN,S.TITLE,ST.INSTITUTE FROM SOFTWARE S 
JOIN PROGRAMMER P ON P.PNAME = S.PNAME 
JOIN STUDIES ST ON ST.PNAME = P.PNAME
WHERE S.DEVELOPIN = 'C' AND P.GENDER = 'F' AND ST.INSTITUTE = 'PRAGATHI';


-- 87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise. 


SELECT COUNT(SF.TITLE) NOOFPKG,S.INSTITUTE, 
	   SUM(SF.SOLD) NOOFCOPIES, SUM(SF.SOLD*SF.SCOST) SALES_VALUE FROM PROGRAMMER P
	   JOIN STUDIES S ON S.PNAME = P.PNAME 
       JOIN SOFTWARE SF ON SF.PNAME = S.PNAME GROUP BY S.INSTITUTE;


-- 88. Display the details of the software developed in DBASE by Male Programmers, who 
--     belong to the institute in which most number of Programmers studied. 


WITH T AS (SELECT COUNT(PNAME) N,INSTITUTE FROM STUDIES GROUP BY INSTITUTE)
SELECT *  FROM T JOIN STUDIES S ON T.INSTITUTE = S.INSTITUTE JOIN PROGRAMMER P ON P.PNAME=S.PNAME 
JOIN  SOFTWARE SF ON SF.PNAME = P.PNAME 
WHERE (T.N = (SELECT MAX(N) FROM T ) AND SF.DEVELOPIN = 'DBASE' AND P.GENDER = 'M'); 


-- 89. Display the details of the software Developed by the male programmers Born 
--     before 1965 and female programmers born after 1975. 


SELECT * FROM PROGRAMMER P JOIN SOFTWARE S ON P.PNAME=S.PNAME 
WHERE ((YEAR(DOB) < 1965 AND GENDER = 'M') OR (YEAR(DOB)>1975 AND  GENDER ='F'));


-- 90. Display the details of the software that has developed in the language which is
--     neither the first nor the second proficiency of the programmers. 


SELECT S.PNAME,S.TITLE,S.DEVELOPIN,PROF1,PROF2 FROM SOFTWARE S,PROGRAMMER P WHERE 
(S.PNAME = P.PNAME AND S.DEVELOPIN <> PROF1 AND S.DEVELOPIN <> PROF2);


-- 91. Display the details of the software developed by the male students of Sabhari. 

SELECT * FROM SOFTWARE S,STUDIES ST,PROGRAMMER P 
WHERE S.PNAME = ST.PNAME AND ST.PNAME = P.PNAME AND P.GENDER = 'M' AND ST.INSTITUTE ='SABHARI';

-- 92. Display the names of the programmers who have not developed any packages. 

SELECT * FROM PROGRAMMER P FULL JOIN SOFTWARE S 
ON P.PNAME = S.PNAME WHERE S.PNAME IS NULL;

-- 93. What is the total cost of the Software developed by the programmers of Apple? 

SELECT SUM(S.DCOST) TOTALDCOT,ST.INSTITUTE FROM STUDIES ST JOIN SOFTWARE S 
ON ST.PNAME = S.PNAME WHERE ST.INSTITUTE = 'APPLE' GROUP BY ST.INSTITUTE;

-- 94. Who are the programmers who joined on the same day? 

SELECT * FROM PROGRAMMER P  
WHERE  (DOJ) IN (SELECT (DOJ) FROM PROGRAMMER 
					GROUP BY (DOJ) HAVING COUNT((DOJ))>1)
ORDER BY DOJ ASC;

-- 95. Who are the programmers who have the same Prof2? 

SELECT PNAME,PROF2 FROM PROGRAMMER 
WHERE PROF2 IN (SELECT PROF2 FROM PROGRAMMER 
			   GROUP BY PROF2 HAVING COUNT(PROF2)>1 )
ORDER BY PROF2 ;

-- 96. Display the total sales value of the software, institute wise. 


SELECT SUM(S.SOLD*S.SCOST) SALES_VALUE,ST.INSTITUTE 
FROM  STUDIES ST JOIN SOFTWARE S ON ST.PNAME = S.PNAME
GROUP BY ST.INSTITUTE; 


-- 97. In which institute does the person who developed the costliest package studied. 

SELECT S.PNAME,S.TITLE,S.DEVELOPIN,S.DCOST,ST.INSTITUTE,S.SCOST,S.SOLD
		FROM SOFTWARE S JOIN STUDIES ST ON ST.PNAME = S.PNAME 
		WHERE S.DCOST = (SELECT MAX(DCOST) FROM SOFTWARE);

-- 98. Which language listed in prof1, prof2 has not been used to develop any package. 

WITH L  AS
(SELECT PROF1 LANG FROM PROGRAMMER
UNION
SELECT PROF2 FROM PROGRAMMER)
SELECT LANG FROM L 
WHERE LANG NOT IN (SELECT DEVELOPIN FROM SOFTWARE);

-- 99. How much does the person who developed the highest selling package earn and
--     what course did HE/SHE undergo.

WITH S AS

(SELECT (SCOST*SOLD) TS,SCOST,SOLD
FROM SOFTWARE)

SELECT  SO.PNAME,P.GENDER,ST.COURSE,ST.COURSE_FEE,
	    P.SALARY,P.PROF1,P.PROF2,TS
		FROM PROGRAMMER P 
		JOIN STUDIES ST ON ST.PNAME =P.PNAME 
		JOIN SOFTWARE SO ON P.PNAME=SO.PNAME 
		JOIN S  ON S.SCOST=SO.SCOST AND S.SOLD = SO.SOLD
		WHERE TS = (SELECT MAX(TS) FROM S );

-- 100. What is the AVG salary for those whose software sales is more than 50,000/-. 


WITH S AS

(SELECT (SCOST*SOLD) TS,SCOST,SOLD
FROM SOFTWARE)

SELECT  AVG(P.SALARY) AVG_SALARY
		FROM PROGRAMMER P  
		JOIN SOFTWARE SO ON P.PNAME=SO.PNAME 
		JOIN S  ON S.SCOST=SO.SCOST AND S.SOLD = SO.SOLD
		WHERE TS > 50000;


-- 101. How many packages were developed by students, who studied in institute that 
--      charge the lowest course fee? 


WITH INSLOWFEE AS
(SELECT PNAME FROM STUDIES 
WHERE COURSE_FEE = (SELECT MIN(COURSE_FEE) FROM STUDIES) )
SELECT COUNT(TITLE) NO_PKG
FROM SOFTWARE S JOIN INSLOWFEE I ON I.PNAME = S.PNAME;


-- 102. How many packages were developed by the person who developed the 
--      cheapest package, where did HE/SHE study? 


WITH E AS (
SELECT COUNT(TITLE) CNT_TI,PNAME FROM SOFTWARE GROUP BY PNAME 
HAVING PNAME =(SELECT PNAME FROM SOFTWARE 
			   WHERE DCOST = (SELECT MIN(DCOST) FROM SOFTWARE)) 
)
SELECT E.PNAME,E.CNT_TI,ST.INSTITUTE FROM E,STUDIES ST WHERE ST.PNAME=E.PNAME;


-- 103. How many packages were developed by the female programmers earning more 
--      than the highest paid male programmer? 

SELECT COUNT(TITLE) NO_OF_PKG,S.PNAME FROM PROGRAMMER P,SOFTWARE S 
WHERE P.SALARY > (SELECT MAX(SALARY) FROM PROGRAMMER WHERE GENDER='M')
	  AND P.GENDER = 'F' AND P.PNAME = S.PNAME GROUP BY S.PNAME;


-- 104. How many packages are developed by the most experienced programmer form 
--      BDPS. 


WITH O AS
(
SELECT DATEDIFF(YEAR,DOJ,GETDATE()) EXP,
		P.PNAME PNAME,
		ST.TITLE PKG,
		S.INSTITUTE INSTITUTE 
		FROM PROGRAMMER P 
		JOIN STUDIES S ON S.PNAME = P.PNAME 
		JOIN SOFTWARE ST ON ST.PNAME = P.PNAME
		)
SELECT COUNT(PKG) NO_OF_PKG FROM O
WHERE PNAME IN (SELECT PNAME FROM O 
WHERE EXP =(SELECT MAX(EXP) FROM O WHERE INSTITUTE = 'BDPS')) AND INSTITUTE = 'BDPS';


-- TO VERIFY THE GIVEN SQL QUERY 

WITH O AS
(
SELECT DATEDIFF(YEAR,DOJ,GETDATE()) EXP,
		P.PNAME PNAME,
		ST.TITLE PKG,
		S.INSTITUTE INSTITUTE 
		FROM PROGRAMMER P 
		JOIN STUDIES S ON S.PNAME = P.PNAME 
		JOIN SOFTWARE ST ON ST.PNAME = P.PNAME
		)
SELECT *  FROM O
WHERE PNAME IN (SELECT PNAME FROM O 
WHERE EXP =(SELECT MAX(EXP) FROM O WHERE INSTITUTE = 'BDPS')) AND INSTITUTE = 'BDPS';


-- 105. List the programmers (form the software table) 
--	    and the institutes they studied. 

SELECT P.PNAME, S.INSTITUTE FROM PROGRAMMER P 
		JOIN STUDIES S ON P.PNAME = S.PNAME;

-- 106. List each PROF with the number of Programmers having that PROF and the 
--      number of the packages in that PROF. 


SELECT L.LANG ,COUNT(S.TITLE) NO_OF_PKG FROM
(SELECT DISTINCT PROF1 LANG FROM PROGRAMMER
UNION
SELECT DISTINCT PROF2 FROM PROGRAMMER) L 
JOIN SOFTWARE S ON S.DEVELOPIN = L.LANG GROUP BY L.LANG;


-- 107. List the programmer names (from the programmer table) and No. Of Packages 
--      each has developed.

SELECT COUNT(S.TITLE) NO_OF_PKG,P.PNAME FROM PROGRAMMER P 
	JOIN SOFTWARE S ON S.PNAME=P.PNAME GROUP BY P.PNAME ;




--------------------- COMPLETED-----------------