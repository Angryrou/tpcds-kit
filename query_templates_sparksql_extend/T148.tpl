-- T148.tpl

define PROMO_DISCOUNT = random(0.05, 0.25, uniform);
define MIN_REVENUE = random(5000, 30000, uniform);

select
    p_promo_name,
    sum(ws_sales_price) as promo_revenue
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_discount >= [PROMO_DISCOUNT]
group by
    p_promo_name
having
    sum(ws_sales_price) > [MIN_REVENUE]
order by
    promo_revenue desc
limit 100;
