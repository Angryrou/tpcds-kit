-- T188.tpl

define PROMO_ID = random(1, 20, uniform);
define MIN_NET_SALES = random(1000, 10000, uniform);

select
    p_promo_id,
    sum(ws_net_paid) as promo_net_sales
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_id = [PROMO_ID]
group by
    p_promo_id
having
    sum(ws_net_paid) > [MIN_NET_SALES]
order by
    promo_net_sales desc
limit 100;
