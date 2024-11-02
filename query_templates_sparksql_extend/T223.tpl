-- T223.tpl

define PROMO_ID = random(1, 20, uniform);
define MAX_REVENUE = random(1000, 10000, uniform);

select
    p_promo_id,
    sum(ws_net_paid) as promo_revenue
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_id = [PROMO_ID]
group by
    p_promo_id
having
    sum(ws_net_paid) < [MAX_REVENUE]
order by
    promo_revenue asc
limit 100;
