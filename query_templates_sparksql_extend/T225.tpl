-- T225.tpl

define CATEGORY = random(1, 15, uniform);
define MAX_DISCOUNT = random(500, 2000, uniform);

select
    i_category,
    sum(cs_ext_discount_amt) as total_discount
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    sum(cs_ext_discount_amt) < [MAX_DISCOUNT]
order by
    total_discount asc
limit 100;
