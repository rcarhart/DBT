Select
campaignid,
client,
property,
platform,
load_date
from {{ ref('doner_campaigns')}}