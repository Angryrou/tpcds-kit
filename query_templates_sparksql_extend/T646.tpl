-- T646.tpl

define PROMO_LEVEL = random(1, 3, uniform);
define MAX_DISCOUNT = random(1000, 5000, uniform);

select
    p_promo_name,
    sum(ws_ext_discount_amt) as promo_discount
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
    promo_discount asc
limit 100;
