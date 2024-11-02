-- T313.tpl

define CUSTOMER_AGE = random(30, 70, uniform);
define MIN_SPENT = random(2000, 10000, uniform);

select
    c_customer_id,
    sum(cs_sales_price) as total_spent
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [CUSTOMER_AGE]
group by
    c_customer_id
having
    sum(cs_sales_price) > [MIN_SPENT]
order by
    total_spent desc
limit 100;
