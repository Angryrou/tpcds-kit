-- T906.tpl

define LOYALTY_CLASS = random(1, 5, uniform);
define MAX_SALES = random(3000, 12000, uniform);

select
    c_loyalty_class,
    sum(ss_net_paid) as loyalty_sales
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    sum(ss_net_paid) < [MAX_SALES]
order by
    loyalty_sales asc
limit 100;
