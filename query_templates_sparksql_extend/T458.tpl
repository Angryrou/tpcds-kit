-- T458.tpl

define PROMO_LEVEL = random(1, 5, uniform);
define MIN_EXPENDITURE = random(500, 3000, uniform);

select
    p_promo_name,
    sum(ws_net_paid) as promo_expenditure
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_LEVEL]
group by
    p_promo_name
having
    sum(ws_net_paid) > [MIN_EXPENDITURE]
order by
    promo_expenditure desc
limit 100;
