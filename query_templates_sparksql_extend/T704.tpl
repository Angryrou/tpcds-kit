-- T704.tpl

define AGE_RANGE = random(25, 70, uniform);
define MIN_SALES = random(5000, 15000, uniform);

select
    c_customer_age,
    sum(ss_sales_price) as age_sales
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_RANGE]
group by
    c_customer_age
having
    sum(ss_sales_price) > [MIN_SALES]
order by
    age_sales desc
limit 100;
