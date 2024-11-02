-- T103.tpl

define COUNTRY_INDEX = random(1, 25, uniform);
define COUNTRY = distmember(countries, [COUNTRY_INDEX], 1);
define MIN_PROFIT = random(5000, 20000, uniform);

select
    ca_country,
    d_year,
    sum(cs_net_profit) as total_profit
from
    catalog_sales cs,
    customer_address ca,
    date_dim d
where
    cs_ship_addr_sk = ca_address_sk
    and cs_sold_date_sk = d_date_sk
    and ca_country = '[COUNTRY]'
group by
    ca_country,
    d_year
having
    sum(cs_net_profit) > [MIN_PROFIT]
order by
    total_profit desc
limit 100;
