-- T357.tpl

define LOYALTY_CLASS = random(1, 5, uniform);
define MIN_SPENDING = random(1000, 7000, uniform);

select
    c_loyalty_class,
    sum(cs_net_paid_inc_tax) as total_spending
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    sum(cs_net_paid_inc_tax) > [MIN_SPENDING]
order by
    total_spending desc
limit 100;
