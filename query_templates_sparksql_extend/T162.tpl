-- T162.tpl

define PROMO_TYPE = random(1, 4, uniform);
define MIN_PROMO_REVENUE = random(1000, 8000, uniform);

select
    p_promo_type,
    sum(ws_ext_sales_price) as promo_revenue
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_TYPE]
group by
    p_promo_type
having
    sum(ws_ext_sales_price) > [MIN_PROMO_REVENUE]
order by
    promo_revenue desc
limit 100;
