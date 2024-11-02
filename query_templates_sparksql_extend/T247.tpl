-- T247.tpl

define PROMO_TYPE = random(1, 3, uniform);
define MIN_DISCOUNT = random(500, 3000, uniform);

select
    p_promo_category,
    sum(ws_discount_amt) as total_discount
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_TYPE]
group by
    p_promo_category
having
    sum(ws_discount_amt) > [MIN_DISCOUNT]
order by
    total_discount desc
limit 100;
