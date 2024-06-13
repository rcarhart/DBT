with adgroup_attributes as (
    select
        adgroupid,
        client,
        property,
        platform,
        cast(getdate() as date) as load_date
    from {{ ref('doner') }}
    where conversiontype is null
    group by
    adgroupid,
    client,
    property,
    platform
    )

select * from adgroup_attributes