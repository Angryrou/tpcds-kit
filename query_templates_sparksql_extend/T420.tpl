-- T420.tpl

define PROMO_LEVEL = random(1, 4, uniform);
define MAX_DISCOUNT = random(1000, 5000, uniform);

select
    p_promo_name,
    sum(ws_ext_discount_amt) as total_discount
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_LEVEL]
group by
    p_promo_name
having
    sum(ws_ext_discount_amt) < [MAX_DISCOUNT]
order by
    total_discount asc
limit 100;
