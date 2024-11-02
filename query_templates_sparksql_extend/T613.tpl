-- T613.tpl

define PROMO_ID = random(1, 15, uniform);
define MAX_REVENUE = random(5000, 20000, uniform);

select
    p_promo_name,
    sum(ss_net_paid) as total_revenue
from
    store_sales ss,
    promotion p
where
    ss_promo_sk = p_promo_sk
    and p_promo_id = [PROMO_ID]
group by
    p_promo_name
having
    sum(ss_net_paid) < [MAX_REVENUE]
order by
    total_revenue asc
limit 100;
