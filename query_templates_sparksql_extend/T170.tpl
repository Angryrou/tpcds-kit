-- T170.tpl

define PROMO_TYPE = random(1, 3, uniform);
define MAX_DISCOUNT = random(0.10, 0.50, uniform);

select
    p_promo_type,
    avg(ws_discount_amt/ws_sales_price) as avg_discount
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_TYPE]
group by
    p_promo_type
having
    avg(ws_discount_amt/ws_sales_price) < [MAX_DISCOUNT]
order by
    avg_discount asc
limit 100;