create database library;
show databases;
use library;
create table branch(branch_no int primary key,
manager_id int,
branch_address varchar(30),
contact_no int);

select * from branch;
insert into branch (branch_no,manager_id,branch_address,contact_no)
values  (101,1011,'central square',962345678),
		(102,1012,'george street',967543245),
		(103,1013,'willie stargell',98765412),
		(104,1014,'N.santa anita',91192245),
		(105,1015,'la palma',765432112),
		(106,1016,'W.main st',765432147),
		(107,1017,'escandon',99345612),
		(108,1018,'vermilion',78123499),
		(109,1019,'maryland',98765432),
		(110,1010,'oakland',96549767);
        select * from branch;

create table employee(employee_id int primary key,
employee_name varchar(20),
position varchar(20),
salary int,
branch_no int,
foreign key(branch_no) references branch(branch_no) on delete cascade);
select * from employee;
insert into employee(employee_id,employee_name,position,salary,branch_no)
values(1001,'jake jude','clerk',35000,101),
	  (1002,'stefen mathew','manager',60000,102),
	  (1003,'ajay raj','assist.manager',50000,103),
	 (1004,'manu madhav','clerk',38000,102),
	 (1005,'keerthana menon','manager',63000,101),
	(1006,'athulaya krishna','clerk',36000,102),
	(1007,'shiva prasad','manager',75000,103),
	(1008,'khalid rahman','clerk',48000,101),
	(1009,'anu mohan','assist.manager',66000,101),
	(1010,'rohith sundar','assist.manager',66000,101);
    select * from employee;      
    
create table books(ISBN varchar(20) primary key,
book_title varchar(50),
category varchar(20),
rental_price int,
status enum("yes","no"),
author varchar(30),
publisher varchar(30));

select * from books;
insert into books(ISBN,book_title,category,rental_price,status,author,publisher)values
                 ('9355208618','the girl on the train','thriller',5,'no','ruskin bond','rupa'),
                 ('9781616416','pride and prejudice','romance',5,'yes','jan austen','ABDO'),
                 ('9781781259','the decision book','business',6,'yes','mikeal krogerus','hachette'),
                 ('97807475326','harry potter','fantasy',8,'no','j.k rowling','bloomsbury'),
                 ('9781471409332','the queen of nothing','fantasy',8,'yes','holy black','hot key books'),
                 ('97544325567','gone girl','thriller',7,'no','gillian flynn','crown publisher'),
                 ('987744433568','the lean startup','business',8,'yes','eric ries','crown business'),
                 ('9776544324677','how to find friends and influence people','business',7,'yes','dale carnegie','simon and schuster'),
                 ('987876554556','note book','romance',6,'yes','nichole sparke','warner books'),
                 ('995543321456','me before you','romance',10,'yes','jojo moyes','pamela dorman');
      select * from books;
      
create table customer(customer_id int primary key,
customer_name varchar(20),
customer_address varchar(30),
reg_date date);
desc customer;
insert into customer(customer_id,customer_name,customer_address,reg_date)values
		    (111,'jack parkin','2nd avenue','2021-01-22'),
            (112,'monica peter','23 central square','2021-04-04'),
            (113,'ross antony','234 oakland','2021-06-12'),
            (114,'genny davis','223 vermillion','2021-09-08'),
            (115,'raceal green','98 george street','2022-01-13'),
            (116,'tom hanks','456 illinois','2022-6-26'),
            (117,'selena gomez','284 oakland','2022-10-29'),
            (118,'zac efron','234 george street','2023-02-14'),
            (119,'brad pitt','5th avenue','2023-5-04'),
            (1110,'stella winsen','456 central square','2023-10-21');
select * from customer;


create table issuestatus(issue_id int primary key,
issued_cust int,
foreign key(issued_cust) references customer (customer_id) on delete cascade,
issued_book_name varchar(50),
issue_date date,
isbn_book varchar(20),
foreign key (isbn_book) references books (ISBN) on delete cascade);

select * from issuestatus;

insert into issuestatus (issue_id,issued_cust,issued_book_name,issue_date,isbn_book)values
                        
                        (2,112,'pride and prejudice','2021-05-21','9781616416'),
                        (3,113,'the decision book','2021-07-22','9781781259'),
                        (4,114,'genny davis','2021-12-19','97807475326'),
                        (5,115,'raceal green','2022-03-13','9781471409332'),
                        (6,116,'tom hanks','2022-07-23','97544325567'),
                        (7,117,'selena gomez','2023-02-16','987744433568'),
                        (8,118,'zac efron','2023-06-23','9776544324677'),
                        (9,119,'brad pitt','2023-09-12','987876554556'),
                        (10,1110,'stella winsen','2023-11-28','995543321456');
           select * from issuestatus;       
           
           
create table returnstatus(return_id int primary key,
						  return_cust int,
                          return_book_name varchar(30),
                          return_date date,
                          isbn_book2 VARCHAR(20),
                          foreign key(return_cust) references customer(customer_id) on delete cascade,
                          foreign key(isbn_book2) references books(ISBN)on delete cascade);
desc returnstatus;






insert into returnstatus(return_id,return_cust,return_book_name,return_date,Isbn_book2)values
                        (1,111,'the girl on the train','2021-03-30','9355208618'), 
                        (2,112,'pride and prejudice','2021-06-10','9781616416'),
                        (3,113,'the decision book','2021-08-15','9781781259'),
                        (4,114,'genny davis','2021-12-31','97807475326'),
                        (5,115,'raceal green','2022-03-25','9781471409332'),
                        (6,116,'tom hanks','2022-08-16','97544325567'),
                        (7,117,'selena gomez','2023-03-05','987744433568'),
                        (8,118,'zac efron','2023-07-10','9776544324677'),
                        (9,119,'brad pitt','2023-09-29','987876554556'),
                        (10,1110,'stella winsen','2023-12-15','995543321456');
          
select * from returnstatus;






# 1. Retrieve the book title, category, and rental price of all available books.
select book_title,category,rental_price from books where status='yes';
# 2. List the employee names and their respective salaries in descending order of salary.
select employee_name,salary from employee order by salary desc;



# 3. Retrieve the book titles and the corresponding customers who have issued those books.
select i.issued_book_name,c.customer_name from issuestatus i join customer c on i.issued_cust=c.customer_id;






# 4. Display the total count of books in each category.
 select category,count(category) as count from books group by category;
 
 # 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
select employee_name,position from employee where salary>50000;




# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
select customer_name,reg_date from customer where reg_date<'2022-01-01' and customer_id not in (select issued_cust from issuestatus);










# 7. Display the branch numbers and the total count of employees in each branch.
select branch_no,count(employee_id) as total_employees from employee group by branch_no; 

# 8. Display the names of customers who have issued books in the month of June 2023.
select c.customer_name,i.issue_date from customer c left join issuestatus i on c.customer_id=i.issued_cust 
where year(i.issue_date)=2023 and month(i.issue_date)=6;
# 9. Retrieve book_title from book table containing business
select book_title from books where category='business';





# 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
select b.branch_no,count(e.employee_id) as total_employees from branch b 
left join employee e on b.branch_no=e.branch_no group by b.branch_no having count(e.employee_id)>2;



