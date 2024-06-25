with ad_groups as (
    select
    distinct adgroupid,
    adgroupname_platform,
    client,
    property,
    platform,
    campaignid,
    cast(getdate() as date) as load_date
    from {{ ref('doner_sources_bing') }}
)

Select * from ad_groups