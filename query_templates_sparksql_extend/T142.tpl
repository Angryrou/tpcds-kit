-- T142.tpl

define COUNTRY_INDEX = random(1, 30, uniform);
define COUNTRY = distmember(countries, [COUNTRY_INDEX], 1);
define MIN_QUANTITY = random(50, 300, uniform);

select
    ca_country,
    sum(ws_quantity) as total_quantity
from
    web_sales ws,
    customer_address ca
where
    ws_ship_addr_sk = ca_address_sk
    and ca_country = '[COUNTRY]'
group by
    ca_country
having
    sum(ws_quantity) > [MIN_QUANTITY]
order by
    total_quantity desc
limit 100;
