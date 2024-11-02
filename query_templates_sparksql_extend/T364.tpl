-- T364.tpl

define LOYALTY_CLASS = random(1, 5, uniform);
define MIN_NET_PROFIT = random(2000, 8000, uniform);

select
    c_loyalty_class,
    sum(cs_net_profit) as loyalty_net_profit
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    sum(cs_net_profit) > [MIN_NET_PROFIT]
order by
    loyalty_net_profit desc
limit 100;
