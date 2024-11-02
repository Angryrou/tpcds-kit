-- T467.tpl

define CUSTOMER_TYPE = random(1, 4, uniform);
define MIN_EXPENSE = random(2000, 10000, uniform);

select
    c_customer_type,
    sum(cs_net_paid) as customer_expense
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_type = [CUSTOMER_TYPE]
group by
    c_customer_type
having
    sum(cs_net_paid) > [MIN_EXPENSE]
order by
    customer_expense desc
limit 100;
