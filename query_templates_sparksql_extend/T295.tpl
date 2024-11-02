-- T295.tpl

define PROMO_TYPE = random(1, 3, uniform);
define MAX_PROMO_EXPENSE = random(3000, 15000, uniform);

select
    p_promo_name,
    sum(ws_ext_sales_price) as promo_expense
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_TYPE]
group by
    p_promo_name
having
    sum(ws_ext_sales_price) < [MAX_PROMO_EXPENSE]
order by
    promo_expense asc
limit 100;
