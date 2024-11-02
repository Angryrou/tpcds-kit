-- T437.tpl

define PROMO_ID = random(1, 20, uniform);
define MAX_DISCOUNT = random(1000, 5000, uniform);

select
    p_promo_name,
    sum(cs_ext_discount_amt) as total_discount
from
    catalog_sales cs,
    promotion p
where
    cs_promo_sk = p_promo_sk
    and p_promo_id = [PROMO_ID]
group by
    p_promo_name
having
    sum(cs_ext_discount_amt) < [MAX_DISCOUNT]
order by
    total_discount asc
limit 100;
