-- T1076.tpl

define PROMO_LEVEL = random(1, 3, uniform);
define MIN_USAGE = random(300, 1200, uniform);

select
    p_promo_name,
    count(ss_sales_price) as promo_usage
from
    store_sales ss,
    promotion p
where
    ss_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_LEVEL]
group by
    p_promo_name
having
    count(ss_sales_price) > [MIN_USAGE]
order by
    promo_usage desc
limit 100;
