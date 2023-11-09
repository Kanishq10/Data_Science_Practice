use sys;

CREATE TABLE sales (
  customer_id VARCHAR(1),
  order_date DATE,
  product_id INTEGER
);

INSERT INTO sales
  (customer_id, order_date, product_id)
VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-07', '3');
 

CREATE TABLE menu (
  product_id INTEGER,
  product_name VARCHAR(5),
  price INTEGER
);

INSERT INTO menu
  (product_id, product_name, price)
VALUES
  ('1', 'sushi', '10'),
  ('2', 'curry', '15'),
  ('3', 'ramen', '12');
  

CREATE TABLE members (
  customer_id VARCHAR(1),
  join_date DATE
);

INSERT INTO members
  (customer_id, join_date)
VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09');
  
SELECT
  	product_id,
    product_name,
    price
FROM menu
ORDER BY price DESC
LIMIT 5;

#q1 What is the total amount each customer spent at the restaurant?
Select s.customer_id,sum(price) as Order_Total from sales s inner join menu m on s.product_id=m.product_id group by s.customer_id;

#q2 How many days has each customer visited the restaurant?
Select customer_id,count(distinct order_date) as Visits from sales group by customer_id;

#q3 What was the first item from the menu purchased by each customer?
with order_sales as
(
select customer_id , order_date, product_name,
rank() over(partition by customer_id order by order_date) as r
from sales join menu on sales.product_id = menu.product_id
)
select customer_id, product_name
from order_sales
where r=1
group by customer_id, product_name;

#q4 What is the most purchased item on the menu and how many times was it purchased by all customers?
select menu.product_name , count(product_name) from sales inner join menu where sales.product_id = menu.product_id
group by product_name order by count(product_name) desc limit 1;

#q5 Which item was the most popular for each customer?
with most_popular as 
(
select customer_id, product_name, count(menu.product_id) as Order_count,
dense_rank() over(partition by customer_id order by count(customer_id) Desc) as r
from menu join sales on menu.product_id = sales.product_id group by sales.customer_id, menu.product_name
)
select
customer_id, product_name, order_count
from most_popular
where r = 1;