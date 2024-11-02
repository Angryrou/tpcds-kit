-- T368.tpl

define PROMO_PERCENT = random(0.05, 0.25, uniform);
define MIN_USAGE = random(200, 1000, uniform);

select
    p_promo_name,
    count(ss_sales_price) as promo_usage
from
    store_sales ss,
    promotion p
where
    ss_promo_sk = p_promo_sk
    and p_promo_discount >= [PROMO_PERCENT]
group by
    p_promo_name
having
    count(ss_sales_price) > [MIN_USAGE]
order by
    promo_usage desc
limit 100;
