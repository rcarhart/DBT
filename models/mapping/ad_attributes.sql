with ad_attributes as (
    select
        adgroupid,
        adid,
        client,
        property,
        platform,
        cast(getdate() as date) as load_date
    from {{ ref('doner') }}
    where conversiontype is null
    group by
    adgroupid,
    adid,
    client,
    property,
    platform
)

select * from ad_attributes