-- T578.tpl

define LOYALTY_CLASS = random(1, 5, uniform);
define MIN_QUANTITY = random(100, 800, uniform);

select
    c_loyalty_class,
    sum(ss_quantity) as loyalty_quantity
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    sum(ss_quantity) > [MIN_QUANTITY]
order by
    loyalty_quantity desc
limit 100;