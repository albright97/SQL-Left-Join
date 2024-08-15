create database my_demo_database2;
use my_demo_database2;
create table customer
(
custid VARCHAR(6),
fname VARCHAR(30),
mname VARCHAR(30),
ltname VARCHAR(30),
city VARCHAR(15),
mobileno VARCHAR(10),
occupation VARCHAR(10),
dob DATE,
CONSTRAINT customer_custid_pk primary key(custid)
);
show tables;
create table branch
(
bid varchar(6),
bname varchar(30),
bcity varchar(30),
constraint branch_bid_pk primary key(bid)
);
show tables;
create table account
(
acnumber varchar(10),
custid varchar(6),
bid varchar(6),
opening_balance INT(7),
aod DATE,
atype varchar(7),
astatus varchar(20),
constraint account_acnumber_pk primary key(acnumber),
constraint account_custid_fk foreign key(custid) references customer(custid),
constraint account_bid_fk foreign key(bid) references branch(bid)
);
show tables;
select * from customer;
INSERT INTO customer VALUES ('C00001', 'John', 'A.', 'Doe', 'New York', '1234567890', 'Engineer', '1985-02-15');
INSERT INTO customer VALUES ('C00002', 'Jane', 'B.', 'Smith', 'Los Angeles', '0987654321', 'Doctor', '1990-06-25');
INSERT INTO customer VALUES ('C00003', 'Michael', 'C.', 'Johnson', 'Chicago', '1122334455', 'Lawyer', '1982-11-08');
INSERT INTO customer VALUES ('C00004', 'Emily', 'D.', 'Davis', 'Houston', '2233445566', 'Teacher', '1995-04-12');
INSERT INTO customer VALUES ('C00005', 'David', 'E.', 'Martinez', 'Phoenix', '3344556677', 'Accountant', '1988-09-30');
INSERT INTO customer VALUES ('C00006', 'Emma', 'F.', 'Garcia', 'Philadelphia', '4455667788', 'Nurse', '1993-07-19');
INSERT INTO customer VALUES ('C00007', 'Daniel', 'G.', 'Lee', 'San Antonio', '5566778899', 'Architect', '1987-01-22');
INSERT INTO customer VALUES ('C00008', 'Olivia', 'H.', 'Miller', 'San Diego', '6677889900', 'Scientist', '1992-03-05');
INSERT INTO customer VALUES ('C00009', 'Lucas', 'I.', 'Wilson', 'Dallas', '7788990011', 'Designer', '1989-12-17');
INSERT INTO customer VALUES ('C00010', 'Sophia', 'J.', 'Moore', 'San Jose', '8899001122', 'Consultant', '1994-10-10');

select * from customer;
INSERT INTO branch VALUES ('B0001', 'Main Branch', 'New York');
INSERT INTO branch VALUES ('B0002', 'Westside Branch', 'Los Angeles');
INSERT INTO branch VALUES ('B0003', 'North Branch', 'Chicago');
INSERT INTO branch VALUES ('B0004', 'South Branch', 'Houston');
INSERT INTO branch VALUES ('B0005', 'Eastside Branch', 'Phoenix');
INSERT INTO branch VALUES ('B0006', 'Central Branch', 'Philadelphia');
INSERT INTO branch VALUES ('B0007', 'River Branch', 'San Antonio');
INSERT INTO branch VALUES ('B0008', 'Coastal Branch', 'San Diego');
INSERT INTO branch VALUES ('B0009', 'Plaza Branch', 'Dallas');
INSERT INTO branch VALUES ('B0010', 'Tech Branch', 'San Jose');
select * from branch;

ALTER TABLE account MODIFY acnumber VARCHAR(10);
ALTER TABLE account MODIFY astatus VARCHAR(10);

SELECT * FROM account WHERE acnumber = 'ACC00001';
DELETE FROM account WHERE acnumber = 'ACC00001';
INSERT IGNORE INTO account VALUES ('ACC00001', 'C00001', 'B0001', 5000, '2023-01-15', 'Savings', 'Active');

INSERT INTO account VALUES ('ACC00001', 'C00001', 'B0001', 5000, '2023-01-15', 'Savings', 'Active');
INSERT INTO account VALUES ('ACC00002', 'C00002', 'B0002', 10000, '2022-05-25', 'Current', 'Active');
INSERT INTO account VALUES ('ACC00003', 'C00003', 'B0003', 7500, '2021-08-10', 'Savings', 'Inactive');
INSERT INTO account VALUES ('ACC00004', 'C00004', 'B0004', 3000, '2023-04-12', 'Current', 'Active');
INSERT INTO account VALUES ('ACC00005', 'C00005', 'B0005', 12000, '2022-12-01', 'Savings', 'Active');
INSERT INTO account VALUES ('ACC00006', 'C00006', 'B0006', 9000, '2021-07-19', 'Savings', 'Active');
INSERT INTO account VALUES ('ACC00007', 'C00007', 'B0007', 4000, '2023-03-01', 'Current', 'Inactive');
INSERT INTO account VALUES ('ACC00008', 'C00008', 'B0008', 2000, '2022-10-15', 'Savings', 'Active');
INSERT INTO account VALUES ('ACC00009', 'C00009', 'B0009', 6500, '2023-06-05', 'Current', 'Active');
INSERT INTO account VALUES ('ACC00010', 'C00010', 'B0010', 8000, '2022-11-20', 'Savings', 'Active');

SELECT * FROM account WHERE acnumber = 'ACC00001';
DELETE FROM account WHERE acnumber = 'ACC00001';
DESCRIBE account;
INSERT INTO account VALUES ('ACC00001', 'C00001', 'B0001', 5000, '2023-01-15', 'Savings', 'Active');
INSERT INTO account VALUES ('ACC00002', 'C00002', 'B0002', 10000, '2022-05-25', 'Current', 'Active');
INSERT INTO account VALUES ('ACC00003', 'C00003', 'B0003', 7500, '2021-08-10', 'Savings', 'Inactive');
INSERT INTO account VALUES ('ACC00004', 'C00004', 'B0004', 3000, '2023-04-12', 'Current', 'Active');
INSERT INTO account VALUES ('ACC00005', 'C00005', 'B0005', 12000, '2022-12-01', 'Savings', 'Active');
INSERT INTO account VALUES ('ACC00006', 'C00006', 'B0006', 9000, '2021-07-19', 'Savings', 'Active');
INSERT INTO account VALUES ('ACC00007', 'C00007', 'B0007', 4000, '2023-03-01', 'Current', 'Inactive');
INSERT INTO account VALUES ('ACC00008', 'C00008', 'B0008', 2000, '2022-10-15', 'Savings', 'Active');
INSERT INTO account VALUES ('ACC00009', 'C00009', 'B0009', 6500, '2023-06-05', 'Current', 'Active');
INSERT INTO account VALUES ('ACC00010', 'C00010', 'B0010', 8000, '2022-11-20', 'Savings', 'Active');

SHOW TRIGGERS LIKE 'account';
DROP TABLE IF EXISTS account;

CREATE TABLE account
(
    acnumber VARCHAR(10),
    custid VARCHAR(6),
    bid VARCHAR(6),
    opening_balance INT(7),
    aod DATE,
    atype VARCHAR(7),
    astatus VARCHAR(10),
    CONSTRAINT account_acnumber_pk PRIMARY KEY(acnumber),
    CONSTRAINT account_custid_fk FOREIGN KEY(custid) REFERENCES customer(custid),
    CONSTRAINT account_bid_fk FOREIGN KEY(bid) REFERENCES branch(bid)
);
show tables;
select * from account;

INSERT INTO account VALUES ('ACC00001', 'C00001', 'B0001', 5000, '2023-01-15', 'Savings', 'Active');
INSERT INTO account VALUES ('ACC00002', 'C00002', 'B0002', 10000, '2022-05-25', 'Current', 'Active');
INSERT INTO account VALUES ('ACC00003', 'C00003', 'B0003', 7500, '2021-08-10', 'Savings', 'Inactive');
INSERT INTO account VALUES ('ACC00004', 'C00004', 'B0004', 3000, '2023-04-12', 'Current', 'Active');
INSERT INTO account VALUES ('ACC00005', 'C00005', 'B0005', 12000, '2022-12-01', 'Savings', 'Active');
INSERT INTO account VALUES ('ACC00006', 'C00006', 'B0006', 9000, '2021-07-19', 'Savings', 'Active');
INSERT INTO account VALUES ('ACC00007', 'C00007', 'B0007', 4000, '2023-03-01', 'Current', 'Inactive');
INSERT INTO account VALUES ('ACC00008', 'C00008', 'B0008', 2000, '2022-10-15', 'Savings', 'Active');
INSERT INTO account VALUES ('ACC00009', 'C00009', 'B0009', 6500, '2023-06-05', 'Current', 'Active');
INSERT INTO account VALUES ('ACC00010', 'C00010', 'B0010', 8000, '2022-11-20', 'Savings', 'Active');

select * from account;

select count(custid) from customer;

select * from customer
left join account
on customer.custid = account.custid;

select * from account
left join customer
on account.custid = customer.custid;

