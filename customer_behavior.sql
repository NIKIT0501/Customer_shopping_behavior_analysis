--Find the previous month's revenue for each city.


select *,
lag(revenue) over (partition by city order by month) as previous_revenue 
from monthly_rvenue

--"Calculate month-over-month (MoM) order growth."
with cte as (select month,orders, 
Lag(orders) over (order by month ) as previous_orders
from monthly_data)
select month , orders,previous_order,
orders-previous_orders as growth 
from monthly_data
--We want to identify whether orders increased or decreased next month.
select orders,
months,
lead(orders) over (order by month ) as next_orders,
case 
when lead(orders) over (order by month )>orders
then 'Increased'
when lead(orders) over (order by month )<orders 
then 'decreased'
else 'No change'
end as D/I
from monthly_records



