-- T249.tpl

define YEAR = random(2001, 2006, uniform);
define MIN_SALES = random(3000, 12000, uniform);

select
    d_year,
    sum(cs_sales_price) as total_yearly_sales
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
    total_yearly_sales desc
limit 100;
