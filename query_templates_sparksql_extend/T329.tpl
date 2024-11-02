-- T329.tpl

define YEAR = random(2001, 2004, uniform);
define MAX_TAX = random(5000, 20000, uniform);

select
    d_year,
    sum(ss_sales_tax) as total_tax
from
    store_sales ss,
    date_dim d
where
    ss_sold_date_sk = d_date_sk
    and d_year = [YEAR]
group by
    d_year
having
    sum(ss_sales_tax) < [MAX_TAX]
order by
    total_tax asc
limit 100;
