with campaign_attributes as (
    select *
    from {{ ref('doner_bing_campaign_attributes')}}
)

select * from campaign_attributes