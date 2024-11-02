-- T541.tpl

define CUSTOMER_TYPE = random(1, 4, uniform);
define MAX_SPENDING = random(5000, 15000, uniform);

select
    c_customer_type,
    sum(cs_net_paid) as total_spending
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_type = [CUSTOMER_TYPE]
group by
    c_customer_type
having
    sum(cs_net_paid) < [MAX_SPENDING]
order by
    total_spending asc
limit 100;
