-- T272.tpl

define LOYALTY_CLASS = random(1, 4, uniform);
define MAX_SPEND = random(5000, 20000, uniform);

select
    c_loyalty_class,
    sum(cs_net_paid) as loyalty_spending
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    sum(cs_net_paid) < [MAX_SPEND]
order by
    loyalty_spending asc
limit 100;
