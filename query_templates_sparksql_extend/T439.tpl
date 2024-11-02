-- T439.tpl

define PROMO_LEVEL = random(1, 5, uniform);
define MIN_SALES = random(3000, 15000, uniform);

select
    p_promo_name,
    sum(ws_sales_price) as promo_sales
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_LEVEL]
group by
    p_promo_name
having
    sum(ws_sales_price) > [MIN_SALES]
order by
    promo_sales desc
limit 100;
