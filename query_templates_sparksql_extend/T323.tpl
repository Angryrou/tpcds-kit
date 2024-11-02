-- T323.tpl

define PROMO_LEVEL = random(1, 4, uniform);
define MIN_USAGE = random(100, 800, uniform);

select
    p_promo_category,
    count(ws_sales_price) as promo_usage
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_LEVEL]
group by
    p_promo_category
having
    count(ws_sales_price) > [MIN_USAGE]
order by
    promo_usage desc
limit 100;
