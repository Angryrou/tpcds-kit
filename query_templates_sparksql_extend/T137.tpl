-- T137.tpl

define LOYALTY_CLASS = random(1, 4, uniform);
define MIN_ORDERS = random(30, 100, uniform);

select
    c_loyalty_class,
    count(ss_ticket_number) as order_count
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    count(ss_ticket_number) > [MIN_ORDERS]
order by
    order_count desc
limit 100;
