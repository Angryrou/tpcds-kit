-- T122.tpl

define SEASON = random(1, 4, uniform);
define MIN_SALES = random(2000, 10000, uniform);

select
    cs_season,
    sum(cs_ext_sales_price) as seasonal_sales
from
    catalog_sales cs
where
    cs_season = [SEASON]
group by
    cs_season
having
    sum(cs_ext_sales_price) > [MIN_SALES]
order by
    seasonal_sales desc
limit 100;
