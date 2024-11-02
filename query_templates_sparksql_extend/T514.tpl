-- T514.tpl

define PROMO_LEVEL = random(1, 3, uniform);
define MAX_REVENUE = random(2000, 8000, uniform);

select
    p_promo_name,
    sum(ws_sales_price) as total_promo_revenue
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_LEVEL]
group by
    p_promo_name
having
    sum(ws_sales_price) < [MAX_REVENUE]
order by
    total_promo_revenue asc
limit 100;
