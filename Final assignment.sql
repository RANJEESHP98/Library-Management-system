create database Library;
use Library;

create table Branch (
Branch_no int (50) primary key,
Manager_id int (50),
Branch_address varchar (100),
contact_no varchar (10) ); 


insert into branch (Branch_no,Manager_id,Branch_address,contact_no)
values (01,001,'Thrissur',992431840),
(02,003,'Ernakulam',9746795578),
(03,004,'Thiruvala',9846992314),
(04,005,'Thiruvanathapuram',9994612821),
(05,006,'Kottayam',8315484510);

select * from branch;

insert into branch (Branch_no,Manager_id,Branch_address,contact_no)
values (06,007,'Alappuzha',9396917495);
create table Employee (
employee_id int (50) primary key,
Emp_name varchar (25),
position varchar (25),
salary decimal (10,2),
Branch_no int,
foreign key (branch_no) references branch (branch_no));

INSERT INTO Employee (employee_id, Emp_name, position, Salary, Branch_no)
VALUES 
(01, 'Amal', 'Library Assist', 15000.00, 01),
(02, 'Abhijith', 'Clerk', 18000.00, 02),
(03, 'Akhil', 'Pager', 12000.00, 03),
(04, 'Salman', 'Cataloger', 22000.00, 04),
(05, 'Sachin', 'Collection Manager', 28000.00, 05);

INSERT INTO Employee (employee_id, Emp_name, position, Salary, Branch_no)
values (06,'Sanju','Auditor','36000',06);

update employee
set salary = '52000'
where employee_id = 05;

 select * from employee;
 

create table Books (
ISBN varchar (20) primary key,
Book_title  varchar (250),
category varchar (100),
Rental_price  decimal (10,2),
S_tatus varchar (10) 
check (s_tatus in ('yes' , 'No')),
Author varchar (150),
Publisher varchar (150));


insert into books (ISBN ,Book_title,category,Rental_price ,S_tatus, Author,Publisher)
values (9780135166307,'Hands-On Machine Learning with Scikit-Learn','Machine Learning',950,'yes', 'Aurélien Géron','OReilly Media'),
(9780062316097,'The Lean Startup','Business / Entrepreneurship',650,'No','Eric Ries','Crown Business'),
(9781119690726,'Accounting All-in-One for Dummies',' Accounting / Finance',750,'Yes','Kenneth W. Boyd','For Dummies'),
(9781501124020,'Grit: The Power of Passion and Perseverance','Self-Development',520,'yes','Angela Duckworth',' Scribner'),
(9780262033848,'History of beauty',' History',1200,'No','Umberto eco','The MIT Press');

insert into books (ISBN ,Book_title,category,Rental_price ,S_tatus, Author,Publisher)
values
(9780262033849,'The Immortals of Meluha','History',20,'yes','Amish Tripathi','Quercus Publishing');


select * from BOOKS;

set sql_safe_updates = 0;


create table Customer (
customer_id int (50) primary key,
customer_name varchar (25),
customer_address varchar (150),
Reg_date date );

insert into customer (customer_id,customer_name ,customer_address ,Reg_date)
values (01,'Bob','Kizhakepadam (h)','2022.02.21'),
(02,'Charlie','kochi palluruthy (h)','2021.02.21'),
(03,'Alice','Kacherapady (h)','2023.08.20'),
(04,'Shegaran','Poochunipadam (h)','2019.03.18'),
(05,'Siavn','Thattumpurathparambil(h)','2019.02.18');

select * from customer;


create table Issuestatus (
issue_id int (50) primary key,
issued_cust int,
issued_book_name varchar (150),
issue_date date,
isbn_book varchar (50),
foreign key (issued_cust) references customer (customer_id),
foreign key (isbn_book) references books (isbn));

insert into issuestatus (issue_id ,issued_cust ,issued_book_name ,issue_date ,isbn_book)
values (1001,01,'Hands-On Machine Learning with Scikit-Learn','2025.02.12',9780135166307),
(1002, 02,'The Lean Startup','2025.01.20', 9780062316097),
(1003,03,'Accounting All-in-One for Dummies','2025.01.30',9781119690726),
(1004,04,'The Immortals of Meluha','2025.01.01',9781501124020),
(1005,05,'History of beauty','2025.01.05',9780262033848);

select * from issuestatus;

create table Returnstatus (
Return_id int (50) primary key,
Return_cust int (50),
Return_book_name varchar (150),
Return_date date,
isbn_book2 varchar (50),
foreign key (isbn_book2) references books (isbn));


insert into Returnstatus (Return_id,Return_cust,Return_book_name,Return_date,isbn_book2)
values (1001,01, 'Hands-On Machine Learning with Scikit-Learn','2025.02.18',9780135166307),
(1002,02,'The Lean Startup','2025.03.10',9780062316097),
(1003,03,'Accounting All-in-One for Dummies','2025.02.28',9781119690726),
(1004,04,'The Immortals of Meluha','2025.02.01',9781501124020),
(1005,05,'History of beauty','2025.02.05',9780262033848);


select * from returnstatus;

select book_title, category,rental_price
from books
where s_tatus = 'yes';

select emp_name,salary
from employee
order by salary desc;

select b.book_title,c.customer_name
from issuestatus i
join books b on i.isbn_book = b.isbn
join customer c on i.issued_cust = c.customer_id;


select category,count(*) as totalbooks
from books
group by category;	


select emp_name,position
from employee
where salary > 50000;


select  c. customer_name
from customer c
left join issuestatus i on c. customer_id = i.issued_cust
where c. reg_date < '2022.01.01'
and i.issued_cust is null;


select b.branch_no, count(e.employee_id) as employeecount
from branch b
left join employee e on b.branch_no = e.branch_no
group by b.branch_no;	


select distinct customer_name
from customer c
left join issuestatus i on c.customer_id =i.issued_cust
where i.issue_date between '2023.06.01' and '2023.06.30';

select book_title 
from books
where book_title ='%History%';

select branch_no, count(*) as employeecount
from employee
group by branch_no
having count(*)>5;



select e.emp_name,b.branch_address
from employee e
join branch b on e.employee_id = b.manager_id;



select c.customer_name
from issuestatus i
join books b on i.isbn_book = b.isbn
join customer c on i. issued_cust = c.customer_id
where b.rental_price > 25;

























