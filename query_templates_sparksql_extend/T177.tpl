-- T177.tpl

define PROMO_PERCENT = random(0.05, 0.20, uniform);
define MIN_REVENUE = random(3000, 12000, uniform);

select
    p_promo_name,
    sum(ws_sales_price) as promo_revenue
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_discount >= [PROMO_PERCENT]
group by
    p_promo_name
having
    sum(ws_sales_price) > [MIN_REVENUE]
order by
    promo_revenue desc
limit 100;
