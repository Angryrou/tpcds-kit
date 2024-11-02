-- T327.tpl

define PROMO_PERCENT = random(0.05, 0.3, uniform);
define MIN_SALES = random(1000, 5000, uniform);

select
    p_promo_name,
    sum(ws_sales_price) as promo_sales
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_discount >= [PROMO_PERCENT]
group by
    p_promo_name
having
    sum(ws_sales_price) > [MIN_SALES]
order by
    promo_sales desc
limit 100;
