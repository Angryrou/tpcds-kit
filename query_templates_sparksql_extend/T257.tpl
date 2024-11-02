-- T257.tpl

define PROMO_ID = random(1, 20, uniform);
define MAX_PROMO_SPEND = random(3000, 15000, uniform);

select
    p_promo_name,
    sum(ws_sales_price) as promo_spending
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_id = [PROMO_ID]
group by
    p_promo_name
having
    sum(ws_sales_price) < [MAX_PROMO_SPEND]
order by
    promo_spending asc
limit 100;
