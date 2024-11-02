-- T203.tpl

define AGE_GROUP = random(18, 65, uniform);
define MIN_PURCHASES = random(10, 200, uniform);

select
    c_customer_id,
    count(ss_ticket_number) as purchase_count
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_GROUP]
group by
    c_customer_id
having
    count(ss_ticket_number) > [MIN_PURCHASES]
order by
    purchase_count desc
limit 100;
