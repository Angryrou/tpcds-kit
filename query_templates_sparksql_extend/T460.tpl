-- T460.tpl

define CUSTOMER_TYPE = random(1, 4, uniform);
define MIN_REVENUE = random(3000, 10000, uniform);

select
    c_customer_type,
    sum(ss_net_paid) as customer_revenue
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_type = [CUSTOMER_TYPE]
group by
    c_customer_type
having
    sum(ss_net_paid) > [MIN_REVENUE]
order by
    customer_revenue desc
limit 100;
