with ad_group as (
    select
        distinct adgroupid,
        adgroupname_platform,
        client,
        property,
        campaignid,
        platform,
        cast(getdate() as date) as load_date
    from {{ ref('doner_google_sources') }}
    where conversiontype is null
)

select * from ad_group