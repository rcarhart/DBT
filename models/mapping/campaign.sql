with campaigns as (
    select
        campaignname_platform,
        campaignid,
        client,
        property,
        platform,
        cast(getdate() as date) as load_date
    from {{ ref('doner') }}
    where conversiontype is null
    group by
        campaignname_platform,
        campaignid,
        client,
        property,
        platform
)

select * from campaigns

