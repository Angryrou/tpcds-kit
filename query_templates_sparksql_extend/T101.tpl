-- T101.tpl

define YEAR = random(1999, 2002, uniform);
define MONTH = random(1, 12, uniform);
define MIN_SALES = random(1000, 5000, uniform);
define CATEGORY = random(1, 10, uniform);

select
    i_category,
    d_year,
    d_moy,
    sum(ws_ext_sales_price) as total_sales
from
    web_sales ws,
    item i,
    date_dim d
where
    ws_item_sk = i_item_sk
    and ws_sold_date_sk = d_date_sk
    and d_year = [YEAR]
    and d_moy = [MONTH]
    and i_category_id = [CATEGORY]
group by
    i_category,
    d_year,
    d_moy
having
    sum(ws_ext_sales_price) > [MIN_SALES]
order by
    total_sales desc
limit 100;
