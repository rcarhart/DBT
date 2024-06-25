with campaign_attributes as (
    select
        campaignid,
        client,
        property,
        platform,
        cast(getdate() as date) as load_date
    from {{ ref('doner_google_campaign') }}
    where conversiontype is null
    group by
        campaignid,
        client,
        property,
        platform
)

select * from campaign_attributes