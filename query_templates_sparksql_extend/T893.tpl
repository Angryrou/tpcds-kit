-- T893.tpl

define LOYALTY_CLASS = random(1, 5, uniform);
define MIN_EXPENDITURE = random(5000, 10000, uniform);

select
    c_loyalty_class,
    sum(ss_net_paid_inc_tax) as loyalty_expenditure
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    sum(ss_net_paid_inc_tax) > [MIN_EXPENDITURE]
order by
    loyalty_expenditure desc
limit 100;
