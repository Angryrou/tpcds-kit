-- T609.tpl

define CUSTOMER_TYPE = random(1, 4, uniform);
define MIN_SPENDING = random(3000, 10000, uniform);

select
    c_customer_type,
    sum(cs_net_paid_inc_tax) as total_spending
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_type = [CUSTOMER_TYPE]
group by
    c_customer_type
having
    sum(cs_net_paid_inc_tax) > [MIN_SPENDING]
order by
    total_spending desc
limit 100;
