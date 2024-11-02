-- T903.tpl

define AGE_RANGE = random(18, 65, uniform);
define MIN_QUANTITY = random(3000, 10000, uniform);

select
    c_customer_age,
    sum(cs_quantity) as age_range_quantity
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_RANGE]
group by
    c_customer_age
having
    sum(cs_quantity) > [MIN_QUANTITY]
order by
    age_range_quantity desc
limit 100;
