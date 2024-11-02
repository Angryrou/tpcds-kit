-- T106.tpl

define MIN_RANK = random(1, 100, uniform);
define MAX_RANK = random(101, 200, uniform);

select
    i_item_id,
    i_item_desc,
    rank() over (order by sum(cs_quantity) desc) as sales_rank
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
group by
    i_item_id,
    i_item_desc
having
    sales_rank between [MIN_RANK] and [MAX_RANK]
order by
    sales_rank
limit 100;
