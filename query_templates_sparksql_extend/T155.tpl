-- T155.tpl

define ITEM_CLASS = random(1, 10, uniform);
define MAX_REVENUE = random(2000, 10000, uniform);

select
    i_class,
    sum(ws_ext_sales_price) as class_revenue
from
    web_sales ws,
    item i
where
    ws_item_sk = i_item_sk
    and i_class_id = [ITEM_CLASS]
group by
    i_class
having
    sum(ws_ext_sales_price) < [MAX_REVENUE]
order by
    class_revenue asc
limit 100;
