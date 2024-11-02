-- T685.tpl

define AGE_RANGE = random(20, 70, uniform);
define MIN_REVENUE = random(3000, 12000, uniform);

select
    c_customer_age,
    sum(ss_sales_price) as age_range_sales
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_RANGE]
group by
    c_customer_age
having
    sum(ss_sales_price) > [MIN_REVENUE]
order by
    age_range_sales desc
limit 100;
