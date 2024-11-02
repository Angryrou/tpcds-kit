-- T173.tpl

define AGE = random(18, 70, uniform);
define MIN_PURCHASES = random(50, 200, uniform);

select
    c_customer_id,
    count(ss_ticket_number) as purchase_count
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE]
group by
    c_customer_id
having
    count(ss_ticket_number) > [MIN_PURCHASES]
order by
    purchase_count desc
limit 100;
