-- T662.tpl

define PROMO_PERCENT = random(0.1, 0.3, uniform);
define MAX_USAGE = random(300, 1200, uniform);

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
    count(ss_sales_price) < [MAX_USAGE]
order by
    promo_usage asc
limit 100;