-- T895.tpl

define PROMO_PERCENT = random(0.05, 0.3, uniform);
define MAX_USAGE = random(300, 1200, uniform);

select
    p_promo_name,
    count(cs_sales_price) as promo_usage
from
    catalog_sales cs,
    promotion p
where
    cs_promo_sk = p_promo_sk
    and p_promo_discount >= [PROMO_PERCENT]
group by
    p_promo_name
having
    count(cs_sales_price) < [MAX_USAGE]
order by
    promo_usage asc
limit 100;
