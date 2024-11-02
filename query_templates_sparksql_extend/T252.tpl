-- T252.tpl

define PROMO_TYPE = random(1, 3, uniform);
define MIN_REVENUE = random(5000, 15000, uniform);

select
    p_promo_category,
    sum(ws_net_paid) as total_promo_revenue
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_TYPE]
group by
    p_promo_category
having
    sum(ws_net_paid) > [MIN_REVENUE]
order by
    total_promo_revenue desc
limit 100;
