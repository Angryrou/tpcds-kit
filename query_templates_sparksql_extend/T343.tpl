-- T343.tpl

define CUSTOMER_TYPE = random(1, 4, uniform);
define MAX_REVENUE = random(3000, 15000, uniform);

select
    c_customer_type,
    sum(cs_net_paid_inc_tax) as customer_revenue
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_type = [CUSTOMER_TYPE]
group by
    c_customer_type
having
    sum(cs_net_paid_inc_tax) < [MAX_REVENUE]
order by
    customer_revenue asc
limit 100;
