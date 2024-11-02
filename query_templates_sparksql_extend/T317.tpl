-- T317.tpl

define AGE_GROUP = random(25, 65, uniform);
define MIN_SALES = random(3000, 15000, uniform);

select
    c_customer_age,
    sum(ss_sales_price) as total_sales
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_GROUP]
group by
    c_customer_age
having
    sum(ss_sales_price) > [MIN_SALES]
order by
    total_sales desc
limit 100;
