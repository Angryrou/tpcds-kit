-- T363.tpl

define PROMO_ID = random(1, 15, uniform);
define MIN_DISCOUNT = random(1000, 5000, uniform);

select
    p_promo_name,
    sum(ss_ext_discount_amt) as total_discount
from
    store_sales ss,
    promotion p
where
    ss_promo_sk = p_promo_sk
    and p_promo_id = [PROMO_ID]
group by
    p_promo_name
having
    sum(ss_ext_discount_amt) > [MIN_DISCOUNT]
order by
    total_discount desc
limit 100;
