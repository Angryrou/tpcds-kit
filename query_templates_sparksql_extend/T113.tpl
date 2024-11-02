-- T113.tpl

define AGE_GROUP = random(18, 65, uniform);
define MIN_DISCOUNT = random(100, 500, uniform);

select
    c_customer_id,
    c_customer_age,
    sum(ss_ext_discount_amt) as total_discount
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_GROUP]
group by
    c_customer_id,
    c_customer_age
having
    sum(ss_ext_discount_amt) > [MIN_DISCOUNT]
order by
    total_discount desc
limit 100;
