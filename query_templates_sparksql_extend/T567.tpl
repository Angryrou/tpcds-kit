-- T567.tpl

define LOYALTY_CLASS = random(1, 5, uniform);
define MIN_PURCHASES = random(5000, 15000, uniform);

select
    c_loyalty_class,
    sum(ss_sales_price) as total_sales
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    sum(ss_sales_price) > [MIN_PURCHASES]
order by
    total_sales desc
limit 100;
