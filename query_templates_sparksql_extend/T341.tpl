-- T341.tpl

define YEAR = random(1998, 2002, uniform);
define MIN_SALES = random(2000, 10000, uniform);

select
    d_year,
    sum(cs_sales_price) as total_sales
from
    catalog_sales cs,
    date_dim d
where
    cs_sold_date_sk = d_date_sk
    and d_year = [YEAR]
group by
    d_year
having
    sum(cs_sales_price) > [MIN_SALES]
order by
    total_sales desc
limit 100;
