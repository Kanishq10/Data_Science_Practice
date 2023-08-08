use sql_bootcamp;


Select user_id , name from users where user_id not in(select user_id from orders);

SELECT R_ID,count(*) FROM ORDERS GROUP BY R_ID  ORDER BY COUNT(*) DESC;

SELECT R_NAME FROM RESTAURANTS WHERE R_ID=(SELECT R_ID FROM ORDERS GROUP BY R_ID  ORDER BY COUNT(*) DESC LIMIT 1); -- use full table because there are same orders with multiple food item 

select r_name, count(r_name) as Restaurant_Count
from swiggy_complete_data
where r_name is not null
group by r_name
order by Restaurant_Count desc;

select * from menu join food on menu.f_id=food.f_id;
Select f_name,avg(price) from menu join food on menu.f_id=food.f_id group by menu.f_id,food.f_name; 

select r_name, sum(amount) as Total_Amount
from swiggy_complete_data
where r_name is not null
group by r_name
order by Total_Amount desc;

select f_name, count(*) as Food_Count
from swiggy_complete_data
where f_name is not null
group by f_name
order by Food_Count desc;

Select r_name, 

