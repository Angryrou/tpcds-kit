-- T110.tpl

define REVIEW_DATE = date('2001-01-01');
define RATING_THRESHOLD = random(3, 5, uniform);

select
    pr_review_rating,
    count(*) as review_count
from
    product_reviews pr
where
    pr_review_date >= '[REVIEW_DATE]'
    and pr_review_rating >= [RATING_THRESHOLD]
group by
    pr_review_rating
order by
    review_count desc
limit 100;
