-- T737.tpl

define PROMO_LEVEL = random(1, 4, uniform);
define MAX_EXPENSE = random(5000, 20000, uniform);

select
    p_promo_name,
    sum(ws_net_paid) as promo_expense
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_LEVEL]
group by
    p_promo_name
having
    sum(ws_net_paid) < [MAX_EXPENSE]
order by
    promo_expense asc
limit 100;
