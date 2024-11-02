-- T187.tpl

define COUNTRY_ID = random(1, 20, uniform);
define MAX_REFUND = random(500, 3000, uniform);

select
    ca_country,
    sum(sr_return_amt) as total_refund
from
    store_returns sr,
    customer_address ca
where
    sr_customer_sk = ca_address_sk
    and ca_country_id = [COUNTRY_ID]
group by
    ca_country
having
    sum(sr_return_amt) < [MAX_REFUND]
order by
    total_refund asc
limit 100;
