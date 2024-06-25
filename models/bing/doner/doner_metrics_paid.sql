with metrics_paid as (
    select
    date,
    platform,
    adgroupid,
    adid,
    cast(clicks as float) as clicks,
    cast(cost as float) as cost,
    cast(impressions as float) as impressions,
    client,
    property,
    cast(getdate() as date) as load_date
    from {{ ref('doner_sources_bing') }}
)
Select * from metrics_paid