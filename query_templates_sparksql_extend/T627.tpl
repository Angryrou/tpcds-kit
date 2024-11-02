-- T627.tpl

define PROMO_LEVEL = random(1, 5, uniform);
define MIN_QUANTITY = random(500, 2500, uniform);

select
    p_promo_name,
    count(ws_sales_price) as promo_quantity
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_LEVEL]
group by
    p_promo_name
having
    count(ws_sales_price) > [MIN_QUANTITY]
order by
    promo_quantity desc
limit 100;
