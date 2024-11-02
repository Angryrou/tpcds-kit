-- T200.tpl

define PROMO_LEVEL = random(1, 3, uniform);
define MAX_DISCOUNT = random(0.05, 0.30, uniform);

select
    p_promo_category,
    avg(ws_discount_amt/ws_sales_price) as avg_discount
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_LEVEL]
group by
    p_promo_category
having
    avg(ws_discount_amt/ws_sales_price) < [MAX_DISCOUNT]
order by
    avg_discount asc
limit 100;
