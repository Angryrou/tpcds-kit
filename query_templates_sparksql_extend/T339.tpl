-- T339.tpl

define PROMO_LEVEL = random(1, 3, uniform);
define MIN_DISCOUNT = random(1000, 5000, uniform);

select
    p_promo_category,
    sum(cs_ext_discount_amt) as total_discount
from
    catalog_sales cs,
    promotion p
where
    cs_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_LEVEL]
group by
    p_promo_category
having
    sum(cs_ext_discount_amt) > [MIN_DISCOUNT]
order by
    total_discount desc
limit 100;
