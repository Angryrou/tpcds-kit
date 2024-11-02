-- T109.tpl

define LOYALTY_CLASS = random(1, 5, uniform);
define MIN_PURCHASES = random(50, 200, uniform);

select
    c_customer_id,
    c_first_name,
    c_last_name,
    count(ss_ticket_number) as purchase_count
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_customer_id,
    c_first_name,
    c_last_name
having
    count(ss_ticket_number) > [MIN_PURCHASES]
order by
    purchase_count desc
limit 100;
