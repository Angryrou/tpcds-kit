-- T488.tpl

define LOYALTY_CLASS = random(1, 5, uniform);
define MIN_REVENUE = random(3000, 12000, uniform);

select
    c_loyalty_class,
    sum(ss_net_paid) as loyalty_revenue
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    sum(ss_net_paid) > [MIN_REVENUE]
order by
    loyalty_revenue desc
limit 100;
