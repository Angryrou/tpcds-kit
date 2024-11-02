-- T267.tpl

define CUSTOMER_TYPE = random(1, 4, uniform);
define MIN_NET_PROFIT = random(2000, 10000, uniform);

select
    c_customer_type,
    sum(cs_net_profit) as customer_net_profit
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_type = [CUSTOMER_TYPE]
group by
    c_customer_type
having
    sum(cs_net_profit) > [MIN_NET_PROFIT]
order by
    customer_net_profit desc
limit 100;
