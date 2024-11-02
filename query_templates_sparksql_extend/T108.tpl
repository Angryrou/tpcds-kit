-- T108.tpl

define EDUCATION_STATUS = text({"Primary",1},{"Secondary",1},{"College",1},{"Graduate",1});
define MIN_INCOME = random(30000, 100000, uniform);

select
    c_education_status,
    count(*) as customer_count
from
    customer
where
    c_education_status = '[EDUCATION_STATUS]'
    and c_income_band >= [MIN_INCOME]
group by
    c_education_status
order by
    customer_count desc
limit 100;
