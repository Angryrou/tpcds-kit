-- T149.tpl

define CATEGORY = random(1, 10, uniform);
define MIN_TAX = random(500, 2000, uniform);

select
    i_category,
    d_year,
    sum(cs_sales_tax) as total_sales_tax
from
    catalog_sales cs,
    item i,
    date_dim d
where
    cs_item_sk = i_item_sk
    and cs_sold_date_sk = d_date_sk
    and i_category_id = [CATEGORY]
group by
    i_category,
    d_year
having
    sum(cs_sales_tax) > [MIN_TAX]
order by
    total_sales_tax desc
limit 100;
