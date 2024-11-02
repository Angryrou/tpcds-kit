-- T140.tpl

define PROMO_ID = random(1, 10, uniform);
define MIN_PROMO_USAGE = random(100, 1000, uniform);

select
    p_promo_id,
    count(ws_sales_price) as usage_count
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_id = [PROMO_ID]
group by
    p_promo_id
having
    count(ws_sales_price) > [MIN_PROMO_USAGE]
order by
    usage_count desc
limit 100;
