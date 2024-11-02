-- T105.tpl

define PROMO_PERCENT = random(0.05, 0.25, uniform);
define MIN_PROMO_SALES = random(500, 5000, uniform);

select
    p_promo_name,
    sum(ws_ext_sales_price) as promo_sales
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_discount >= [PROMO_PERCENT]
group by
    p_promo_name
having
    sum(ws_ext_sales_price) > [MIN_PROMO_SALES]
order by
    promo_sales desc
limit 100;
