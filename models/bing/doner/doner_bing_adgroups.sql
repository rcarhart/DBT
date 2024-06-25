with ad_groups as (
    select
    distinct adgroupid,
    adgroupname_platform,
    client,
    property,
    platform,
    campaignid,
    cast(getdate() as date) as load_date
    from {{ ref('doner_bing_sources') }}
)

Select * from ad_groups