-- T689.tpl

define CUSTOMER_TYPE = random(1, 4, uniform);
define MIN_EXPENDITURE = random(5000, 20000, uniform);

select
    c_customer_type,
    sum(ss_net_paid_inc_tax) as total_expenditure
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_type = [CUSTOMER_TYPE]
group by
    c_customer_type
having
    sum(ss_net_paid_inc_tax) > [MIN_EXPENDITURE]
order by
    total_expenditure desc
limit 100;
