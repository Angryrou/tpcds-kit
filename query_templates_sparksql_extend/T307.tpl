-- T307.tpl

define LOYALTY_CLASS = random(1, 5, uniform);
define MIN_PURCHASES = random(100, 700, uniform);

select
    c_loyalty_class,
    count(cs_ticket_number) as loyalty_purchases
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    count(cs_ticket_number) > [MIN_PURCHASES]
order by
    loyalty_purchases desc
limit 100;
