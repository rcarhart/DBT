with metric_conversions as (
    Select
        date,
        adgroupid,
        adid,
        conversiontype,
        conversions,
        client,
        property,
        platform,
        cast(getdate() as date) as load_date
    from {{ ref('doner_google_sources') }}
    where conversiontype is not null
    and conversions > 0
)

Select * from metric_conversions