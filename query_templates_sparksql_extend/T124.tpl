-- T124.tpl

define MIN_PURCHASES = random(50, 150, uniform);
define LOYALTY_LEVEL = random(1, 3, uniform);

select
    c_loyalty_class,
    count(ss_ticket_number) as purchase_count
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_LEVEL]
group by
    c_loyalty_class
having
    count(ss_ticket_number) > [MIN_PURCHASES]
order by
    purchase_count desc
limit 100;
