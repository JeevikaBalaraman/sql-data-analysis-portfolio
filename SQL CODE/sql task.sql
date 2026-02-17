create schema task
use task
create table cus_table(
cus_id int,
cus_name varchar(100),
city varchar(100),
email varchar (100),
join_date varchar(100)
)

insert into cus_table()
values(1,"arun","chennai","arun@gmail.com","2023-01-10"),
(2,"divya","bangalore","divya@yahoo.com","2022-12-15"),
(3,"karthik","mumbai","karthik@gmail.com","2023-05-12"),
(4,"meena","delhi","meena@outlook.com","2021-08-25"),
(5,"ravi","chennai","ravi@gmail.com","2023-03-18"),
(6,"sneha","hyderabad","sneha@gmail.com","2022-11-30"),
(7,"aijay","bangalore","aijay@yahoo.com","2023-06-01"),
(8,"priya","mumbai","priya@gmail.com","2021-07-14"),
(9,"vikram","chennai","vikram@gmail.com","2023-02-20"),
(10,"neha","pune","pune@gmail.com","2022-09-09")

create table order_table(
order_id int,
cus_id int,
order_date varchar(100),
order_amt varchar(100),
status varchar(100)
)
alter table order_table change order_amt order_amt int

insert into order_table()
values(101,1,'2023-06-01',12000,'completed'),
(102,1,'2023-06-15',8000,'pending'),
(103,2,'2023-05-20',22000,'completed'),
(104,3,'2023-04-10',15000,'completed'),
(105,3,'2023-07-05',30000,'completed'),
(106,4,'22023-03-12',5000,'cancelled'),
(107,5,'2023-06-25',18000,'completed'),
(108,6,'2023-02-14',7000,'pending'),
(109,7,'2023-07-01',25000,'completed'),
(110,8,'2023-01-30',9000,'completed'),
(111,9,'2023-06-18',16000,'completed'),
(112,9,'2023-06-28',14000,'pending'),
(113,10,'2023-05-05',6000,'completed'),
(114,null,'2023-05-15',11000,'completed'),
(115,2,'2023-07-10',19500,'completed')

truncate table order_table

create table product_table(
product_id int,
product_name varchar(100),
category varchar(100),
price int
)

insert into product_table()
values(201,"laptop","electronics",55000),
(202,"mobile","electronics",25000),
(203,"headphone","electronics",3000),
(204,"chair","furniture",4500),
(205,"table","furniture",8500),
(206,"pen","stationery",50),
(207,"notebook","stationery",120),
(208,"printer","electronics",18000)

create table item_table(
item_id int,
order_id int,
product_id int,
quantity int
)

insert into item_table()
values(1,101,202,1),
(2,101,203,2),
(3,102,206,10),
(4,103,201,1),
(5,103,203,1),
(6,104,202,1),
(7,105,201,2),
(8,106,207,5),
(9,107,204,2),
(10,107,205,1),
(11,108,206,20),
(12,109,202,1),
(13,109,208,1),
(14,110,203,3),
(15,111,205,2),
(16,112,207,10),
(17,113,206,15),
(18,114,204,1),
(19,115,202,1),
(20,115,203,2)

create table emp_table(
emp_id int,
emp_name varchar(100),
manager_id int,
dpt varchar(100),
salary int
)

insert into emp_table()
values(1,"ramesh",null,"management",90000),
(2,"suresh",1,"sales",60000),
(3,"mahesh",1,"it",65000),
(4,"anita",2,"sales",45000),
(5,"kiran",2,"sales",48000),
(6,"priya",3,"it",52000),
(7,"vijay",3,"it",50000),
(8,"neethu",null,"hr",55000)
1
select cus_name,join_date as joined from cus_table
where join_date > "2023-01-1"
2
select distinct city from cus_table
3
select * from cus_table
where email like "%gmail.com";
4
select * from cus_table
where city="chennai" or city="bangalore"
5
select * from cus_table
where join_date between "2022-01-01" and "2023-06-01"
6
select * from cus_table
order by join_date desc
7
select cus_name as  client_name from cus_table
8
select * from order_table where order_amt>15000
9
select * from order_table
where status="completed" and order_date like "2023-06%"
10
select * from order_table
order by order_amt desc limit 5
11
select * from order_table
where status="pending" or status="cancelled"
12
select*,
case
when order_amt >= 20000 then "high"
when order_amt between 10000 and 19999 then "medium"
when order_amt <10000 then "low"
else "lowest"
end as total_amt
from order_table
13
select * from order_table
where  cus_id is null
14
select * from product_table
where category="electronics"
15
select * from product_table where price
between 5000 and 30000
16
select product_name,price from product_table 
where price =(select max(price) from product_table)
17
select category,count(category)from product_table
group by category 
18
select * from product_table
order by price desc
19
select p.product_id ,p.product_name,sum(i.quantity) as q_s_each_p
from product_table as p
inner join item_table as i
on p. product_id=i.product_id
group by product_id,product_name
20
select p.product_id,p.product_name ,sum(i.quantity) as q_s_more_3
from product_table as p
inner join item_table as i
on p. product_id=i.product_id
group by product_id,product_name
having q_s_more_3 >3
21
select o.order_id, sum(i.quantity) as item_order
from order_table as o
inner join item_table as i
using (order_id)
group by order_id
22
select c.cus_name,o.order_date,o.order_amt
from cus_table as c
right join order_table as o
on c.cus_id=o.cus_id
23 
select c.cus_name,c.cus_id ,o.order_id
from cus_table as c
left join order_table as o
on c.cus_id=o.cus_id
where o.order_id is null
24
select c.cus_name,c.cus_id ,o.order_id 
from cus_table as c
right join order_table as o
on c.cus_id=o.cus_id
25
select c.*,o.*
from cus_table as c
right join order_table as o
using (cus_id)
26
select o.order_id,p.product_name,i.quantity
from order_table as o
inner join item_table as i
on o.order_id=i.order_id
inner join product_table as p
on p.product_id=i.product_id
27
select p.product_id,p.product_name,sum(p.price * i.quantity)as total_sale_amt, sum(i.quantity)
from  product_table as p
inner join item_table as i
on p.product_id=i.product_id
inner join order_table as o
on o.order_id=i.order_id
group by product_id,product_name
28
select p.category, sum(i.quantity)
from  product_table as p
inner join item_table as i
on p.product_id=i.product_id
inner join order_table as o
on o.order_id=i.order_id
group by category
29
select p.product_id,p.product_name,sum(p.price * i.quantity)as high_revenue 
from  product_table as p
inner join item_table as i
on p.product_id=i.product_id
inner join order_table as o
on o.order_id=i.order_id
group by product_id,product_name
order by high_revenue desc limit 1
30
select e.emp_name,m.emp_name as man_name
from emp_table as e
left join emp_table as m
on e.manager_id=m.emp_id
31
select e.emp_name,m.emp_name as man_name
from emp_table as e
left join emp_table as m
on e.manager_id=m.emp_id
having man_name is null
32
select e.emp_name,m.emp_name as man_name
from emp_table as e
left join emp_table as m
on e.manager_id=m.emp_id
having man_name ="suresh"
33
select c.cus_name,sum(i.quantity*p.price) as total_order
from cus_table as c
inner join order_table as o
using (cus_id)
inner join item_table as i
using(order_id)
inner join product_table as p
using (product_id)
group by cus_name

34
select c.cus_name,sum(i.quantity*p.price) as total_order
from cus_table as c
inner join order_table as o
using (cus_id)
inner join item_table as i
using(order_id)
inner join product_table as p
using (product_id)
group by cus_name
having total_order> 25000
35
select c.city, avg(i.quantity*p.price) as avg_order
from cus_table as c
inner join order_table as o
using (cus_id)
inner join item_table as i
using(order_id)
inner join product_table as p
using (product_id)
group by city
having avg_order>15000
36
create table employeee(
emp_id int ,
name varchar (100),
dept varchar(100),
salary int ,
joindate_date date,
performance float
)
insert into employeee()
values
(101,"arun","it",60000,"2021-01-15",4.5),
(102,"priya","hr",42000,"2020-03-20",3.8),
(103,"kiran","it",80000,"2019-07-10",4.9),
(105,"meena","sales",55000,"2021-11-01",4.2),
(105,"suresh","hr",75000,"2018-05-25",4.7)
1
select * 
from(select *,
dense_rank() over(partition by dept order by salary desc) as highest_paid
from employeee)t
where highest_paid =1 limit 2

2
select dept,avg(performance) as avg_performance
from  employeee as e
where salary >(select avg(salary) from employeee  where dept=e.dept)
group by dept

3
select *,sum(salary)
over( order by joindate_date ) as cumulative from employeee
4
select * from employeee as e
where salary > (select avg(salary) from employeee where
dept=e.dept )

start transaction;
delete from employeee where dept="hr" and performance < 4.0;
rollback;
select * from employeee





