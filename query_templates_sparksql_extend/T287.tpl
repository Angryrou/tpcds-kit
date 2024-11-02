-- T287.tpl

define LOYALTY_LEVEL = random(1, 4, uniform);
define MIN_SPEND = random(2000, 10000, uniform);

select
    c_loyalty_class,
    sum(ss_ext_sales_price) as total_spend
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_LEVEL]
group by
    c_loyalty_class
having
    sum(ss_ext_sales_price) > [MIN_SPEND]
order by
    total_spend desc
limit 100;
