create table employee(
ID INT IDENTITY(1,1) NOT NULL ,
UserID AS 'KADBBEMP-' + RIGHT('00000000' + CAST(ID AS VARCHAR(8)), 2) PERSISTED,
NIC varchar(11)  primary key,
firstName varchar(30),
lastName varchar(30),
userName varchar(15) unique,
userPassword varchar(15),
empMode varchar(15),
regDate date not null);

create table DeletedAccounts(
UserID varchar(30) not null,
NIC varchar(11) not null,
firstName varchar(30) not null,
lastName varchar(30) not null,
empMode varchar(15) not null,
description varchar(150)
);

drop table DeletedAccounts;

ALTER TABLE employee CHANGE
regDate  new_name date;

alter table employee
add empEmail varchar(50);

alter table employee
add RegDate date;

alter table employee
add Telephone varchar(10);

create table Donar(
ID INT IDENTITY(1,1) NOT NULL  ,
DonarID AS 'DONAR-' + RIGHT('00000000' + CAST(ID AS VARCHAR(8)), 8) PERSISTED, 
NIC varchar(11) primary key,
FirstName varchar(30),
LastName varchar(30),
Telephone int not null,
DonarAddress varchar(50),
DOB date not null,
Gender varchar(1) not null,
EMail varchar(50) not null,
);


create table DonarExpression(
DonarNIC varchar(11),
DonatedDate date not null,
Diabetes varchar(3) not null,
Pressure varchar(3) not null,
HIV varchar(3) not null,
Heart_Disease varchar(3) not null,
Paralysis varchar(3) not null,
Kidney_Disease varchar(3) not null,
Donated_Blood_Before varchar(3) not null,
Had_Surgery varchar(3) not null,
Liver_Disease varchar(3) not null,
Vaccinated varchar(3) not null,
Dengue varchar(3) not null,
Cancer varchar(3) not null,
Athor_Illness varchar(3) not null
);

alter table DonarExpression 
add foreign key (DonarNIC) 
REFERENCES Donar(NIC);



create table DonarFamilyMembers(
DonarNIC varchar(11),
MemberFirstName varchar(30) not null,
MemberLastName varchar(30) not null,
MemberGender varchar(1) not null,
);

alter table DonarFamilyMembers
add ID INT IDENTITY(1,1);



alter table DonarFamilyMembers
add foreign key (DonarNIC) references Donar (NIC);


ALTER TABLE Donar ALTER COLUMN Telephone varchar(11);


create table DonarEligibility(
DonarNIC varchar(11) not null,
DDate date not null,
ClerkEligibility varchar(11) not null default 'NOTCHECKED',
LabEligibility varchar(11) default 'NOTCHECKED',
Pre_donationEligibility varchar(11) default 'NOTCHECKED'
);

drop table DonarEligibility;

alter table DonarEligibility
add foreign key (DonarNIC) 
references Donar(NIC);

alter table DonarEligibility
add thedaniAkka varchar(5);

alter table DonarEligibility
add Pre_donationEligibility varchar(10) default 'NOTCHECKED';

/*transferd blood table -> blood table*/



select * from DonarExpression;


create table Token(
NIC varchar(11) not null,
TokenDate date not null,
TokenNumber int not null);



alter table Token
add foreign key (NIC) references Donar (NIC);

select * from Donar;
insert into Donar(NIC,FirstName,LastName,Telephone,DonarAddress,DOB,Gender,EMail) values ('111','saman','kumara','2122','we21','1233-11-1','M','fwe@.com');
insert into employee (NIC,firstName,lastName,userName,userPassword,empMode,regDate) values ('11321141','sam23ddan','kumaddadra','a4das3daa','aawsdd','clderk','1998-2-1');

select * from employee;
select * from Donar;
select * from Token;
select * from DonarExpression;
select * from DonarEligibility;
select * from DonarFamilyMembers;
select * from PredonationEligibility;
select * from bloodunit;
select * from DeletedAccounts;
select * from LIPID_PROFILE;
select * from HIV;
select * from HEPATITISB;
select * from SYPHILIS;
select * from WESTNILEVIRUS;
select * from CYTOMEGALOVIRUS;
select * from CHAGAS;
select * from Labtest;
select * from BloodTable;
select * from HospitalTransfer;

TRUNCATE TABLE  HospitalTransfer;

delete from Donar where ID in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29);

update bloodunit
set Transfered = 'NO'
where ID  in(13,14,15,16,17,18);

update bloodunit 
set bloodtype = 'A+' 
where ID = 5;

create table HospitalTransfer(
Hname varchar(50) not null,
BloodType varchar(10)not null,
NoOfUnits int not null,
TDate date not null
);

drop table HospitalTransfer;



update BloodTable
set BloodStock = 12
where bloodType = 'A+';


Select bloodtype from bloodunit where bloodunitId =' KADBBBUT-08 'AND LabEligibility =(select LabEligibility from bloodunit where LabEligibility ='NOTCHECKED')

alter table bloodunit
add LabEligibility varchar(11) default 'NOTCHECKED';

alter table bloodunit
add Transfered varchar(11) default 'NO';

delete from PredonationEligibility where DonarNIC = '43';

update DonarEligibility
set Pre_donationEligibility ='NOTCHECKED'
where DonarNIC = '43';



delete from Donar where ID = '4';
delete from Donar where ID = '35';
delete from Donar where ID = '13';
delete from Donar where ID = '17';
delete from Donar where ID = '16';
delete from Donar where ID = '7';
delete from Donar where ID = '5';
delete from Donar where ID = '44';
delete from Donar where ID = '45';
delete from Donar where ID = '46';
delete from Donar where ID = '47';
delete from Donar where ID = '19';
delete from Donar where ID = '21';
delete from Donar where ID = '18';

alter table PredonationEligibility
add primary key (DonarNIC,DDate);

alter table PredonationEligibility
add bloodType varchar(3);

alter table PredonationEligibility 
drop column bloodType;



delete from Token where Status = 'SERVING';

update Token 
set Status = 'NEW' 
where NIC = '4';

alter table PredonationEligibility
drop column bloodType;


update bloodunit set Transfered ='YES' where bloodtype ='A+' and ID =(select min(ID) from bloodunit where Transfered ='NO')
select * from bloodunit;

create table bloodunit(
ID INT IDENTITY(1,1) NOT NULL ,
bloodunitId AS 'KADBBBUT-' + RIGHT('00000000' + CAST(ID AS VARCHAR(8)), 2) PERSISTED ,
DonarNIC varchar(11) foreign key REFERENCES Donar(NIC),
DonatedDate date,
bloodtype varchar(3),
primary key(bloodunitId)
);



create table PredonationEligibility(
DonarNIC varchar(11) not null,
DDate date not null,
age int not null,
temp int not null,
pulses int not null,
systolicbp int not null,
diastolicbp int not null,
dweight decimal not null,
hemoglobin decimal not null,
bloodType varchar(3) not null,
primary key(DonarNIC,DDate)
);

select * from PredonationEligibility where DonarNIC = '321';
select * from  DonarEligibility where DonarNIC = '321';
delete from PredonationEligibility where  DonarNIC = '1234' and DDate = '2021-05-07';

alter table PredonationEligibility
add foreign key (DonarNIC) references Donar (NIC);


ALTER TABLE PredonationEligibility CHANGE
bloodType  BloodType varchar(11);



insert into BloodTable values('O-',0);

create table LIPID_PROFILE(
buID varchar(11) foreign key (buID) REFERENCES bloodunit(bloodunitId),
tDate date not null,
SerumCholesterolTotal int not null,
SerumTriglycerides int not null,
CholesterolDL int not null,
CholesterolNonHDL int not null,
CholesterolLDL int not null,
CholesterolVLDL int not null,
CHOLHDL int not null,
LDLHDL float not null

);

create table HIV(
buID varchar(11) foreign key (buID) REFERENCES bloodunit(bloodunitId),
tDate date not null,
GFREstimated int not null,
HIV1 int not null,
HIV2 int not null,
HIVRNA int not null);

create table  HEPATITISB(
buID varchar(11) foreign key (buID) REFERENCES bloodunit(bloodunitId),
tDate date not null,
HBSurfaceAntigen varchar(20) not null);

create table  SYPHILIS(
buID varchar(11) foreign key (buID) REFERENCES bloodunit(bloodunitId),
tDate date not null,
NONSPECIFICRDR varchar(20) not null,
SPECIFICRDR varchar(20) not null
);

create table WESTNILEVIRUS(
buID varchar(11) foreign key(buID) references bloodunit(bloodunitID),
PCRSerum int not null,
PCRCSF int not null,
WNVSpecificIgMSerum int not null,
WNVSpecificIgMCSF int not null);

create table CYTOMEGALOVIRUS(
buID varchar(11) foreign key(buID) references bloodunit(bloodunitID),
CMVIgG varchar(20) not null,
CMVIgM varchar(20) not null,
CMVIgG_Avidity varchar(20) not null);

create table CHAGAS(
buID varchar(11) foreign key(buID) references bloodunit(bloodunitID),
MNCTaqMan varchar(20) not null,
TCZTaqMan varchar(20) not null);

create table Labtest(
buID varchar(11) foreign key(buID) references bloodunit(bloodunitID),
DonarNIC varchar(11) foreign key REFERENCES Donar(NIC),
DonatedDate date not null,
HIV varchar(10) not null,
HEPATITIS varchar(20) not null,
SYPHILIS varchar(20) not null,
PANTESTS varchar(20) not null 
);

create table BloodTable(
bloodType varchar(3) not null,
BloodStock int 
);

update BloodTable
set BloodStock = 12
where bloodType = 'A+';
















