-- T179.tpl

define AGE_GROUP = random(20, 60, uniform);
define MIN_SALES = random(2000, 10000, uniform);

select
    c_customer_id,
    c_customer_age,
    sum(cs_sales_price) as total_sales
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_GROUP]
group by
    c_customer_id,
    c_customer_age
having
    sum(cs_sales_price) > [MIN_SALES]
order by
    total_sales desc
limit 100;
