Select
    date,
    adid,
    adgroupid,
    cast(conversions as float) as conversions,
    client,
    property,
    platform,
    'Bing' as conversiontype,
    cast(getdate() as date) as load_date
from {{ ref('doner_bing_sources')}}
where conversions > 0