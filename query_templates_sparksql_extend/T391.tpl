-- T391.tpl

define CUSTOMER_TYPE = random(1, 4, uniform);
define MIN_PURCHASE = random(3000, 10000, uniform);

select
    c_customer_type,
    sum(ss_net_paid) as total_purchases
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_type = [CUSTOMER_TYPE]
group by
    c_customer_type
having
    sum(ss_net_paid) > [MIN_PURCHASE]
order by
    total_purchases desc
limit 100;
