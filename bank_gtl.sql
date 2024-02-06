create database bms;

use bms;

-- Customers Personal Information

create table cust(
cust_id varchar(12),
cust_name varchar(30),
dob DATE,
gaurdian_name varchar(30),
address varchar(50),
contact_number bigint,
mail varchar(30),
gender varchar(1),
marital_status varchar(15),
identification_doc varchar(20),
id_doc_no varchar(20),
citizenship varchar(10),
constraint cust_pers_info_pk primary key(cust_id) 
);

-- Custmer Reference info
create table cust_ref_info(
cust_id varchar(12),
ref_acc_name varchar(30),
ref_acc_no bigint,
ref_acc_address varchar(50),
relation varchar(15),
constraint cust_ref_info_pk primary key(cust_id),
constraint cust_ref_info_pk foreign key(cust_id) references cust(cust_id)
);

-- Bank info
create table bank_info(
ifsc_no varchar(11),
bank_name varchar(25),
branch_name varchar(25),
constraint bank_info_pk primary key (ifsc_no)
);

-- Account Info
create table acc_info(
acc_no bigint,
cust_id varchar(12),
acc_type varchar(10),
reg_date date,
ifsc_no varchar(11),
interest decimal(7,2),
intial_deposit bigint,
constraint acc_info_pk primary key(acc_no),
constraint acc_info_pers_pk foreign key(cust_id) references cust(cust_id),
constraint acc_info_bank_pk foreign key(ifsc_no) references bank_info(ifsc_no)
);

-- SBI
INSERT INTO bank_info (ifsc_no, bank_name, branch_name)
VALUES ('SBIN0001234', 'State Bank of India', 'Mumbai Main Branch'),
       ('SBIN0005678', 'State Bank of India', 'Pune City Branch');
-- HDFC Bank
INSERT INTO bank_info (ifsc_no, bank_name, branch_name)
VALUES ('HDFC0001111', 'HDFC Bank', 'Mumbai Central Branch'),
       ('HDFC0002222', 'HDFC Bank', 'Pune Camp Branch');

-- Union Bank of India
INSERT INTO bank_info (ifsc_no, bank_name, branch_name)
VALUES ('UBIN0009876', 'Union Bank of India', 'Mumbai Fort Branch'),
       ('UBIN0006543', 'Union Bank of India', 'Pune Station Branch'),
       ('UBIN0008765', 'Union Bank of India', 'Tandalwadi Branch');

-- ICICI Bank
INSERT INTO bank_info (ifsc_no, bank_name, branch_name)
VALUES ('ICIC0003333', 'ICICI Bank', 'Mumbai Ghatkopar Branch'),
       ('ICIC0004444', 'ICICI Bank', 'Pune Aundh Branch');
       
-- Axis Bank
INSERT INTO bank_info (ifsc_no, bank_name, branch_name)
VALUES ('UTIB0005678', 'Axis Bank', 'Mumbai Bandra Branch'),
       ('UTIB0008765', 'Axis Bank', 'Pune Hinjewadi Branch');

-- Punjab National Bank (PNB)
INSERT INTO bank_info (ifsc_no, bank_name, branch_name)
VALUES ('PNB0002345', 'Punjab National Bank', 'Mumbai Andheri Branch'),
       ('PNB0007890', 'Punjab National Bank', 'Pune Kothrud Branch');

-- Canara Bank
INSERT INTO bank_info (ifsc_no, bank_name, branch_name)
VALUES ('CNRB0004567', 'Canara Bank', 'Mumbai Malad Branch'),
       ('CNRB0006543', 'Canara Bank', 'Pune Deccan Gymkhana');

-- Bank of Baroda
INSERT INTO bank_info (ifsc_no, bank_name, branch_name)
VALUES ('BARB0001234', 'Bank of Baroda', 'Mumbai Borivali Branch'),
       ('BARB0004321', 'Bank of Baroda', 'Pune Shivajinagar Branch');

-- IDBI Bank
INSERT INTO bank_info (ifsc_no, bank_name, branch_name)
VALUES ('IBKL0005678', 'IDBI Bank', 'Mumbai Lower Parel Branch'),
       ('IBKL0008765', 'IDBI Bank', 'Pune Kharadi Branch');
       
 DELIMITER //


CREATE PROCEDURE InsertCustomerRecords()
BEGIN
    -- Customer 1
    INSERT INTO cust (cust_id, cust_name, dob, gaurdian_name, address, contact_number, mail, gender, marital_status, identification_doc, id_doc_no, citizenship)
    VALUES ('CUST001', 'Amit Kumar', '1990-05-15', 'Ramesh Kumar', '123, ABC Street, Mumbai', 9876543210, 'amit.kumar@email.com', 'M', 'Married', 'Aadhar Card', '1234-5678-9876', 'Indian');

    -- Customer 2
    INSERT INTO cust (cust_id, cust_name, dob, gaurdian_name, address, contact_number, mail, gender, marital_status, identification_doc, id_doc_no, citizenship)
    VALUES ('CUST002', 'Priya Sharma', '1985-08-25', 'Rajesh Sharma', '456, XYZ Street, Pune', 8765432109, 'priya.sharma@email.com', 'F', 'Single', 'PAN Card', 'ABCDE1234F', 'Indian');

    -- Customer 3
    INSERT INTO cust (cust_id, cust_name, dob, gaurdian_name, address, contact_number, mail, gender, marital_status, identification_doc, id_doc_no, citizenship)
    VALUES ('CUST003', 'Rajiv Verma', '1982-02-10', 'Suresh Verma', '789, LMN Street, Nagpur', 7654321098, 'rajiv.verma@email.com', 'M', 'Divorced', 'Passport', 'P9876543', 'Indian');

    -- Customer 4
    INSERT INTO cust (cust_id, cust_name, dob, gaurdian_name, address, contact_number, mail, gender, marital_status, identification_doc, id_doc_no, citizenship)
    VALUES ('CUST004', 'Kavita Singh', '1995-11-30', 'Amit Singh', '101, PQR Street, Nashik', 6543210987, 'kavita.singh@email.com', 'F', 'Married', 'Voter ID', 'V234567', 'Indian');

    -- Customer 5
    INSERT INTO cust (cust_id, cust_name, dob, gaurdian_name, address, contact_number, mail, gender, marital_status, identification_doc, id_doc_no, citizenship)
    VALUES ('CUST005', 'Suresh Patel', '1988-07-20', 'Nitin Patel', '234, DEF Street, Thane', 5432109876, 'suresh.patel@email.com', 'M', 'Widowed', 'Driving License', 'DL876543', 'Indian');

    -- Customer 6
    INSERT INTO cust (cust_id, cust_name, dob, gaurdian_name, address, contact_number, mail, gender, marital_status, identification_doc, id_doc_no, citizenship)
    VALUES ('CUST006', 'Anjali Desai', '1993-04-18', 'Rahul Desai', '567, GHI Street, Mumbai', 7890123456, 'anjali.desai@email.com', 'F', 'Single', 'Aadhar Card', '5678-9012-3456', 'Indian');

    -- Customer 7
    INSERT INTO cust (cust_id, cust_name, dob, gaurdian_name, address, contact_number, mail, gender, marital_status, identification_doc, id_doc_no, citizenship)
    VALUES ('CUST007', 'Prakash Sharma', '1980-12-05', 'Mohan Sharma', '678, NOP Street, Pune', 8901234567, 'prakash.sharma@email.com', 'M', 'Married', 'PAN Card', 'FGHIJ6789K', 'Indian');

    -- Customer 8
    INSERT INTO cust (cust_id, cust_name, dob, gaurdian_name, address, contact_number, mail, gender, marital_status, identification_doc, id_doc_no, citizenship)
    VALUES ('CUST008', 'Shreya Kapoor', '1997-09-22', 'Vikram Kapoor', '789, JKL Street, Nagpur', 9012345678, 'shreya.kapoor@email.com', 'F', 'Single', 'Passport', 'P3456789', 'Indian');

    -- Customer 9
    INSERT INTO cust (cust_id, cust_name, dob, gaurdian_name, address, contact_number, mail, gender, marital_status, identification_doc, id_doc_no, citizenship)
    VALUES ('CUST009', 'Rahul Gupta', '1984-06-15', 'Alok Gupta', '890, RST Street, Nashik', 7654321098, 'rahul.gupta@email.com', 'M', 'Married', 'Voter ID', 'V567890', 'Indian');

    -- Customer 10
    INSERT INTO cust (cust_id, cust_name, dob, gaurdian_name, address, contact_number, mail, gender, marital_status, identification_doc, id_doc_no, citizenship)
    VALUES ('CUST010', 'Neha Malik', '1991-03-08', 'Raj Malik', '901, UVW Street, Thane', 6543210987, 'neha.malik@email.com', 'F', 'Divorced', 'Driving License', 'DL987654', 'Indian');
    
END //

DELIMITER ;
  
  
-- Customer 1
INSERT INTO cust_ref_info (cust_id, ref_acc_name, ref_acc_no, ref_acc_address, relation)
VALUES ('CUST001', 'Rajesh Kumar', 123456789012, '456, LMN Street, Mumbai', 'Friend');

-- Customer 2
INSERT INTO cust_ref_info (cust_id, ref_acc_name, ref_acc_no, ref_acc_address, relation)
VALUES ('CUST002', 'Sharmila Desai', 987654321098, '789, XYZ Street, Pune', 'Relative');

-- Customer 3
INSERT INTO cust_ref_info (cust_id, ref_acc_name, ref_acc_no, ref_acc_address, relation)
VALUES ('CUST003', 'Anita Verma', 567890123456, '101, ABC Street, Nagpur', 'Sibling');

-- Customer 4
INSERT INTO cust_ref_info (cust_id, ref_acc_name, ref_acc_no, ref_acc_address, relation)
VALUES ('CUST004', 'Vijay Singh', 345678901234, '234, PQR Street, Nashik', 'Colleague');

-- Customer 5
INSERT INTO cust_ref_info (cust_id, ref_acc_name, ref_acc_no, ref_acc_address, relation)
VALUES ('CUST005', 'Rita Patel', 789012345678, '567, GHI Street, Thane', 'Neighbor');

-- Customer 6
INSERT INTO cust_ref_info (cust_id, ref_acc_name, ref_acc_no, ref_acc_address, relation)
VALUES ('CUST006', 'Sunita Kapoor', 234567890123, '678, UVW Street, Mumbai', 'Friend');

-- Customer 7
INSERT INTO cust_ref_info (cust_id, ref_acc_name, ref_acc_no, ref_acc_address, relation)
VALUES ('CUST007', 'Amit Sharma', 876543210987, '789, NOP Street, Pune', 'Relative');

-- Customer 8
INSERT INTO cust_ref_info (cust_id, ref_acc_name, ref_acc_no, ref_acc_address, relation)
VALUES ('CUST008', 'Priyanka Gupta', 901234567890, '890, JKL Street, Nagpur', 'Friend');

-- Customer 9
INSERT INTO cust_ref_info (cust_id, ref_acc_name, ref_acc_no, ref_acc_address, relation)
VALUES ('CUST009', 'Neha Singh', 765432109876, '901, RST Street, Nashik', 'Relative');

-- Customer 10
INSERT INTO cust_ref_info (cust_id, ref_acc_name, ref_acc_no, ref_acc_address, relation)
VALUES ('CUST010', 'Alok Malik', 654321098765, '234, DEF Street, Thane', 'Colleague');

-- Insert entries for account information

-- Customer 1
INSERT INTO acc_info (acc_no, cust_id, acc_type, reg_date, ifsc_no, interest, intial_deposit)
VALUES (123456789012, 'CUST001', 'Savings', '2022-01-15', 'SBIN0001234', 4.5, 50000);

-- Customer 2
INSERT INTO acc_info (acc_no, cust_id, acc_type, reg_date, ifsc_no, interest, intial_deposit)
VALUES (234567890123, 'CUST002', 'Current', '2022-02-20', 'HDFC0001111', 3.2, 100000);

-- Customer 3
INSERT INTO acc_info (acc_no, cust_id, acc_type, reg_date, ifsc_no, interest, intial_deposit)
VALUES (345678901234, 'CUST003', 'Savings', '2022-03-25', 'UBIN0009876', 5.0, 75000);

-- Customer 4
INSERT INTO acc_info (acc_no, cust_id, acc_type, reg_date, ifsc_no, interest, intial_deposit)
VALUES (456789012345, 'CUST004', 'Fixed Deposit', '2022-04-10', 'ICIC0003333', 6.8, 200000);

-- Customer 5
INSERT INTO acc_info (acc_no, cust_id, acc_type, reg_date, ifsc_no, interest, intial_deposit)
VALUES (567890123456, 'CUST005', 'Savings', '2022-05-15', 'BARB0001234', 4.0, 60000);

-- Customer 6
INSERT INTO acc_info (acc_no, cust_id, acc_type, reg_date, ifsc_no, interest, intial_deposit)
VALUES (678901234567, 'CUST006', 'Current', '2022-06-20', 'UTIB0005678', 3.5, 90000);

-- Customer 7
INSERT INTO acc_info (acc_no, cust_id, acc_type, reg_date, ifsc_no, interest, intial_deposit)
VALUES (789012345678, 'CUST007', 'Savings', '2022-07-25', 'PNB0002345', 4.2, 55000);

-- Customer 8
INSERT INTO acc_info (acc_no, cust_id, acc_type, reg_date, ifsc_no, interest, intial_deposit)
VALUES (890123456789, 'CUST008', 'FD', '2022-08-10', 'CNRB0004567', 6.5, 180000);

-- Customer 9
INSERT INTO acc_info (acc_no, cust_id, acc_type, reg_date, ifsc_no, interest, intial_deposit)
VALUES (901234567890, 'CUST009', 'Current', '2022-09-15', 'BARB0004321', 3.8, 95000);

-- Customer 10
INSERT INTO acc_info (acc_no, cust_id, acc_type, reg_date, ifsc_no, interest, intial_deposit)
VALUES (987654321098, 'CUST010', 'Savings', '2022-10-20', 'IBKL0005678', 4.8, 70000);

-- Customer 11
INSERT INTO acc_info (acc_no, cust_id, acc_type, reg_date, ifsc_no, interest, intial_deposit)
VALUES (876543210987, 'CUST006', 'Savings', '2022-11-25', 'PNB0007890', 4.5, 62000);

-- Customer 12
INSERT INTO acc_info (acc_no, cust_id, acc_type, reg_date, ifsc_no, interest, intial_deposit)
VALUES (765432109876, 'CUST007', 'FD', '2022-12-10', 'BARB0001234', 7.2, 200000);

-- Customer 13
INSERT INTO acc_info (acc_no, cust_id, acc_type, reg_date, ifsc_no, interest, intial_deposit)
VALUES (654321098765, 'CUST008', 'Savings', '2023-01-15', 'HDFC0002222', 4.0, 58000);

-- Customer 14
INSERT INTO acc_info (acc_no, cust_id, acc_type, reg_date, ifsc_no, interest, intial_deposit)
VALUES (543210987654, 'CUST009', 'Current', '2023-02-20', 'UBIN0006543', 3.6, 92000);

-- Customer 15
INSERT INTO acc_info (acc_no, cust_id, acc_type, reg_date, ifsc_no, interest, intial_deposit)
VALUES (432109876543, 'CUST010', 'Savings', '2023-03-25', 'UTIB0008765', 4.8, 75000);





