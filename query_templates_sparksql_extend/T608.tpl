-- T608.tpl

define PROMO_LEVEL = random(1, 3, uniform);
define MIN_EXPENSE = random(5000, 15000, uniform);

select
    p_promo_name,
    sum(ss_net_paid_inc_tax) as promo_expense
from
    store_sales ss,
    promotion p
where
    ss_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_LEVEL]
group by
    p_promo_name
having
    sum(ss_net_paid_inc_tax) > [MIN_EXPENSE]
order by
    promo_expense desc
limit 100;
