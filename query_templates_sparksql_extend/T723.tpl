-- T723.tpl

define AGE_RANGE = random(18, 70, uniform);
define MAX_TAX = random(1000, 6000, uniform);

select
    c_customer_age,
    sum(ss_sales_tax) as age_group_tax
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_RANGE]
group by
    c_customer_age
having
    sum(ss_sales_tax) < [MAX_TAX]
order by
    age_group_tax asc
limit 100;
