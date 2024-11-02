-- T123.tpl

define MAX_DISCOUNT = random(0.10, 0.30, uniform);
define YEAR = random(2000, 2003, uniform);

select
    d_year,
    i_category,
    avg(ws_discount_amt/ws_ext_sales_price) as avg_discount
from
    web_sales ws,
    item i,
    date_dim d
where
    ws_item_sk = i_item_sk
    and ws_sold_date_sk = d_date_sk
    and d_year = [YEAR]
group by
    d_year,
    i_category
having
    avg(ws_discount_amt/ws_ext_sales_price) < [MAX_DISCOUNT]
order by
    avg_discount asc
limit 100;
