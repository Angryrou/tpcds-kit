-- T473.tpl

define PROMO_LEVEL = random(1, 3, uniform);
define MAX_REVENUE = random(3000, 15000, uniform);

select
    p_promo_name,
    sum(ws_sales_price) as total_revenue
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
    total_revenue asc
limit 100;
