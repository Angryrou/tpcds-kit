-- T197.tpl

define LOYALTY_CLASS = random(1, 4, uniform);
define MIN_PURCHASES = random(50, 200, uniform);

select
    c_loyalty_class,
    count(cs_ticket_number) as purchase_count
from
    catalog_sales cs,
    customer c
where
    cs_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    count(cs_ticket_number) > [MIN_PURCHASES]
order by
    purchase_count desc
limit 100;
