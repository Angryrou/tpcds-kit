-- T351.tpl

define CUSTOMER_TYPE = random(1, 3, uniform);
define MIN_EXPENSE = random(2000, 8000, uniform);

select
    c_customer_type,
    sum(cs_net_paid_inc_tax) as customer_expense
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_type = [CUSTOMER_TYPE]
group by
    c_customer_type
having
    sum(cs_net_paid_inc_tax) > [MIN_EXPENSE]
order by
    customer_expense desc
limit 100;
