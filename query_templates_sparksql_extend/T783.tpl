-- T783.tpl

define PROMO_LEVEL = random(1, 3, uniform);
define MAX_DISCOUNT = random(2000, 8000, uniform);

select
    p_promo_name,
    sum(cs_ext_discount_amt) as promo_discount
from
    catalog_sales cs,
    promotion p
where
    cs_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_LEVEL]
group by
    p_promo_name
having
    sum(cs_ext_discount_amt) < [MAX_DISCOUNT]
order by
    promo_discount asc
limit 100;
