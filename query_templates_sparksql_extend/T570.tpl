-- T570.tpl

define AGE_GROUP = random(18, 65, uniform);
define MAX_DISCOUNT = random(1000, 5000, uniform);

select
    c_customer_age,
    sum(ss_ext_discount_amt) as age_group_discount
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_GROUP]
group by
    c_customer_age
having
    sum(ss_ext_discount_amt) < [MAX_DISCOUNT]
order by
    age_group_discount asc
limit 100;
