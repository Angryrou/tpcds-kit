-- T431.tpl

define PROMO_LEVEL = random(1, 3, uniform);
define MIN_DISCOUNT = random(1000, 5000, uniform);

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
    sum(cs_ext_discount_amt) > [MIN_DISCOUNT]
order by
    promo_discount desc
limit 100;
