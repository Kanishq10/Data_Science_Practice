USE SYS;

CREATE TABLE STUDENT 
(
REG_ID INT,
NAME VARCHAR(255),
CITY VARCHAR(255),
MARKS INT
);

INSERT INTO STUDENT(REG_ID,NAME,CITY,MARKS) VALUES (1001,'ANKIT','AMBALA',98);
INSERT INTO STUDENT(REG_ID,NAME,CITY,MARKS) VALUES (1002,'KANISHQ','CHANDIGARH',99);
INSERT INTO STUDENT(REG_ID,NAME,CITY,MARKS) VALUES (1003,'HARSH','MOHALI',100);
INSERT INTO STUDENT(REG_ID,NAME,CITY,MARKS) VALUES (1004,'RAM','AMBALA',948);
INSERT INTO STUDENT(REG_ID,NAME,CITY,MARKS) VALUES (1005,'GHOST','GURGAON',398);
SELECT * FROM STUDENT;

SELECT * FROM STUDENT WHERE NAME='RAM' OR CITY='CHANDIGARH';
SELECT * FROM STUDENT ORDER BY REG_ID ASC;
