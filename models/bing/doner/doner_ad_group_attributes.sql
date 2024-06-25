Select
adgroupid,
client,
property,
platform,
load_date
from {{ ref('doner_ad_groups') }}