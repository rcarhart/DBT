with grouping_cte as (
    select
    row_number() over (partition by adgroupid, adid order by adgroupid, adid) as row_num,
    adgroupid,
    adid,
    client,
    property,
    adname_platform,
    platform
    from {{ ref('doner_bing_sources') }}
),

bing_ads as (
    select
    adgroupid,
    adid,
    client,
    property,
    adname_platform,
    platform,
    cast(getdate() as date) as load_date
    from grouping_cte
    where row_num = 1
)

Select * from bing_ads
