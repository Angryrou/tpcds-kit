-- T557.tpl

define PROMO_LEVEL = random(1, 3, uniform);
define MIN_QUANTITY = random(200, 1000, uniform);

select
    p_promo_name,
    count(ss_sales_price) as promo_quantity
from
    store_sales ss,
    promotion p
where
    ss_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_LEVEL]
group by
    p_promo_name
having
    count(ss_sales_price) > [MIN_QUANTITY]
order by
    promo_quantity desc
limit 100;
