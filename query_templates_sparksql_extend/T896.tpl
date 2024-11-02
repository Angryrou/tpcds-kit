-- T896.tpl

define AGE_GROUP = random(18, 65, uniform);
define MIN_QUANTITY = random(3000, 10000, uniform);

select
    c_customer_age,
    sum(ss_quantity) as age_quantity
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_GROUP]
group by
    c_customer_age
having
    sum(ss_quantity) > [MIN_QUANTITY]
order by
    age_quantity desc
limit 100;
