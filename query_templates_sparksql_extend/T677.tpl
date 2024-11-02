-- T677.tpl

define PROMO_LEVEL = random(1, 4, uniform);
define MIN_EXPENSE = random(3000, 12000, uniform);

select
    p_promo_name,
    sum(cs_net_paid) as promo_expense
from
    catalog_sales cs,
    promotion p
where
    cs_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_LEVEL]
group by
    p_promo_name
having
    sum(cs_net_paid) > [MIN_EXPENSE]
order by
    promo_expense desc
limit 100;
