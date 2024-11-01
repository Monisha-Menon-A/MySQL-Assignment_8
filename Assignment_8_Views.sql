create database Product;
use Product;

create table customer (customer_id int primary key,
first_name varchar(50),
last_name varchar(50),
email varchar(50),
phone_no varchar(50),
address varchar(50),
city varchar(50),
state varchar(50),
zipcode varchar(50),
country varchar(50));
desc customer;

insert into customer(customer_id, first_name, last_name, email,
phone_no,address,city,state,zipcode,country)
values(1, 'Lisha', 'Thomas', 'lishathomas@example.com', 78955675,
      'BerlingStreet', 'Mumbai','Maharahtra','1234','India'),
      (2, 'Anu', 'Samson', 'anusamson@example.com', 78955676,
      'AnandNagar', 'Mumbai','Maharahtra','1235','India'),
      (3, 'David', 'Gomez', 'davidgomez@example.com', 78955677,
      'RosscotLane', 'LosAngeles','California','2314','USA'),
      (4, 'William', 'Manual', 'williammanual@example.com', 78955678,
      '32BStreet', 'SantaAna','California','2316','USA'),
      (5, 'Alan', 'Stosky', 'alanstosky@example.com', 78955679,
      '33CStreet', 'LosAngeles','California','2315','USA'),
      (6, 'Fred', 'Dizooz', 'freddizooz@example.com', 78955680,
      '69CStreet', 'LosAngeles','California','2317','USA'),
      (7, 'Catherine', 'Mathew', 'catherinemathew@example.com', 78955681,
      '72DStreet', 'LosAngeles','California','2318','USA'),
      (8, 'Zavy', 'Mathew', 'zavymathew@example.com', 78955682,
      '87MStreet', 'LosAngeles','California','2319','USA'),
      (9, 'Anand', 'Singh', 'anandsingh@example.com', 78955683,
      'DaffodilStreet', 'Dallupura','Delhi','1236','India'),
      (10, 'Divya', 'Sethunath', 'divyasethunath@example.com', 78955684,
      'UdaypuramRoad', 'Trivandrum','Kerala','1237','India');
select* from customer;

/* Create a view named customer_info for the Customer table that displays 
Customer’s Full name and email address. Then perform the SELECT operation 
for the customer_info view*/
CREATE VIEW customer_info AS
SELECT 
concat(first_name,' ',last_name) as full_name, email
FROM customer;
select* from customer_info;

/*Create a view named US_Customers that displays customers located in the US*/
CREATE VIEW US_customers AS
SELECT *
FROM customer where country='USA';
select* from US_customers;

/*Create another view named Customer_details with columns full name
(Combine first_name and last_name), email, phone_no, and state*/
CREATE VIEW customer_details AS
SELECT 
concat(first_name,' ',last_name) as full_name, email, phone_no,state
FROM customer;
select* from customer_details;

/*Update phone numbers of customers who live in California for Customer_details view*/
UPDATE customer_details SET phone_no = '6556787698' where email = 'davidgomez@example.com';  
UPDATE customer_details SET phone_no = '6556787699' where email = 'williammanual@example.com';  
UPDATE customer_details SET phone_no = '6556787700' where email = 'alanstosky@example.com';  
UPDATE customer_details SET phone_no = '6556787701' where email = 'freddizooz@example.com';  
UPDATE customer_details SET phone_no = '6556787697' where email = 'catherinemathew@example.com';  
UPDATE customer_details SET phone_no = '6556787696' where email = 'zavymathew@example.com';  
set sql_safe_updates =0;
select* from customer_details where state='California';

/*Count the number of customers in each state and show only states with more than 5 customers*/
CREATE VIEW cust_count AS
SELECT 
state, count(*) as customer_count
FROM customer
group by state having count(*)>5;
select* from cust_count;

/*Write a query that will return the number of customers in each state, 
based on the "state" column in the "customer_details" view*/
CREATE VIEW state_customer_count AS
SELECT 
state, count(*) as state_cust_count
FROM customer_details
group by state;
select* from state_customer_count;

/*Write a query that returns all the columns from the 
"customer_details" view, sorted by the "state" column in ascending order*/
CREATE VIEW customer_asc AS
SELECT *
FROM customer_details order by state ASC;
select* from customer_asc;
