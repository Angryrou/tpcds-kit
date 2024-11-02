-- T133.tpl

define MONTH = random(1, 12, uniform);
define MIN_SPEND = random(2000, 10000, uniform);

select
    d_moy,
    sum(cs_net_paid_inc_tax) as monthly_spend
from
    catalog_sales cs,
    date_dim d
where
    cs_sold_date_sk = d_date_sk
    and d_moy = [MONTH]
group by
    d_moy
having
    sum(cs_net_paid_inc_tax) > [MIN_SPEND]
order by
    monthly_spend desc
limit 100;
