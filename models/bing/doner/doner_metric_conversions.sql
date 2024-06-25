Select
    date,
    adid,
    adgroupid,
    cast(conversions as int) as conversions,
    client,
    property,
    platform,
    'Bing' as conversiontype,
    cast(getdate() as date) as load_date
from {{ ref('doner_sources_bing')}}
where conversions > 0