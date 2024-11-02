-- T270.tpl

define PROMO_TYPE = random(1, 3, uniform);
define MIN_PROMO_SALES = random(3000, 12000, uniform);

select
    p_promo_category,
    sum(ws_net_paid) as total_promo_sales
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_TYPE]
group by
    p_promo_category
having
    sum(ws_net_paid) > [MIN_PROMO_SALES]
order by
    total_promo_sales desc
limit 100;
