-- T207.tpl

define PROMO_TYPE = random(1, 3, uniform);
define MIN_PROMO_SALES = random(500, 3000, uniform);

select
    p_promo_name,
    sum(ws_sales_price) as promo_sales
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_TYPE]
group by
    p_promo_name
having
    sum(ws_sales_price) > [MIN_PROMO_SALES]
order by
    promo_sales desc
limit 100;
