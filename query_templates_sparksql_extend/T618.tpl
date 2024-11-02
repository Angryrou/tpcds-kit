-- T618.tpl

define PROMO_LEVEL = random(1, 3, uniform);
define MIN_EXPENSE = random(5000, 15000, uniform);

select
    p_promo_name,
    sum(cs_net_paid_inc_tax) as promo_expense
from
    catalog_sales cs,
    promotion p
where
    cs_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_LEVEL]
group by
    p_promo_name
having
    sum(cs_net_paid_inc_tax) > [MIN_EXPENSE]
order by
    promo_expense desc
limit 100;