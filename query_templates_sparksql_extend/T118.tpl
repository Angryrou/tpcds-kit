-- T118.tpl

define YEAR = random(1998, 2003, uniform);
define MIN_QUANTITY = random(20, 100, uniform);

select
    d_year,
    sum(cs_quantity) as total_quantity
from
    catalog_sales cs,
    date_dim d
where
    cs_sold_date_sk = d_date_sk
    and d_year = [YEAR]
group by
    d_year
having
    sum(cs_quantity) > [MIN_QUANTITY]
order by
    total_quantity desc
limit 100;
