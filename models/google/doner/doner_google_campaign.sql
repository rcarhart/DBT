with campaigns as (
    select
        distinct campaignid,
        campaignname_platform,
        client,
        property,
        platform,
        cast(getdate() as date) as load_date
    from {{ ref('doner_google_sources') }}
    where conversiontype is null
)

select * from campaigns
