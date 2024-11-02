-- T445.tpl

define AGE_GROUP = random(18, 65, uniform);
define MIN_SPENDING = random(3000, 10000, uniform);

select
    c_customer_age,
    sum(cs_sales_price) as total_spent
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_GROUP]
group by
    c_customer_age
having
    sum(cs_sales_price) > [MIN_SPENDING]
order by
    total_spent desc
limit 100;
