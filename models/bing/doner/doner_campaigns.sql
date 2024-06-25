Select
distinct campaignid,
campaignname_platform,
client,
property,
platform,
cast(getdate() as date) as load_date
from {{ ref('doner_sources_bing') }}