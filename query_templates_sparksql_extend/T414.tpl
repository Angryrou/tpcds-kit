-- T414.tpl

define LOYALTY_CLASS = random(1, 5, uniform);
define MIN_PROFIT = random(2000, 10000, uniform);

select
    c_loyalty_class,
    sum(ss_net_profit) as loyalty_profit
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    sum(ss_net_profit) > [MIN_PROFIT]
order by
    loyalty_profit desc
limit 100;
