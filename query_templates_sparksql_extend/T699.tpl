-- T699.tpl

define AGE = random(18, 65, uniform);
define MIN_EXPENDITURE = random(5000, 20000, uniform);

select
    c_customer_age,
    sum(ss_net_paid) as total_expenditure
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE]
group by
    c_customer_age
having
    sum(ss_net_paid) > [MIN_EXPENDITURE]
order by
    total_expenditure desc
limit 100;
