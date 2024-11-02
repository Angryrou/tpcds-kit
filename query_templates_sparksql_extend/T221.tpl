-- T221.tpl

define AGE = random(18, 70, uniform);
define MIN_QUANTITY = random(100, 500, uniform);

select
    c_customer_age,
    sum(cs_quantity) as total_quantity
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE]
group by
    c_customer_age
having
    sum(cs_quantity) > [MIN_QUANTITY]
order by
    total_quantity desc
limit 100;
