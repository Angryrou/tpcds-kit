-- T605.tpl

define CUSTOMER_TYPE = random(1, 4, uniform);
define MAX_EXPENDITURE = random(2000, 10000, uniform);

select
    c_customer_type,
    sum(cs_net_paid) as customer_expenditure
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_type = [CUSTOMER_TYPE]
group by
    c_customer_type
having
    sum(cs_net_paid) < [MAX_EXPENDITURE]
order by
    customer_expenditure asc
limit 100;
