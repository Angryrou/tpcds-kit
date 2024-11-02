-- T262.tpl

define PROMO_LEVEL = random(1, 3, uniform);
define MAX_REVENUE = random(3000, 12000, uniform);

select
    p_promo_category,
    sum(ws_net_paid) as promo_revenue
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_LEVEL]
group by
    p_promo_category
having
    sum(ws_net_paid) < [MAX_REVENUE]
order by
    promo_revenue asc
limit 100;
