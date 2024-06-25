Select
campaignid,
client,
property,
platform,
load_date
from {{ ref('doner_bing_campaigns')}}