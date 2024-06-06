with ad_staging as (
    select
        adgroupid,
        adid,
        client,
        property,
        adname_platform,
        platform,
        cast(getdate() as date) as load_date
    from {{ ref('doner') }}
    where conversiontype is null
    group by
    adgroupid,
    adid,
    client,
    property,
    adname_platform,
    platform
)

select * from ad_staging