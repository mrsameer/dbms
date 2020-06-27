drop database exam;
create database exam;
use exam;
CREATE TABLE DEPARTMENT
( Dname VARCHAR(15) NOT NULL,
Dnumber INT NOT NULL,
Mgr_ssn CHAR(9) NOT NULL,
Mgr_start_date DATE,
PRIMARY KEY (Dnumber),
UNIQUE (Dname));

CREATE TABLE EMPLOYEE
( Fname VARCHAR(15) NOT NULL,
Mname CHAR,
Lname VARCHAR(15) NOT NULL,
Ssn CHAR(9) NOT NULL,
Bdate DATE,
Address VARCHAR(30),
Sex CHAR,
Salary DECIMAL(10,2),
Super_ssn CHAR(9),
Dno INT NOT NULL,
PRIMARY KEY (Ssn),
FOREIGN KEY (Super_ssn) REFERENCES EMPLOYEE(Ssn),
FOREIGN KEY (Dno) REFERENCES DEPARTMENT(Dnumber) );

alter table DEPARTMENT add FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn);

CREATE TABLE DEPT_LOCATIONS
( Dnumber INT NOT NULL,
Dlocation VARCHAR(15) NOT NULL,
PRIMARY KEY (Dnumber, Dlocation),
FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber) );

CREATE TABLE PROJECT
( Pname VARCHAR(15) NOT NULL,
Pnumber INT NOT NULL,
Plocation VARCHAR(15),
Dnum INT NOT NULL,
PRIMARY KEY (Pnumber),
UNIQUE (Pname),
FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber) );

CREATE TABLE WORKS_ON
( Essn CHAR(9) NOT NULL,
Pno INT NOT NULL,
Hours DECIMAL(3,1) NOT NULL,
PRIMARY KEY (Essn, Pno),
FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn),
FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber) );

CREATE TABLE DEPENDENT
( Essn CHAR(9) NOT NULL,
Dependent_name VARCHAR(15) NOT NULL,
Sex CHAR,
Bdate DATE,
Relationship VARCHAR(8),
PRIMARY KEY (Essn, Dependent_name),
FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn) );


alter table department modify mgr_ssn char(9) null;

insert  into department(dname,dnumber) values('Research',5);
insert into department(dname,dnumber) values('Administration',4);
insert into department(dname,dnumber) values('Headquarters',1);

insert into employee(fname,mname,lname,ssn,bdate,address,sex,salary,super_ssn,dno) values('James','E','Borg','888665555','10-nov-1937','450 Stone, Houston,TX','M',55000,null,1);
insert into employee(fname,mname,lname,ssn,bdate,address,sex,salary,super_ssn,dno) values('Franklin','T','Wong','333445555','08-dec-1955','638 Voss, Houston,TX','F',40000,'888665555',5);
insert into employee(fname,mname,lname,ssn,bdate,address,sex,salary,super_ssn,dno) values('John','B','Smith','123456789','09-jan-1965','731 Fondren, Houston,TX','M',30000,'333445555',5);
insert into employee(fname,mname,lname,ssn,bdate,address,sex,salary,super_ssn,dno) values('Jennifer','S','Wallace','987654321','20-jun-1941','291 Berry, Bellaire,TX','F',43000,'888665555',4);
insert into employee(fname,mname,lname,ssn,bdate,address,sex,salary,super_ssn,dno) values('Alicia','J','Zelaya','999887777','19-jan-1968','3321 Castle, Spring,TX','F',25000,'987654321',4);
insert into employee(fname,mname,lname,ssn,bdate,address,sex,salary,super_ssn,dno) values('Ramesh','K','Narayan','666884444','15-sep-1962','975 Fire Oak, Humble,TX','M',38000,'333445555',5);
insert into employee(fname,mname,lname,ssn,bdate,address,sex,salary,super_ssn,dno) values('Joyce','A','English','453453453','31-jul-1972','5631 Rice, Houston,TX','F',25000,'333445555',5);
insert into employee(fname,mname,lname,ssn,bdate,address,sex,salary,super_ssn,dno) values('Ahmad','V','Jabbar','987987987','29-mar-1969','980 Dallas, Houston,TX','M',25000,'987654321',4);


update department set mgr_ssn='333445555', mgr_start_date='22-may-88' where dnumber=5;
update department set mgr_ssn='987654321', mgr_start_date='01-jan-95' where dnumber=4;
update department set mgr_ssn='888665555', mgr_start_date='19-jun-81' where dnumber=1;
alter table department modify mgr_ssn char(9) not null;

insert  into dept_locations values(1,'Houston');
insert into dept_locations values(4,'Stafford');
insert into dept_locations values(5,'Bellaire');
insert into dept_locations values(5,'Sugarland');
insert into dept_locations values(5,'Houston');



insert  into project values('ProductX',1,'Bellaire',5);
insert into project values('ProductY',2,'Sugarland',5);
insert into project values('ProductZ',3,'Houston',5);
insert into project values('Computarization',10,'Stafford',4);
insert into project values('Reorganization',20,'Houston',1);
insert into project values('Newbenefits',30,'Stafford',4);


insert  into dependent values('333445555','Allice','F','05-apr-86','Daughter');
insert into dependent values('333445555','Theodore','M','25-oct-83','Son');
insert into dependent values('333445555','Joy','F','03-may-58','Spouse');
insert into dependent values('987654321','Abner','M','28-feb-42','Spouse');
insert into dependent values('123456789','Michael','M','04-jan-88','Son');
insert into dependent values('123456789','Allice','F','30-dec-88','Daughter');
insert into dependent values('123456789','Elizabeth','F','05-may-67','Spouse');





insert  into works_on values('123456789',1,32.5);
insert into works_on values('123456789',2,7.5);
insert into works_on values('666884444',3,40.0);
insert into works_on values('453453453',1,20.0);
insert into works_on values('453453453',2,20.0);
insert into works_on values('333445555',2,10.0);
insert into works_on values('333445555',3,10.0);
insert into works_on values('333445555',10,10.0);
insert into works_on values('333445555',20,10.0);
insert into works_on values('999887777',30,30.0);
insert into works_on values('999887777',10,10.0);
insert into works_on values('987987987',10,35.0);
insert into works_on values('987987987',30,5.0);
insert into works_on values('987654321',30,20.0);
insert into works_on values('987654321',20,15.0);
insert into works_on values('888665555',20,null);
