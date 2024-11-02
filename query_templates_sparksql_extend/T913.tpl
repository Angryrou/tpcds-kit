-- T913.tpl

define AGE = random(18, 70, uniform);
define MAX_DISCOUNT = random(2000, 8000, uniform);

select
    c_customer_age,
    sum(ss_ext_discount_amt) as age_discount
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE]
group by
    c_customer_age
having
    sum(ss_ext_discount_amt) < [MAX_DISCOUNT]
order by
    age_discount asc
limit 100;
