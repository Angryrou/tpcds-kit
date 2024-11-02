-- T132.tpl

define CATEGORY = random(1, 20, uniform);
define MIN_SALES = random(5000, 20000, uniform);

select
    i_category,
    sum(ss_ext_sales_price) as category_sales
from
    store_sales ss,
    item i
where
    ss_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    sum(ss_ext_sales_price) > [MIN_SALES]
order by
    category_sales desc
limit 100;
