with reddit_raw as (

    select *
    from {{ ref('reddit_raw') }}
)

SELECT
GET( response , 'title' )::varchar as "title",
GET( response , 'author' )::varchar as "author",
GET( response , 'sub' )::varchar as "sub",
GET( response , 'inserted_at')::float as "inserted_at",
GET( response , 'nsfw')::boolean as "nsfw_bool",
GET( response , 'profanity_flag')::int as "profanity_bool"
FROM reddit_raw
