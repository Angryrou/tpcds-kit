-- T135.tpl

define PROMO_ID = random(1, 15, uniform);
define MAX_PROMO_SALES = random(2000, 15000, uniform);

select
    p_promo_id,
    sum(ws_ext_sales_price) as promo_sales
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_id = [PROMO_ID]
group by
    p_promo_id
having
    sum(ws_ext_sales_price) < [MAX_PROMO_SALES]
order by
    promo_sales asc
limit 100;
