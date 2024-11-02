-- T263.tpl

define LOYALTY_CLASS = random(1, 5, uniform);
define MIN_PURCHASES = random(100, 600, uniform);

select
    c_loyalty_class,
    count(ss_ticket_number) as purchase_count
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    count(ss_ticket_number) > [MIN_PURCHASES]
order by
    purchase_count desc
limit 100;
