-- T168.tpl

define PROMO_ID = random(1, 15, uniform);
define MAX_REVENUE = random(10000, 50000, uniform);

select
    p_promo_id,
    sum(cs_net_paid_inc_tax) as promo_revenue
from
    catalog_sales cs,
    promotion p
where
    cs_promo_sk = p_promo_sk
    and p_promo_id = [PROMO_ID]
group by
    p_promo_id
having
    sum(cs_net_paid_inc_tax) < [MAX_REVENUE]
order by
    promo_revenue asc
limit 100;
