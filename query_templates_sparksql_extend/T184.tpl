-- T184.tpl

define AGE_RANGE = random(18, 50, uniform);
define MIN_SPENDING = random(2000, 12000, uniform);

select
    c_customer_age,
    sum(ws_sales_price) as total_spending
from
    web_sales ws,
    customer c
where
    ws_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_RANGE]
group by
    c_customer_age
having
    sum(ws_sales_price) > [MIN_SPENDING]
order by
    total_spending desc
limit 100;
