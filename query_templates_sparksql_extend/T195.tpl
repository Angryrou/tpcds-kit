-- T195.tpl

define MONTH = random(1, 12, uniform);
define MIN_NET_PAID = random(1000, 7000, uniform);

select
    d_moy,
    sum(ss_net_paid_inc_tax) as monthly_spend
from
    store_sales ss,
    date_dim d
where
    ss_sold_date_sk = d_date_sk
    and d_moy = [MONTH]
group by
    d_moy
having
    sum(ss_net_paid_inc_tax) > [MIN_NET_PAID]
order by
    monthly_spend desc
limit 100;
