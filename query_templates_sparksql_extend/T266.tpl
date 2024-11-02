-- T266.tpl

define MONTH = random(1, 12, uniform);
define MAX_NET_SALES = random(5000, 20000, uniform);

select
    d_moy,
    sum(ss_net_paid) as total_net_sales
from
    store_sales ss,
    date_dim d
where
    ss_sold_date_sk = d_date_sk
    and d_moy = [MONTH]
group by
    d_moy
having
    sum(ss_net_paid) < [MAX_NET_SALES]
order by
    total_net_sales asc
limit 100;
