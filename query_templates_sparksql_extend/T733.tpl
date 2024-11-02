-- T733.tpl

define AGE = random(25, 70, uniform);
define MIN_PURCHASES = random(3000, 10000, uniform);

select
    c_customer_age,
    sum(ss_sales_price) as age_sales
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE]
group by
    c_customer_age
having
    sum(ss_sales_price) > [MIN_PURCHASES]
order by
    age_sales desc
limit 100;
