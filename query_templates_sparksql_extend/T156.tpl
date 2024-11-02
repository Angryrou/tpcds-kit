-- T156.tpl

define LOYALTY_LEVEL = random(1, 5, uniform);
define MIN_PROFIT = random(1000, 5000, uniform);

select
    c_loyalty_class,
    sum(cs_net_profit) as loyalty_profit
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_LEVEL]
group by
    c_loyalty_class
having
    sum(cs_net_profit) > [MIN_PROFIT]
order by
    loyalty_profit desc
limit 100;
