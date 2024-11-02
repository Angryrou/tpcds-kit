-- T361.tpl

define CUSTOMER_TYPE = random(1, 4, uniform);
define MIN_EXPENSE = random(2000, 10000, uniform);

select
    c_customer_type,
    sum(ss_net_paid_inc_tax) as customer_expense
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_type = [CUSTOMER_TYPE]
group by
    c_customer_type
having
    sum(ss_net_paid_inc_tax) > [MIN_EXPENSE]
order by
    customer_expense desc
limit 100;