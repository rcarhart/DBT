with ad_staging as (
    select
        adgroupid,
        adid,
        client,
        property,
        adname_platform,
        platform,
        cast(getdate() as date) as load_date,
        row_number() over (partition by adgroupid, adid order by adgroupid, adid) as row_num
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

select
adgroupid,
adid,
client,
property,
adname_platform,
platform,
load_date,
row_num
from ad_staging
where row_num = 1
