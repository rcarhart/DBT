with ad_group as (
    select
        adgroupid,
        adgroupname_platform,
        client,
        property,
        campaignid,
        platform,
        cast(getdate() as date) as load_date
    from {{ ref('doner') }}
    where conversiontype is null
    group by
    adgroupid,
    adgroupname_platform,
    client,
    property,
    campaignid,
    platform
)

select * from ad_group