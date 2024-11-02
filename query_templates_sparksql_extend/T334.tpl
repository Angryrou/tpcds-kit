-- T334.tpl

define CATEGORY_ID = random(1, 20, uniform);
define MIN_DISCOUNT = random(1000, 5000, uniform);

select
    i_category,
    sum(cs_ext_discount_amt) as total_category_discount
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY_ID]
group by
    i_category
having
    sum(cs_ext_discount_amt) > [MIN_DISCOUNT]
order by
    total_category_discount desc
limit 100;
