with campaign_attributes as (
    select
        campaignid,
        client,
        property,
        platform,
        cast(getdate() as date) as load_date
    from {{ ref('doner') }}
    where conversiontype is null
    group by
        campaignid,
        client,
        property,
        platform
)

select * from campaign_attributes