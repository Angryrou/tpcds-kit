-- T312.tpl

define YEAR = random(2000, 2004, uniform);
define MAX_DISCOUNT = random(0.1, 0.5, uniform);

select
    d_year,
    avg(ss_discount_amt / ss_sales_price) as avg_discount
from
    store_sales ss,
    date_dim d
where
    ss_sold_date_sk = d_date_sk
    and d_year = [YEAR]
group by
    d_year
having
    avg(ss_discount_amt / ss_sales_price) < [MAX_DISCOUNT]
order by
    avg_discount asc
limit 100;
