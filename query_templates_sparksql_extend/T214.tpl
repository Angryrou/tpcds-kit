-- T214.tpl

define MONTH = random(1, 12, uniform);
define MAX_TAX = random(500, 2000, uniform);

select
    d_moy,
    sum(ss_sales_tax) as total_tax
from
    store_sales ss,
    date_dim d
where
    ss_sold_date_sk = d_date_sk
    and d_moy = [MONTH]
group by
    d_moy
having
    sum(ss_sales_tax) < [MAX_TAX]
order by
    total_tax asc
limit 100;
