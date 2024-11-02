-- T1069.tpl

define CATEGORY = random(1, 10, uniform);
define MAX_DISCOUNT = random(1000, 8000, uniform);

select
    i_category,
    sum(cs_ext_discount_amt) as category_discount
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
    category_discount asc
limit 100;
