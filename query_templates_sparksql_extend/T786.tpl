-- T786.tpl

define AGE_RANGE = random(18, 65, uniform);
define MAX_USAGE = random(3000, 15000, uniform);

select
    c_customer_age,
    count(ss_sales_price) as age_range_usage
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_RANGE]
group by
    c_customer_age
having
    count(ss_sales_price) < [MAX_USAGE]
order by
    age_range_usage asc
limit 100;
