with campaigns as (
    select *
    from {{ ref('doner_bing_campaigns')}}
)

select * from campaigns

