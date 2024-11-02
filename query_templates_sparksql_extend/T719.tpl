-- T719.tpl

define CUSTOMER_TYPE = random(1, 4, uniform);
define MAX_EXPENSE = random(3000, 15000, uniform);

select
    c_customer_type,
    sum(ss_net_paid) as total_expense
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_type = [CUSTOMER_TYPE]
group by
    c_customer_type
having
    sum(ss_net_paid) < [MAX_EXPENSE]
order by
    total_expense asc
limit 100;
