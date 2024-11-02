-- T253.tpl

define AGE = random(18, 70, uniform);
define MAX_SPENDING = random(1000, 8000, uniform);

select
    c_customer_age,
    sum(ss_ext_sales_price) as age_spending
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE]
group by
    c_customer_age
having
    sum(ss_ext_sales_price) < [MAX_SPENDING]
order by
    age_spending asc
limit 100;
