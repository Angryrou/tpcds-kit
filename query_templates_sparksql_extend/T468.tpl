-- T468.tpl

define LOYALTY_LEVEL = random(1, 5, uniform);
define MAX_SALES = random(3000, 15000, uniform);

select
    c_loyalty_class,
    sum(ss_sales_price) as total_loyalty_sales
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_LEVEL]
group by
    c_loyalty_class
having
    sum(ss_sales_price) < [MAX_SALES]
order by
    total_loyalty_sales asc
limit 100;
