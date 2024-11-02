-- T274.tpl

define MONTH = random(1, 12, uniform);
define MAX_REVENUE = random(1000, 7000, uniform);

select
    d_moy,
    sum(ss_sales_price) as monthly_revenue
from
    store_sales ss,
    date_dim d
where
    ss_sold_date_sk = d_date_sk
    and d_moy = [MONTH]
group by
    d_moy
having
    sum(ss_sales_price) < [MAX_REVENUE]
order by
    monthly_revenue asc
limit 100;
