-- T116.tpl

define PROMO_TYPE = random(1, 3, uniform);
define MAX_SALES = random(5000, 25000, uniform);

select
    p_promo_name,
    sum(ws_sales_price) as total_sales
from
    web_sales ws,
    promotion p
where
    ws_promo_sk = p_promo_sk
    and p_promo_type = [PROMO_TYPE]
group by
    p_promo_name
having
    sum(ws_sales_price) < [MAX_SALES]
order by
    total_sales asc
limit 100;
