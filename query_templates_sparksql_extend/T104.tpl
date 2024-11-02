-- T104.tpl

define MIN_REVENUE = random(10000, 50000, uniform);
define ITEM_CLASS = random(1, 5, uniform);

select
    i_class,
    sum(ss_ext_sales_price) as total_revenue
from
    store_sales ss,
    item i
where
    ss_item_sk = i_item_sk
    and i_class_id = [ITEM_CLASS]
group by
    i_class
having
    sum(ss_ext_sales_price) > [MIN_REVENUE]
order by
    total_revenue desc
limit 100;
