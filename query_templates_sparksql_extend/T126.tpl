-- T126.tpl

define COUNTRY_INDEX = random(1, 20, uniform);
define COUNTRY = distmember(countries, [COUNTRY_INDEX], 1);
define MIN_TAX = random(200, 1500, uniform);

select
    ca_country,
    d_year,
    sum(ss_sales_tax) as total_tax
from
    store_sales ss,
    customer_address ca,
    date_dim d
where
    ss_customer_sk = ca_address_sk
    and ss_sold_date_sk = d_date_sk
    and ca_country = '[COUNTRY]'
group by
    ca_country,
    d_year
having
    sum(ss_sales_tax) > [MIN_TAX]
order by
    total_tax desc
limit 100;
