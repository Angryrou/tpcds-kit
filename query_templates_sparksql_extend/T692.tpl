-- T692.tpl

define PROMO_LEVEL = random(1, 3, uniform);
define MAX_USAGE = random(300, 800, uniform);

select
    p_promo_name,
    count(ws_sales_price) as promo_usage
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_LEVEL]
group by
    p_promo_name
having
    count(ws_sales_price) < [MAX_USAGE]
order by
    promo_usage asc
limit 100;
