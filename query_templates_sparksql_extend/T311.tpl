-- T311.tpl

define PROMO_ID = random(1, 10, uniform);
define MIN_SALES = random(1000, 5000, uniform);

select
    p_promo_name,
    sum(ws_net_paid) as promo_sales
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_id = [PROMO_ID]
group by
    p_promo_name
having
    sum(ws_net_paid) > [MIN_SALES]
order by
    promo_sales desc
limit 100;
