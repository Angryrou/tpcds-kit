-- T115.tpl

define COUNTRY_ID = random(1, 25, uniform);
define MIN_PROFIT = random(2000, 15000, uniform);

select
    ca_country,
    d_year,
    sum(cs_net_profit) as net_profit
from
    catalog_sales cs,
    customer_address ca,
    date_dim d
where
    cs_ship_addr_sk = ca_address_sk
    and cs_sold_date_sk = d_date_sk
    and ca_country_id = [COUNTRY_ID]
group by
    ca_country,
    d_year
having
    sum(cs_net_profit) > [MIN_PROFIT]
order by
    net_profit desc
limit 100;
