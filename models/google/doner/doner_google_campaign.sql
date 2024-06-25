with campaigns as (
    select
        campaignname_platform,
        campaignid,
        client,
        property,
        platform,
        cast(getdate() as date) as load_date
    from {{ ref('doner_google_sources') }}
    where conversiontype is null
    group by
        campaignname_platform,
        campaignid,
        client,
        property,
        platform
)

select * from campaigns
