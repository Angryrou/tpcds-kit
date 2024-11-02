-- T551.tpl

define PROMO_ID = random(1, 20, uniform);
define MAX_REVENUE = random(5000, 15000, uniform);

select
    p_promo_name,
    sum(ws_net_paid) as promo_revenue
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_id = [PROMO_ID]
group by
    p_promo_name
having
    sum(ws_net_paid) < [MAX_REVENUE]
order by
    promo_revenue asc
limit 100;
