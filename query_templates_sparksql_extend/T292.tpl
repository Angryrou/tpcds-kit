-- T292.tpl

define PROMO_LEVEL = random(1, 4, uniform);
define MAX_REVENUE = random(5000, 25000, uniform);

select
    p_promo_name,
    sum(ws_sales_price) as promo_revenue
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_category = [PROMO_LEVEL]
group by
    p_promo_name
having
    sum(ws_sales_price) < [MAX_REVENUE]
order by
    promo_revenue asc
limit 100;
