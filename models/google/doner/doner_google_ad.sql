with ads as (
    select
        adgroupid,
        adid,
        client,
        property,
        adname_platform,
        platform,
        cast(getdate() as date) as load_date,
        row_number() over (partition by adgroupid, adid order by adgroupid, adid) as row_num
    from {{ ref('doner_google_sources') }}
    where conversiontype is null

),

ads_cte as (
    select
        adgroupid,
        adid,
        client,
        property,
        adname_platform,
        platform,
        load_date
    from ads
    where row_num = 1
)
Select *
from ads_cte