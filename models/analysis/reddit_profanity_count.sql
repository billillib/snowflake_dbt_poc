with reddit_stage as (

    select * from {{ ref('reddit_stage') }}
)
SELECT "profanity_bool", count(*) as cnt
FROM reddit_stage
GROUP BY 1
