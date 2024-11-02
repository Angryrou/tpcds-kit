-- T205.tpl

define MONTH = random(1, 12, uniform);
define MIN_NET = random(1000, 5000, uniform);

select
    d_moy,
    sum(cs_net_paid) as total_net_paid
from
    catalog_sales cs,
    date_dim d
where
    cs_sold_date_sk = d_date_sk
    and d_moy = [MONTH]
group by
    d_moy
having
    sum(cs_net_paid) > [MIN_NET]
order by
    total_net_paid desc
limit 100;
