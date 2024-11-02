-- T410.tpl

define CUSTOMER_TYPE = random(1, 4, uniform);
define MAX_SPEND = random(5000, 15000, uniform);

select
    c_customer_type,
    sum(ss_net_paid) as customer_spend
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_type = [CUSTOMER_TYPE]
group by
    c_customer_type
having
    sum(ss_net_paid) < [MAX_SPEND]
order by
    customer_spend asc
limit 100;
