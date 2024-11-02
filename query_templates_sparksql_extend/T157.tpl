-- T157.tpl

define PROMO_ID = random(1, 20, uniform);
define MIN_REVENUE = random(5000, 20000, uniform);

select
    p_promo_id,
    sum(cs_net_paid_inc_tax) as total_revenue
from
    catalog_sales cs,
    promotion p
where
    cs_promo_sk = p_promo_sk
    and p_promo_id = [PROMO_ID]
group by
    p_promo_id
having
    sum(cs_net_paid_inc_tax) > [MIN_REVENUE]
order by
    total_revenue desc
limit 100;
