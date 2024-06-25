Select
    adgroupid,
    adid,
    client,
    property,
    platform,
    load_date
from {{ ref('doner_ads')}}