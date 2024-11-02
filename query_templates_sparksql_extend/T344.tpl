-- T344.tpl

define PROMO_ID = random(1, 20, uniform);
define MIN_PROMO_SALES = random(2000, 8000, uniform);

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
    sum(ws_net_paid) > [MIN_PROMO_SALES]
order by
    promo_sales desc
limit 100;
